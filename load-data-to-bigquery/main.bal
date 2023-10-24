import ballerina/io;
import ballerinax/googleapis.bigquery;
import ballerina/uuid;

public type LeadAnalyticsData record {|
    string LeadID;
    string FirstName;
    string LastName;
    string Email;
    string Phone;
    string Company;
    string Status;
    string Source;
    float LeadScore;
    string LeadOwner;
    string LeadCreatedDate;
    string LastContactDate;
    string LastActivity;
    string Converted;
    string ConversionDate;
    float OpportunityAmount;
    string OpportunityStage;
|};

configurable string bigQueryAccessToken = ?;
configurable string projectId = ?;
configurable string datasetId = ?;
configurable string tableId = ?;

bigquery:Client bigQueryClient = check new ({auth : {token: bigQueryAccessToken}});

public function main() returns error? {
    LeadAnalyticsData[] leadsData = check io:fileReadCsv("./resources/leads_data.csv");
    bigquery:TabledatainsertallrequestRows[] rows = from var lead in leadsData 
                                                        select {insertId: uuid:createType1AsString(), 'json: lead};
    bigquery:TableDataInsertAllRequest payload = {rows};
    _ = check bigQueryClient->insertAllTableData(projectId, datasetId, tableId, payload);
}
