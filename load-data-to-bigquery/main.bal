import ballerina/io;
import ballerina/uuid;
import ballerinax/googleapis.bigquery;

public type SocialMediaInteraction record {|
    string customerId;
    string interactionId;
    string interactionType;
    string timestamp;
    string platform;
    string message;
|};

configurable string bigQueryAccessToken = ?;
configurable string projectId = ?;
configurable string datasetId = ?;
configurable string tableId = ?;

bigquery:Client bigQueryClient = check new ({auth: {token: bigQueryAccessToken}});

public function main() returns error? {
    SocialMediaInteraction[] interactions = check io:fileReadCsv("./resources/interactions.csv");
    bigquery:TabledatainsertallrequestRows[] rows = from var interaction in interactions
        select {insertId: uuid:createType1AsString(), 'json: interaction};
    bigquery:TableDataInsertAllRequest payload = {rows};
    _ = check bigQueryClient->insertAllTableData(projectId, datasetId, tableId, payload);
}
