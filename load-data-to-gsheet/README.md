## Steps to run the sample

### Obtaining Google sheets credentials
1. Create a [Google account](https://accounts.google.com/signup/v2/createaccount)
2. Obtain your tokens using this [link](https://developers.google.com/identity/protocols/oauth2) and include it in the `Config.toml` file.

### Updating the Config.toml file
```
refreshToken = "<REFRESH_TOKEN>"
clientId = "<CLIENT_ID>"
clientSecret = "<CLIENT_SECRET>"
```

### Running the sample
Run the following command from the root directory of the sample.
```ballerina
$ bal run
```
