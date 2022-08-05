# oas-format

docker run --rm -it -v $(pwd)/spec:/app oasf

docker run --rm -v "$(pwd)/spec":/app --name oasft oasf api-example.yaml -o test.yaml

- Place for OAS file in the /spec dir

Run the container and you will have a file callles test.yaml with the new format in the /spec dir
