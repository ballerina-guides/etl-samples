import ballerinax/kafka;
import ballerina/time;
import load_data_from_kafka.leads;
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
    time:Date LeadCreatedDate;
    time:Date LastContactDate;
    string LastActivity;
    string Converted;
    string ConversionDate;
    float OpportunityAmount;
    string OpportunityStage;
|};

kafka:ConsumerConfiguration consumerConfiguration = {
    groupId: "lead-uuid",
    topics: ["lead-analytics"],
    pollingInterval: 1,
    autoCommit: false
};

final leads:Client leadsDbClient = check new;

listener kafka:Listener kafkaListener = new (kafka:DEFAULT_URL, consumerConfiguration);

service on kafkaListener {
    remote function onConsumerRecord(kafka:Caller caller, LeadAnalyticsData[] leadsData) returns error? {
        leads:LeadAnalyticsDataInsert[] insertData = from var lead in leadsData 
                                                        select {id: uuid:createType1AsString(), ...lead};
        _ = check leadsDbClient->/leadanalyticsdata.post(insertData);
    }
}

