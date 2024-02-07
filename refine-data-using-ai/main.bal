import ballerina/http;
import ballerina/io;

configurable string openAIToken = ?;
final http:Client openAIClient = check new ("https://api.openai.com", {auth: {token: openAIToken}});

type Message record {
    string role;
    string content;
};

type ChoicesItem record {
    Message message;
};

type OpenAiChatResponse record {
    ChoicesItem[] choices;
};

public function main(string filePath) returns error? {
    string inputString = check io:fileReadString(filePath);

    OpenAiChatResponse response = check openAIClient->/v1/chat/completions.post(
        {
            model: "gpt-3.5-turbo",
            messages: [
                {
                    role: "user",
                    content: "Fix grammar and spelling mistakes."
                },
                {
                    role: "user",
                    content: inputString
                }
            ]
        }
    );

    io:println(string `Corrected: ${response.choices[0].message.content}`);
}
