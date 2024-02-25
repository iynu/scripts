projectId=$1
itemId=$2

gh api graphql -f query='
        mutation($itemId: ID!, $projectId: ID!) {
            addProjectV2ItemById(input: {
                projectId: $projectId
                contentId: $itemId
            }) {
                item {
                    id
                }
            }
        }
' -F itemId="${itemId}" -F projectId="${projectId}" --jq ".data.addProjectV2ItemById.item.id"