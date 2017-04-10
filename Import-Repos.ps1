#Read the description here https://github.com/DeV1L/gitlab-vsts-importer

$VSTS_ACCOUNT = "YOUR ACCOUNT NAME HERE"
$VSTS_TOKEN = "YOUR PAT HERE"
$PROJECT = "YOUR TEAM PROJECT HERE"
$REPOLIST = "e:\work\gitlab-vsts-importer\repolist.txt"
$GITLAB_USER = "YOUR USERNAME HERE"
$GITLAB_TOKEN = "YOUR PAT HERE"
$GITLAB_ACCOUNT = "YOUR ACCOUNT NAME HERE"
$GIT_FOLDER = "$env:TMP\gitlab-export"

#Login to VSTS
Add-TeamAccount -Account $VSTS_ACCOUNT -PersonalAccessToken $VSTS_TOKEN

##Get GitLab repositories
#If you don't want to import all of them, just comment two lines below and create file manually
$URL = "https://gitlab.com/api/v4/groups/$($GITLAB_ACCOUNT)?private_token=$($GITLAB_TOKEN)"
(Invoke-RestMethod -Uri $URL -Method Get -ContentType “application/json”).projects.name | Out-File -FilePath $REPOLIST

#Read GitLab repositories from file
$REPOS = (Get-Content $REPOLIST)

#Create temp folder for repositories
if(!(Test-Path -Path $GIT_FOLDER )){
    New-Item -ItemType directory -Path $GIT_FOLDER -Verbose
}

#Clone repositories from GitLab
Foreach ($_ in $REPOS) {
$GIT = "https://"+$GITLAB_USER+":"+"$GITLAB_TOKEN@gitlab.com/$GITLAB_ACCOUNT/$_"
 
$VSTS_EXISTS_REPOS = (Get-GitRepository -ProjectName $PROJECT).Name
if ($VSTS_EXISTS_REPOS.Contains("$_")){
    Write-Verbose "Repository $_ already exist in VSTS" -Verbose
    }
    else {
    Write-Verbose "Start clonning $_" -Verbose
    cd $GIT_FOLDER
    git clone $GIT

    #Create VSTS repository and import
    Add-GitRepository -ProjectName $PROJECT -Name $_
    $NEW_REPO_URL = (Get-GitRepository -ProjectName $PROJECT | Where-Object -Property Name -eq $_).remoteUrl
    cd $GIT_FOLDER\$_
    git remote set-url origin $NEW_REPO_URL
    git push
    Write-Verbose "Repository $_ migrated to $NEW_REPO_URL" -Verbose
    cd $GIT_FOLDER; Remove-Item -Recurse -Force $GIT_FOLDER\$_ -ErrorAction SilentlyContinue
    }
}