FROM node:lts-alpine3.16
ENV APP_VERSION=1.10.3

LABEL description="TBD"
LABEL maintainer="sven@testthedocs.org"

# hadolint ignore=DL3018
RUN mkdir -p /app \
    && chown -R node:node /app \
    && apk add --no-cache bash \
    && npm install --location=global openapi-format@${APP_VERSION} \
    && npm cache clean --force

USER node
WORKDIR /app

#ENTRYPOINT [ "bash" ]
ENTRYPOINT [ "openapi-format", "openapi.yaml", "-o", "test.yaml" ]