## Steps to run the sample

### Obtaining an OpenAI key
1. Create an [OpenAI account](https://platform.openai.com).
2. Obtain your [API key](https://platform.openai.com/account/api-keys) and include it in the `Config.toml` file.

### Updating the Config.toml file
```
openAIKey = "<OPEN_AI_KEY>"
```

### Running the sample
Run the following command from the root directory of the sample.
```ballerina
bal run
```

### Send a request
```
POST http://localhost:8080/api/reviews/summary

{
  "reviews": ["I recently ordered a laptop and it was in very good condition and it was delivered it on time.
    But there were some software glitches and I couldn't find enough instructions to troubleshoot them.
    Would be great if they provided more detailed manuals.",
    "The smartphone I ordered arrived with a damaged screen. They need to be careful when packaging.",
    "Extrmely satisfied with my orders. Would suggest this place to anyone.",
    "Everything is great about them expect some deliveries take too long.
    Would suggest improving shipping speed to reduce delays."]
}
```
