## Steps to run the sample

### Obtaining SalesForce credentials.
1. Create a [SalesForce](https://login.salesforce.com/?locale=ap).
2. Obtain client ID, client secret, refresh token, refresh URL and base URL and include them in the `Config.toml` file.

### Updating the Config.toml file
```
clientId = "<CLIENT_ID>"
clientSecret = "<CLIENT-SECRET>"
refreshToken = "<REFRESH-TOKEN>"
refreshUrl = "<REFRESH_URL>"
baseUrl = "<BASE_URL>"
```

### Running the sample
Run the following command from the root directory of the sample.
```ballerina
bal run
```

### Send a request
```
POST http://localhost:8080/sales/leads/<LEAD_ID>

{
    "id": "<LEAD-ID>",
    "name": "<LEAD-NAME>"
}
```
