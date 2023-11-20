import ballerina/http;

configurable string googleapisAPIKey = ?;

type Document record {|
    string 'type = "PLAIN_TEXT";
    string content;
|};

type AnalyseRequest record {|
    string encodingType = "UTF8";
    Document document;
|};

type SentimentResponse record {
    DocumentSentiment documentSentiment;
};

type DocumentSentiment record {|
    float magnitude;
    float score;
|};

final http:Client sentimentClient = check new ("https://language.googleapis.com");

isolated service /api on new http:Listener(8080) {
    resource function post reviews/sentiement\-analyse(@http:Payload string cutomerReview) returns "N"|"P"|error? {
        http:Request request = new;
        AnalyseRequest payload = {document: {content: cutomerReview}};
        request.setPayload(payload);
        SentimentResponse response = check sentimentClient->/v2/documents\:analyzeSentiment.post(request, key=googleapisAPIKey);
        return response.documentSentiment.score < 0.5 ? "N" : "P";
    }
}
