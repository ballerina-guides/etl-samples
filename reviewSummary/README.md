## Steps to run the sample

### 1. Configuring the Config.toml file
1. Create a `Config.toml` file in the root directory and add the below content.
```toml
openAIKey = "<OPEN_AI_KEY>"
```
2. Create an [OpenAI account](https://platform.openai.com) and obtain 
an [API key](https://platform.openai.com/account/api-keys) and replace with `<OPEN_AI_KEY>`.

### 2. Running the sample
Run the following command from the root directory of the sample.
```sh
$ bal run
```

### 3. Test the sample
```sh
$ curl -X POST http://localhost:8080/api/reviews/summary -H "Content-Type: application/json" -d '{"reviews":["I recently ordered a laptop and it was in very good condition and it was delivered on time. But there were some software glitches and I couldn'\''t find enough instructions to troubleshoot them. Would be great if they provided more detailed manuals.","The smartphone I ordered arrived with a damaged screen. They need to be careful when packaging.","Extrmely satisfied with my orders. Would suggest this place to anyone.","Everything is great about them expect some deliveries take too long. Would suggest improving shipping speed to reduce delays."]}'
```
