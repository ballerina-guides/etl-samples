import ballerina/http;
import ballerina/io;

configurable string apiKey = ?;

type SpellCheckRequest record {|
    string content;
|};

type SaplingRequest record {|
    string key;
    string text;
    string session_id;
|};

type EditBody record {|
    int end;
    string id;
    string replacement;
    string sentence;
    int sentence_start;
    int 'start;
|};

type SaplingResponse record {|
    EditBody[] edits;
|};

final http:Client saplingClient = check new ("https://api.sapling.ai");

isolated service /api/posts on new http:Listener(8080) {
    resource function post spell\-check(SpellCheckRequest request) returns error? {
        SaplingRequest saplingRequest = {
            'key: apiKey,
            text: request.content,
            session_id: "session1"
        };
        SaplingResponse response = check saplingClient->/api/v1/spellcheck.post(saplingRequest);
        int errorCount = 0;
        foreach EditBody edit in response.edits {
            io:println(string `${edit.sentence}: ${edit.replacement}`);
            errorCount = errorCount + 1;
        }
        io:println(string `Total errors: ${errorCount}`);
    }
}
