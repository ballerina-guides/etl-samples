// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.
import ballerina/jballerina.java;
import ballerina/persist;
import ballerinax/persist.inmemory;

const LEAD_ANALYTICS_DATA = "leadanalyticsdata";
final isolated table<LeadAnalyticsData> key(id) leadanalyticsdataTable = table [];

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final map<inmemory:InMemoryClient> persistClients;

    public isolated function init() returns persist:Error? {
        final map<inmemory:TableMetadata> metadata = {
            [LEAD_ANALYTICS_DATA] : {
                keyFields: ["id"],
                query: queryLeadanalyticsdata,
                queryOne: queryOneLeadanalyticsdata
            }
        };
        self.persistClients = {[LEAD_ANALYTICS_DATA] : check new (metadata.get(LEAD_ANALYTICS_DATA).cloneReadOnly())};
    }

    isolated resource function get leadanalyticsdata(LeadAnalyticsDataTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.inmemory.datastore.InMemoryProcessor",
        name: "query"
    } external;

    isolated resource function get leadanalyticsdata/[string id](LeadAnalyticsDataTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.inmemory.datastore.InMemoryProcessor",
        name: "queryOne"
    } external;

    isolated resource function post leadanalyticsdata(LeadAnalyticsDataInsert[] data) returns string[]|persist:Error {
        string[] keys = [];
        foreach LeadAnalyticsDataInsert value in data {
            lock {
                if leadanalyticsdataTable.hasKey(value.id) {
                    return persist:getAlreadyExistsError("LeadAnalyticsData", value.id);
                }
                leadanalyticsdataTable.put(value.clone());
            }
            keys.push(value.id);
        }
        return keys;
    }

    isolated resource function put leadanalyticsdata/[string id](LeadAnalyticsDataUpdate value) returns LeadAnalyticsData|persist:Error {
        lock {
            if !leadanalyticsdataTable.hasKey(id) {
                return persist:getNotFoundError("LeadAnalyticsData", id);
            }
            LeadAnalyticsData leadanalyticsdata = leadanalyticsdataTable.get(id);
            foreach var [k, v] in value.clone().entries() {
                leadanalyticsdata[k] = v;
            }
            leadanalyticsdataTable.put(leadanalyticsdata);
            return leadanalyticsdata.clone();
        }
    }

    isolated resource function delete leadanalyticsdata/[string id]() returns LeadAnalyticsData|persist:Error {
        lock {
            if !leadanalyticsdataTable.hasKey(id) {
                return persist:getNotFoundError("LeadAnalyticsData", id);
            }
            return leadanalyticsdataTable.remove(id).clone();
        }
    }

    public isolated function close() returns persist:Error? {
        return ();
    }
}

isolated function queryLeadanalyticsdata(string[] fields) returns stream<record {}, persist:Error?> {
    table<LeadAnalyticsData> key(id) leadanalyticsdataClonedTable;
    lock {
        leadanalyticsdataClonedTable = leadanalyticsdataTable.clone();
    }
    return from record {} 'object in leadanalyticsdataClonedTable
        select persist:filterRecord({
            ...'object
        }, fields);
}

isolated function queryOneLeadanalyticsdata(anydata key) returns record {}|persist:NotFoundError {
    table<LeadAnalyticsData> key(id) leadanalyticsdataClonedTable;
    lock {
        leadanalyticsdataClonedTable = leadanalyticsdataTable.clone();
    }
    from record {} 'object in leadanalyticsdataClonedTable
    where persist:getKey('object, ["id"]) == key
    do {
        return {
            ...'object
        };
    };
    return persist:getNotFoundError("LeadAnalyticsData", key);
}

