## Steps to run the sample

### 1. Configuring the Config.toml file
1. Create a `Config.toml` file in the root directory and add the below content.
```toml
[extract_data_from_database]
host = "localhost"
port = 3306
user = "root"
password = "sqletl123"
database = "customer_order"
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
