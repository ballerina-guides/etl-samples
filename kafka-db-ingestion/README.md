## Steps to run the sample

### 1. Configuring the Config.toml file
1. Create a `Config.toml` file in the root directory and add the below content.
```toml
[kafka_db_ingestion]
host = "localhost"
port = 3306
user = "dbuser"
password = "dbuser"
database = "leads"
```

### 2. Running the kafka and sql services
Run the following command from the root directory of the sample.
```sh
$ docker-compose up
```

### 3. Running the sample
Open a new terminal from the root directory of the sample and run the following command.
```sh
$ bal run
```
