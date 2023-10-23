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

type LeadInfoRequst record {|
    string id;
    string name;
|};

type EnrichedLead record {|
    string id;
    string name;
    string email;
    string company;
    string status;
    string phone;
|};

service /sales on new http:Listener(8080) {

    resource function post leads/[string id](LeadInfoRequst req) returns EnrichedLead|error {
        salesforce:Client baseClient = check new (sfConfig);
        record {} res = check baseClient->getById("Lead", id, ["Id", "Name", "Email", "Company", "Status", "Phone"]);
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
