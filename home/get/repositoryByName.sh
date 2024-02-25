user=$1
repositoryName=$2

gh api graphql -f query='
  query ($user: String!, $repositoryName: String!){
    user(login: $user) {
      repository(name: $repositoryName) {
        id
      }
    }
  }' -F user=$user -F repositoryName=$repositoryName --jq ".data.user.repository.id"