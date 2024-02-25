user=$1
projectNumber=$2

gh api graphql -f query='
  query ($user: String!, $projectNumber: Int!){
    user(login: $user) {
      projectV2(number: $projectNumber) {
        id
      }
    }
  }' -F user=$user -F projectNumber="${projectNumber}" --jq ".data.user.projectV2.id"