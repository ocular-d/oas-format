# oas-format

```shell
docker run --rm -v "$(pwd)/spec":/app --name oasft testthedocs/oas-format:1.13.0 api-example.yaml -o test.yaml
```

- Place for OAS file in the /spec dir

Run the container and you will have a file called test.yaml with the new format in the /spec dir
