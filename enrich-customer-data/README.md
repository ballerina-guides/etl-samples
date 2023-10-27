## Steps to run the sample

### Obtaining Google API Key
1. Obtain a [Google API key](https://developers.google.com/maps/documentation/geocoding/get-api-key).

### Updating the Config.toml file
```
geocodingAPIKey = "<GEOCODING_API_KEY>"  
```

### Running the sample
Run the following command from the root directory of the sample.
```ballerina
$ bal run
```

### Send a request
```
POST http://localhost:8080/api/v1/customerWithGeoCode

{
    "customerId": "CUST0001",
    "address": "1600 Amphitheatre Parkway,Mountain View,CA"
}
```