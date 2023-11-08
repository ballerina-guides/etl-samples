// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.
import ballerina/jballerina.java;
import ballerina/persist;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerinax/persist.sql as psql;

const LEAD_ANALYTICS_DATA = "leadanalyticsdata";

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final mysql:Client dbClient;

    private final map<psql:SQLClient> persistClients;

    private final record {|psql:SQLMetadata...;|} & readonly metadata = {
        [LEAD_ANALYTICS_DATA] : {
            entityName: "LeadAnalyticsData",
            tableName: "LeadAnalyticsData",
            fieldMetadata: {
                id: {columnName: "id"},
                firstName: {columnName: "firstName"},
                lastName: {columnName: "lastName"},
                email: {columnName: "email"},
                phone: {columnName: "phone"},
                company: {columnName: "company"},
                status: {columnName: "status"},
                'source: {columnName: "source"},
                score: {columnName: "score"},
                owner: {columnName: "owner"},
                createdDate: {columnName: "createdDate"},
                lastContactDate: {columnName: "lastContactDate"},
                lastActivity: {columnName: "lastActivity"},
                converted: {columnName: "converted"},
                conversionDate: {columnName: "conversionDate"},
                opportunityAmount: {columnName: "opportunityAmount"},
                opportunityStage: {columnName: "opportunityStage"}
            },
            keyFields: ["id"]
        }
    };

    public isolated function init() returns persist:Error? {
        mysql:Client|error dbClient = new (host = host, user = user, password = password, database = database, port = port, options = connectionOptions);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {[LEAD_ANALYTICS_DATA] : check new (dbClient, self.metadata.get(LEAD_ANALYTICS_DATA), psql:MYSQL_SPECIFICS)};
    }

    isolated resource function get leadanalyticsdata(LeadAnalyticsDataTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get leadanalyticsdata/[string id](LeadAnalyticsDataTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post leadanalyticsdata(LeadAnalyticsDataInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(LEAD_ANALYTICS_DATA);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from LeadAnalyticsDataInsert inserted in data
            select inserted.id;
    }

    isolated resource function put leadanalyticsdata/[string id](LeadAnalyticsDataUpdate value) returns LeadAnalyticsData|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(LEAD_ANALYTICS_DATA);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/leadanalyticsdata/[id].get();
    }

    isolated resource function delete leadanalyticsdata/[string id]() returns LeadAnalyticsData|persist:Error {
        LeadAnalyticsData result = check self->/leadanalyticsdata/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(LEAD_ANALYTICS_DATA);
        }
        _ = check sqlClient.runDeleteQuery(id);
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

