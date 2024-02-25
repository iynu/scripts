projectId=$1
projectFieldName=$2

gh api graphql -f query='
    query ($projectId: ID!, $projectFieldName: String!) {
        node (id: $projectId) {
            ... on ProjectV2 {
                field(name: $projectFieldName) {
                    ... on ProjectV2Field {
                        id
                    }
                }
            }
        }
    }' -F projectId="${projectId}" -F projectFieldName="${projectFieldName}" --jq ".data.node.field.id"