projectId=$1
projectItemId=$2
projectFieldId=$3
value=$4

gh api graphql -f query='
        mutation($itemId: ID!, $projectId: ID!, $fieldId: ID!, $value: String!) {
            updateProjectV2ItemFieldValue(input: {
                projectId: $projectId
                itemId: $itemId
                fieldId: $fieldId
                value: {
                    text: $value
                }
            }) {
                projectV2Item {
                    id
                }
            }
        }
' -F itemId=${projectItemId} -F projectId="${projectId}" -F fieldId="${projectFieldId}" -F value="${value}"