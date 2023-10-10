import ballerina/io;
import ballerinax/openai.chat;

configurable string openAIKey = ?;

final chat:Client openAiChat = check new ({auth: {token: openAIKey}});

public function main() {
    chat:CreateChatCompletionRequest request = {
        model: "gpt-3.5-turbo",
        messages: [
            {
                role: "user",
                content: string `
            Extract the following details in JSON from the reviews given.
                {
                    good_points: string,
                    baf_points: string,
                    improvement_points: string
                }
            The fields should contain points extracted from all reviews
            Here are the reviews:
            1. I recently ordered a laptop and it was in very good condition and it was delivered it on time.
            But there were some software glitches and I couldn't find enough instructions to troubleshoot them.
            Would be great if they provided more detailed manuals.
            2. The smartphone I ordered arrived with a damaged screen. They need to be careful when packaging.
            3. Extrmely satisfied with my orders. Would suggest this place to anyone.
            4. Everything is great about them expect some deliveries take too long.
            Would suggest improving shipping speed to reduce delays.
        `
            }
        ]
    };
    chat:CreateChatCompletionResponse|error response = openAiChat->/chat/completions.post(request);
    io:println(response);

    // do {
    //     chat:CreateChatCompletionResponse response = check openAiChat->/chat/completions.post(request);
    //     io:println(response);
    //     if response.choices.length() < 1 {
    //         check error("Unable to find any choices in the response.");
    //     }
    //     string content = check response.choices[0].message?.content.ensureType(string);
    //     io:println(content);
    // } on fail error e {
    //     io:println("An error occured while generating the lead.");
    //     io:println(e.message());
    // }
}
