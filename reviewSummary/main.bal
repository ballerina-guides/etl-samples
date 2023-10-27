import ballerina/http;
import ballerina/io;
import ballerinax/openai.chat;

configurable string openAIKey = ?;

type SummaryRequest record {|
    string[] reviews;
|};

final chat:Client openAiChat = check new ({auth: {token: openAIKey}});

service /api/reviews on new http:Listener(8080) {
    resource function post summary(SummaryRequest summaryRequest) returns error? {
        // Send the model and chat message in request.
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
        do {
            // Call the OpenAI chat completion endpoint and retrive chat completion response.
            chat:CreateChatCompletionResponse SummaryResponse = check openAiChat->/chat/completions.post(request);
            if SummaryResponse.choices.length() == 0 {
                check error("No summary received.");
            }
            string content = check SummaryResponse.choices[0].message?.content.ensureType();
            io:println(content);
        } on fail error e {
            io:println(e.message());
        }
    }
}
