## Generate the persist client object, types, and scripts

1. Run `$ bal persist generate`.

2. Edit the generated `Config.toml` file to add the database configurations.

```
    [customerOrders]
    host = "localhost"
    port = 3306
    user = "root"
    password = "sqletl123"
    database = "customer_order"
```
`password` should be replaced with the actual password that will be used for `MYSQL_ROOT_PASSWORD` when setting up the database.

## Setting up the MySQL database on docker

1. To pull the official docker image for MySQL and run it on a docker container, run

```sh
    $ docker compose up
```
This will execute the `docker-compose.yml` file inside the package directory and set up the `customer_order` database with all tables and entries. Make sure to provide the prefered password for `MYSQL_ROOT_PASSWORD` inside the `docker-compose.yml` file.

2. Execute `$ docker ps` to check if the container is running.

3. Execute `$ bal run` to run the sample.
