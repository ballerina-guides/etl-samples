// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.
import ballerina/time;

public type LeadAnalyticsData record {|
    readonly string id;
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

public type LeadAnalyticsDataOptionalized record {|
    string id?;
    string LeadID?;
    string FirstName?;
    string LastName?;
    string Email?;
    string Phone?;
    string Company?;
    string Status?;
    string Source?;
    float LeadScore?;
    string LeadOwner?;
    time:Date LeadCreatedDate?;
    time:Date LastContactDate?;
    string LastActivity?;
    string Converted?;
    string ConversionDate?;
    float OpportunityAmount?;
    string OpportunityStage?;
|};

public type LeadAnalyticsDataTargetType typedesc<LeadAnalyticsDataOptionalized>;

public type LeadAnalyticsDataInsert LeadAnalyticsData;

public type LeadAnalyticsDataUpdate record {|
    string LeadID?;
    string FirstName?;
    string LastName?;
    string Email?;
    string Phone?;
    string Company?;
    string Status?;
    string Source?;
    float LeadScore?;
    string LeadOwner?;
    time:Date LeadCreatedDate?;
    time:Date LastContactDate?;
    string LastActivity?;
    string Converted?;
    string ConversionDate?;
    float OpportunityAmount?;
    string OpportunityStage?;
|};

