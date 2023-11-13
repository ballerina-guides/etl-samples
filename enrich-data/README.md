## Steps to run the sample

### 1. Configuring the Config.toml file
1. Create a `Config.toml` file in the root directory and add the below content.
```toml
geocodingAPIKey = "<GEOCODING_API_KEY>"  
```
2. Obtain a [Google API key](https://developers.google.com/identity/protocols/oauth2) and replace with `<GEOCODING_API_KEY>`.

### 2. Running the sample
Run the following command from the root directory of the sample.
```sh
$ bal run
```

### 3. Test the sample
```sh
$ curl -X POST -d '{"customerId": "CUST0001", "address": "1600 Amphitheatre Parkway,Mountain View,CA"}' http://localhost:8080/api/v1/customerWithGeoCode
```
