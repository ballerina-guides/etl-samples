## Steps to run the sample

### Obtaining SalesForce credentials.
1. Create a [SalesForce account](https://login.salesforce.com/?locale=ap).
2.  Obtain client ID, client secret, refresh token, refresh URL, and base URL, then include them in the `Config.toml` file.

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
$ bal run
```

### Send a request
```
curl -X POST http://localhost:8080/sales/leads/<LEAD_ID> -H "Content-Type: application/json" -d '{"id":"<LEAD_ID>", "name":"<LEAD-NAME>"}'
{"email":"johndoe@email.com", "company":"JohnDoe", "status":"Working - Contacted", "phone":"07643892", "id":"00Q5g00000RFk22EAD", "name":"Johann Gambolputty"}
```
Replace <LEAD-ID> and <LEAD-NAME> with the correct details.