## Steps to run the sample

### 1. Configuring the Config.toml file
1. Create a `Config.toml` file in the root directory and add the below content.
```toml
openAIToken = "<OPEN_AI_TOKEN>"
```
2. Create a [Open AI](https://platform.openai.com/) account and obtain an API key and replace with `<OPEN_AI_TOKEN>`.

### 2. Running the sample
Run the following command from the root directory of the sample.
```sh
$ bal run -- ./resources/example.txt
```