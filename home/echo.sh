user=`cat ./const/user.txt`

repositoryName=`cat ./const/repositoryName.txt`

repositoryId=$(./get/repositoryByName.sh $user $repositoryName | cut -d " " -f 3)
echo $repositoryId

projectNumber=`cat ./const/projectNumber.txt`
projectId=$(./get/projectIdByNumber.sh $user $projectNumber | cut -d " " -f 3)

echo $projectId

targetIssueNumber=`cat ./var/fetchIssueNumber.txt`

title="#${targetIssueNumber}_DEV pr"
body=`cat ./var/issueBody.txt`

issueId=$(./mutate/createIssue.sh $repositoryId "${title}" "${body}")

echo $issueId

itemId=$(./mutate/connectItemToProject.sh $projectId $issueId | cut -d " " -f 3)

echo $itemId

projectFieldName=`cat ./const/projectFieldName.txt`
projectFieldId=$(./get/projectFieldByName.sh $projectId $projectFieldName | cut -d " " -f 3)

echo $projectFieldId

projectFieldValue=$(./get/issueByNumber.sh $user $repositoryName $targetIssueNumber $projectFieldName)

echo $projectFieldValue

result=$(./mutate/updateProjectField.sh $projectId $itemId $projectFieldId "${projectFieldValue}")

echo $result