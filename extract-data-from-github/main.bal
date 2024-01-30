import ballerina/io;
import ballerinax/github;

configurable string githubAccessToken = ?;
configurable string repoOwner = "ballerina-platform";
configurable string repoName = "ballerina-lang";

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
    stream<github:Issue, github:Error?> openFeatures
            = check githubClient->getIssues(repoOwner, repoName, filters);
    check from var feature in openFeatures
        do {
            io:println(feature.title);
        };
}
