## Generate the persist client object, types, and scripts

1. Run `$ bal persist generate`.

2. Edit the generated `Config.toml` file to add the database configurations.

```
    [customerOrders]
    host = "localhost"
    port = 3305
    user = "root"
    password = "sqletl123"
    database = "customer_order"
```
The `password` should be replaced with the actual password that will be used for `MYSQL_ROOT_PASSWORD` when setting up the database.

## Setting up the MySQL database on docker

1. Pull the official docker image for MySQL and run it on a docker container

```sh
    docker run --rm -d --name mysql-etl -p 3305:3306 -e MYSQL_ROOT_PASSWORD=sqletl123 mysql:latest
```
Provide a prefered password for `MYSQL_ROOT_PASSWORD`.

2. Execute `$ docker ps` to check if the container is running.

3. Copy the `script.sql` inside the `generated` directory and the `insertData.sql` inside the project root directory to the container.

```sh
    docker cp <path/to/script.sql> mysql-etl:/script.sql
    docker cp <path/to/insertData.sql> mysql-etl:/insertData.sql
```
`<path/to/script.sql>` and `<path/to/insertData.sql>` should be replaced with the actual paths to the script files.

4. Run the MySQL client inside the container and connect to the MySQL server.

```sh
    docker exec -it mysql-etl mysql -uroot -p
```
and enter the password given for `MYSQL_ROOT_PASSWORD` when prompted.

5. Create a new database `customer_order` and use it.

    ```sql
        CREATE DATABASE customer_order;
        USE customer_order;
    ```

6. Execute the `script.sql` file to create the tables and then the `insertData.sql` file to populate the created tables.

```sql
    source script.sql
    source insertData.sql
```

7. Execute `$ bal run` to run the sample.
