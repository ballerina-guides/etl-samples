import ballerina/http;
import ballerinax/salesforce;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;
configurable string baseUrl = ?;

salesforce:ConnectionConfig sfConfig = {
    baseUrl,
    auth: {
        clientId,
        clientSecret,
        refreshToken,
        refreshUrl
    }
};

type LeadInfoRequest record {|
    string id;
    string name;
|};

type EnrichedLead record {|
    *LeadInfoRequest;
    string email;
    string company;
    string status;
    string phone;
|};

type LeadInfoResponse record {
    string Id;
    string Name;
    string Email;
    string Company;
    string Status;
    string Phone;
};

service /sales on new http:Listener(8080) {

    resource function post leads/[string id](LeadInfoRequest req) returns EnrichedLead|error {
        salesforce:Client sfClient = check new (sfConfig);
        // Get selected lead data of given lead ID.
        LeadInfoResponse res = check sfClient->getById("Lead", id,
            ["Id", "Name", "Email", "Company", "Status", "Phone"], LeadInfoResponse);
        return {
            id: id,
            name: req.name,
            email: res["Email"].toString(),
            company: res["Company"].toString(),
            status: res["Status"].toString(),
            phone: res["Phone"].toString()
        };
    }
}
