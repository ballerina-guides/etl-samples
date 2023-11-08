// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

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

public type LeadAnalyticsDataOptionalized record {|
    string id?;
    string firstName?;
    string lastName?;
    string email?;
    string phone?;
    string company?;
    string status?;
    string 'source?;
    float score?;
    string owner?;
    string createdDate?;
    string lastContactDate?;
    string lastActivity?;
    string converted?;
    string conversionDate?;
    float opportunityAmount?;
    string opportunityStage?;
|};

public type LeadAnalyticsDataTargetType typedesc<LeadAnalyticsDataOptionalized>;

public type LeadAnalyticsDataInsert LeadAnalyticsData;

public type LeadAnalyticsDataUpdate record {|
    string firstName?;
    string lastName?;
    string email?;
    string phone?;
    string company?;
    string status?;
    string 'source?;
    float score?;
    string owner?;
    string createdDate?;
    string lastContactDate?;
    string lastActivity?;
    string converted?;
    string conversionDate?;
    float opportunityAmount?;
    string opportunityStage?;
|};

