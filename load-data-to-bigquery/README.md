## Steps to run the sample

### 1. Configuring Big Query Warehouse
1. Create a big query project
2. Create a dataset within the big query project
3. Create a table within the created dataset for the below schema
```
Field Name      |  Type  | Mode
customerId      | STRING | REQUIRED
interactionId   | STRING | REQUIRED
interactionType | STRING | REQUIRED
timestamp       | STRING | REQUIRED
platform        | STRING | REQUIRED
message         | STRING | REQUIRED
```

### 2. Configuring the Config.toml file
1. Create a `Config.toml` file in the root directory and add the below content.
```
bigQueryAccessToken = "<BIG_QUERY_ACCESS_TOKEN>"
projectId = "<PROJECT_ID>"
datasetId = "<DATASET_ID>"
tableId = "<TABLE_ID>"
```
2. Obtain a [Google API key](https://developers.google.com/identity/protocols/oauth2) and replace with `<BIG_QUERY_ACCESS_TOKEN>`.
3. Find the `projectId` from the big query warehouse project and replace with `<PROJECT_ID>`.
4. Find the `datasetId` from the project and replace with `<DATASET_ID>`.
5. FInd the `tableId` from the dataset and replace with `<TABLE_ID>`.

### 3. Running the sample
Run the following command from the root directory of the sample.
```ballerina
$ bal run
```
