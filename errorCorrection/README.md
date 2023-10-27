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
POST http://localhost:8080/api/posts/spellings

{
    "content": "Join us for an exeptional academic experience!
        We are thrilled to host a dynamic conference showcasing the latest research trends
        and groundbreking work in the field. Whether you're an industry profesional, a researcher,
        or an academic enthusiest, this event is not to be missed"
}
