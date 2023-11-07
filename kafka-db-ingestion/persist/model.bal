import ballerina/persist as _;

public type LeadAnalyticsData record {|
    readonly string id;
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
