// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.
import ballerina/jballerina.java;
import ballerina/persist;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerinax/persist.sql as psql;

const CUSTOMER = "customers";
const ORDER_DATA = "orderdata";

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final mysql:Client dbClient;

    private final map<psql:SQLClient> persistClients;

    private final record {|psql:SQLMetadata...;|} & readonly metadata = {
        [CUSTOMER] : {
            entityName: "Customer",
            tableName: "Customer",
            fieldMetadata: {
                customerId: {columnName: "customerId"},
                name: {columnName: "name"},
                email: {columnName: "email"},
                phone: {columnName: "phone"},
                "orders[].orderId": {relation: {entityName: "orders", refField: "orderId"}},
                "orders[].price": {relation: {entityName: "orders", refField: "price"}},
                "orders[].customerCustomerId": {relation: {entityName: "orders", refField: "customerCustomerId"}}
            },
            keyFields: ["customerId"],
            joinMetadata: {orders: {entity: OrderData, fieldName: "orders", refTable: "OrderData", refColumns: ["customerCustomerId"], joinColumns: ["customerId"], 'type: psql:MANY_TO_ONE}}
        },
        [ORDER_DATA] : {
            entityName: "OrderData",
            tableName: "OrderData",
            fieldMetadata: {
                orderId: {columnName: "orderId"},
                price: {columnName: "price"},
                customerCustomerId: {columnName: "customerCustomerId"},
                "customer.customerId": {relation: {entityName: "customer", refField: "customerId"}},
                "customer.name": {relation: {entityName: "customer", refField: "name"}},
                "customer.email": {relation: {entityName: "customer", refField: "email"}},
                "customer.phone": {relation: {entityName: "customer", refField: "phone"}}
            },
            keyFields: ["orderId"],
            joinMetadata: {customer: {entity: Customer, fieldName: "customer", refTable: "Customer", refColumns: ["customerId"], joinColumns: ["customerCustomerId"], 'type: psql:ONE_TO_MANY}}
        }
    };

    public isolated function init() returns persist:Error? {
        mysql:Client|error dbClient = new (host = host, user = user, password = password, database = database, port = port, options = connectionOptions);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            [CUSTOMER] : check new (dbClient, self.metadata.get(CUSTOMER), psql:MYSQL_SPECIFICS),
            [ORDER_DATA] : check new (dbClient, self.metadata.get(ORDER_DATA), psql:MYSQL_SPECIFICS)
        };
    }

    isolated resource function get customers(CustomerTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get customers/[string customerId](CustomerTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post customers(CustomerInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(CUSTOMER);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from CustomerInsert inserted in data
            select inserted.customerId;
    }

    isolated resource function put customers/[string customerId](CustomerUpdate value) returns Customer|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(CUSTOMER);
        }
        _ = check sqlClient.runUpdateQuery(customerId, value);
        return self->/customers/[customerId].get();
    }

    isolated resource function delete customers/[string customerId]() returns Customer|persist:Error {
        Customer result = check self->/customers/[customerId].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(CUSTOMER);
        }
        _ = check sqlClient.runDeleteQuery(customerId);
        return result;
    }

    isolated resource function get orderdata(OrderDataTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get orderdata/[string orderId](OrderDataTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post orderdata(OrderDataInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ORDER_DATA);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from OrderDataInsert inserted in data
            select inserted.orderId;
    }

    isolated resource function put orderdata/[string orderId](OrderDataUpdate value) returns OrderData|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ORDER_DATA);
        }
        _ = check sqlClient.runUpdateQuery(orderId, value);
        return self->/orderdata/[orderId].get();
    }

    isolated resource function delete orderdata/[string orderId]() returns OrderData|persist:Error {
        OrderData result = check self->/orderdata/[orderId].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ORDER_DATA);
        }
        _ = check sqlClient.runDeleteQuery(orderId);
        return result;
    }

    remote isolated function queryNativeSQL(sql:ParameterizedQuery sqlQuery, typedesc<record {}> rowType = <>) returns stream<rowType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor"
    } external;

    remote isolated function executeNativeSQL(sql:ParameterizedQuery sqlQuery) returns psql:ExecutionResult|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor"
    } external;

    public isolated function close() returns persist:Error? {
        error? result = self.dbClient.close();
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }
}

