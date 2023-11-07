## Steps to run the sample

### Obtaining an API key
1. Create a [Sapling account](https://sapling.ai).
2. Obtain an API key an include it in the `Config.toml` file.
```
apiKey = "<API_KEY>"
```

### Running the sample
Run the following command from the root directory of the sample.
```ballerina
$ bal run
```

### Send a request
```
curl -X POST http://localhost:8080/api/posts/spell-check -H "Content-Type: application/json" -d '{"content":"Join us for an exceptional academic experience! We are thrilled to host a dynamic conference showcasing the latest research trends and groundbreaking work in the field. Whether you are an industry professional, a researcher, or an academic enthusiast, this event is not to be missed"}'
```
