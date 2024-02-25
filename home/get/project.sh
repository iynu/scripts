read input

gh api graphql -f query='
  query ($user: String!){
    user(login: $user) {
      projectsV2(first: 20) {
        nodes {
          id
          title
        }
      }
    }
  }' -F user=$input