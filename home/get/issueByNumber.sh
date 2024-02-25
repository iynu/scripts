user=$1
repositoryName=$2
issueNumber=$3
projectFieldName=$4

gh api graphql -f query='
  query ($owner: String!, $repositoryName: String!, $issueNumber: Int!, $projectFieldName: String!){
    repository(owner: $owner, name: $repositoryName) {
        issue(number: $issueNumber) {
            id
            number
            title
            projectItems(first: 20) {
                nodes {
                    fieldValueByName(name: $projectFieldName) {
                        ... on ProjectV2ItemFieldTextValue {
                            id
                            text
                        }
                    }
                }

            }
        }
    }
}' -F owner="${user}" -F repositoryName="${repositoryName}" -F issueNumber="${issueNumber}" -F projectFieldName="${projectFieldName}" --jq ".data.repository.issue.projectItems.nodes[0].fieldValueByName.text"