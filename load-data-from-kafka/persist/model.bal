import ballerina/persist as _;
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
