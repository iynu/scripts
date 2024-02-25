repositoryId=$1
title=$2
body=$3

gh api graphql -f query='
    mutation($repositoryId: ID!, $title: String!, $body: String!) {
        createIssue(input: {
            repositoryId: $repositoryId
            title: $title
            body: $body
        }) {
            issue {
                id
            }
        }
    }
' -F repositoryId="${repositoryId}" -F title="${title}" -F body="${body}" --jq ".data.createIssue.issue.id"