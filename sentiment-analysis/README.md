## Steps to run the sample

### 1. Configuring the Config.toml file
1. Create a `Config.toml` file in the root directory and add the below content.
```toml
googleapisAPIKey = "<GOOGLEAPIS_API_KEY>"  
```
2. Obtain a [Google API key](https://console.cloud.google.com/apis/credentials) and replace with `<GOOGLEAPIS_API_KEY>`.

### 2. Running the sample
Run the following command from the root directory of the sample.
```sh
$ bal run
```

### 3. Test the sample
```sh
$ curl -X POST -d 'Amazing food, prompt service!' http://localhost:8080/api/reviews/sentiement-analyse
```
