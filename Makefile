# The shell we use
SHELL := /bin/bash

# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`

# Vars
NAME = testthedocs/oas-format
VERSION := $(shell grep 'ENV APP_VERSION' Dockerfile | cut -d "=" -f2)
#DOCKER := $(bash docker)

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
.PHONY: help
help: ## This help message
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[35m\1\\x1b[m:\2/' | column -c2 -t -s :)"

.PHONY: init
init: ## Initialize project
	@echo "$(YELLOW)==> Initialize project$(RESET)"
	@pre-commit install

.PHONY: check_release_version
check_release_version:
	@if docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(RED)$(NAME) version $(VERSION) is already build !$(RESET)"; false; fi

.PHONY: push
push: ## Push image
	@docker push $(NAME):$(VERSION)

.PHONY: build
build: ## Build Docker image
	@docker build --no-cache=true -t $(NAME):$(VERSION) -f Dockerfile .

.PHONY: show-version
show-version: #Show version
	@echo "Version is $(VERSION)"
