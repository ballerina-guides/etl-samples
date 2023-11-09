## Steps to run the sample

### 1. Configuring the Config.toml file
1. Create a `Config.toml` file in the root directory and add the below content.
```toml
apiKey = "<API_KEY>"
```
2. Create a [Sapling account](https://sapling.ai) and obtain an API key and replace with `<API_KEY>`.

### 2. Running the sample
Run the following command from the root directory of the sample.
```sh
$ bal run
```

### 3. Test the sample
```sh
$ curl -X POST http://localhost:8080/api/posts/spell-check -H "Content-Type: application/json" -d '{"content":"Join us for an exceptional academic experience! We are thrilled to host a dynamic conference showcasing the latest research trends and groundbreaking work in the field. Whether you are an industry professional, a researcher, or an academic enthusiast, this event is not to be missed"}'
```
