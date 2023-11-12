import ballerina/uuid;
import ballerinax/kafka;

type LeadAnalytics record {|
    string firstName;
    string lastName;
    string email;
    string phone;
    string company;
    string status;
    string 'source;
    float score;
    string owner;
    string createdDate;
    string lastContactDate;
    string lastActivity;
    string converted;
    string conversionDate;
    float opportunityAmount;
    string opportunityStage;
|};

final kafka:ConsumerConfiguration consumerConfiguration = {
    groupId: "lead-uuid",
    topics: ["lead-analytics"],
    pollingInterval: 1,
    autoCommit: false
};

final Client leadsDbClient = check new;

listener kafka:Listener kafkaListener = new (kafka:DEFAULT_URL, consumerConfiguration);

isolated service on kafkaListener {
    remote function onConsumerRecord(kafka:Caller caller, LeadAnalytics[] leadsData) returns error? {
        LeadAnalyticsDataInsert[] insertData = from var lead in leadsData
            select {id: uuid:createType1AsString(), ...lead};
        _ = check leadsDbClient->/leadanalyticsdata.post(insertData);
    }
}
