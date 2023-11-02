## Steps to run the sample

### Configuring Big Query
1. Obtain a [Google API key](https://developers.google.com/identity/protocols/oauth2).
2. Create a big query project
3. Create a dataset within the big query project
4. Create a table within the created dataset for the below schema
```
Field Name      |  Type  | Mode
customerId      | STRING | REQUIRED
interactionId   | STRING | REQUIRED
interactionType | STRING | REQUIRED
timestamp       | STRING | REQUIRED
platform        | STRING | REQUIRED
message         | STRING | REQUIRED
```

### Updating the Config.toml file
```
bigQueryAccessToken = "<BIG_QUERY_ACCESS_TOKEN>"
projectId = "<PROJECT_ID>"
datasetId = "<DATASET_ID>"
tableId = "<TABLE_ID>"
```

### Running the sample
Run the following command from the root directory of the sample.
```ballerina
$ bal run
```
