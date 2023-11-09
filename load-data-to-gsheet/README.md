## Steps to run the sample

### 1. Configuring the Config.toml file
1. Create a `Config.toml` file in the root directory and add the below content.
```toml
refreshToken = "<REFRESH_TOKEN>"
clientId = "<CLIENT_ID>"
clientSecret = "<CLIENT_SECRET>"
```
2. Obtain your tokens using this [link](https://developers.google.com/identity/protocols/oauth2) 
and replace with values in the `Config.toml`.

### 2. Running the sample
Run the following command from the root directory of the sample.
```sh
$ bal run
```
