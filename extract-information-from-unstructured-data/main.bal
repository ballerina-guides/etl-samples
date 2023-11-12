import ballerina/http;
import ballerina/io;
import ballerinax/openai.chat;

configurable string openAIKey = ?;

type SummaryRequest record {|
    string[] reviews;
|};

final chat:Client openAiChat = check new ({auth: {token: openAIKey}});

isolated service /api/reviews on new http:Listener(8080) {
    resource function post summary(SummaryRequest summaryRequest) returns error? {
        chat:CreateChatCompletionRequest request = {
            model: "gpt-3.5-turbo",
            messages: [
                {
                    role: "user",
                    content: string `
                        Extract the following details in JSON from the reviews given.
                            {
                                good_points: string,
                                bad_points: string,
                                improvement_points: string
                            }
                        The fields should contain points extracted from all reviews
                        Here are the reviews:
                        ${string:'join(",", ...summaryRequest.reviews)}
                    `
                }
            ]
        };
        chat:CreateChatCompletionResponse summary = check openAiChat->/chat/completions.post(request);
        if summary.choices.length() > 0 {
            string content = check summary.choices[0].message?.content.ensureType();
            io:println(content);
        }
    }
}
