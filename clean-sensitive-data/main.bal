import ballerina/io;

public type Feedback record {|
    string email;
    string helpful;
    string remarks;    
|};

public type Result record {|
    string email;
    int feedback;
    string remarks;
|};

public function standardizeValues(string inputString) returns int {
    string:RegExp yesPattern = re `y|Y|((y|Y)(e|E)(s|S))`;
    if yesPattern.isFullMatch(inputString) {
        return 1;
    }
    string:RegExp noPattern = re `n|N|((n|N)(o|O))`;
    if noPattern.isFullMatch(inputString) {
        return -1;
    }
    return 0;
}

public function isValidEmail(string inputString) returns boolean {
    string:RegExp emailPattern =  re `[A-Za-z0-9\._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]{2,}`;
    return emailPattern.isFullMatch(inputString);
}

public function removeExtraWhiteSpaces(string inputString) returns string {
    string:RegExp extraSpaces = re `\s+`;
    return extraSpaces.replaceAll(inputString, " ");
}

public function main() returns error? {
    Feedback[] feedbacks = check io:fileReadCsv("./resources/feedback.csv");
    Result[] results = [];
    foreach var {email, helpful, remarks} in feedbacks {
        if isValidEmail(email) {
            Result result = {
                email,
                feedback: standardizeValues(helpful),
                remarks: removeExtraWhiteSpaces(remarks)
            };
            results.push(result);
        }
    }
    io:println(results);
}
