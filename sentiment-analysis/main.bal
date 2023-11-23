import ballerina/http;
import ballerinax/openai.chat;

configurable string openAIKey = ?;

type Feedback record {|
    "POSITIVE"|"NEGATIVE"|"NEUTRAL" feedback;
|};

final chat:Client openAiChat = check new ({auth: {token: openAIKey}});

isolated service /api on new http:Listener(8080) {

    resource function post reviews/sentiement\-analyse(@http:Payload string cutomerReview) 
        returns "POSITIVE"|"NEGATIVE"|"NEUTRAL"|error? {
        chat:CreateChatCompletionRequest request = {
            model: "gpt-3.5-turbo",
            messages: [
                {
                    role: "user",
                    content: string `
                        Analyze the given cutomer review and mention the feedback is positive or negative or netural.
                        Response should be in JSON in below format.
                            {
                               feedback: "POSITIVE"|"NEGATIVE"|"NEUTRAL"
                            }
                        cutomer review: ${cutomerReview}
                    `
                }
            ]
        };
        chat:CreateChatCompletionResponse summary = check openAiChat->/chat/completions.post(request);
        if summary.choices.length() > 0 {
            string content = check summary.choices[0].message?.content.ensureType();
            json jsonFeedback = check content.fromJsonString();
            Feedback feedback = check jsonFeedback.cloneWithType();
            return feedback.feedback;
        }
        return "NEUTRAL";
    }
}
