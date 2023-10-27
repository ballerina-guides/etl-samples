import ballerina/io;
import ballerinax/github;

configurable string githubAccessToken = ?;

const REPO_OWNER = "ballerina-platform";
const REPO_NAME = "ballerina-lang";

final github:Client githubClient = check new ({
    auth: {
        token: githubAccessToken
    }
});

public function main() returns error? {
    github:IssueFilters filters = {
        labels: ["Type/NewFeature", "Priority/High"],
        states: [github:ISSUE_OPEN]
    };
    stream<github:Issue, github:Error?> openHighPriorityFeatures = check githubClient->getIssues(REPO_OWNER, REPO_NAME, filters);
    check from var feature in openHighPriorityFeatures
        do {
            io:println(feature.title);
        };
}
