# Script for migration repositories from GitLab to VSTS

This script imports your Git repositories from GitLab to Visual Studio Team Services (VSTS)

## Requirements

 * [Team](https://github.com/DarqueWarrior/team) module for PowerShell 
 * [Personal access token](https://www.visualstudio.com/en-us/docs/setup-admin/team-services/use-personal-access-tokens-to-authenticate) (PAT) for VSTS account
 * [Personal access token](https://docs.gitlab.com/ee/api/README.html#personal-access-tokens) (PAT) for GitLab account
 * List of GitLab repositories you want to migrate (names only)


## How to use it

##### 1. Install Team PoS module 

```powershell
PS> Install-Module -Name Team
```

##### 2. Create a text file with repositories name you want to migrate from GitLab and set it on the $REPOLIST variaple. See repolist.txt as example

Example:
```
$REPOLIST = "e:\work\gitlab-vsts-importer\repolist.txt"
```
repolist.txt
```
solitaire-webgl
lines
slots-webgl
true-missu-vs-pols-webgl
true-webgl
html5-typescript-game-template
word-search
html5-game-template
word-wind
```

##### 3. Set yor VSTS credatnials:
* Accont name as $VSTS_ACCOUNT
* PAT as $VSTS_TOKEN 
* Team project name as $PROJECT

##### 4. Set yor GitLab credatnials:
* Accont name as $GITLAB_ACCOUNT
* User name as $GITLAB_USER
* PAT as $GITLAB_TOKEN

##### 5. Start script and see the output

You will see output like this

```
VERBOSE: Repository mahjongg-candy-webgl already exist in VSTS
VERBOSE: Repository crossword-native-webgl already exist in VSTS
VERBOSE: Repository mahjongg-classic-webgl already exist in VSTS
VERBOSE: Start clonning bridge-webgl
git : Cloning into 'bridge-webgl'...
 
Checking out files:  42% (314/746)   
Checking out files:  43% (321/746)   
Checking out files:  44% (329/746)   
Checking out files:  45% (336/746)   
Checking out files:  46% (344/746)   
Checking out files:  47% (351/746)   
Checking out files:  48% (359/746)   
Checking out files:  49% (366/746)   
Checking out files:  50% (373/746)   
Checking out files:  51% (381/746)   
Checking out files:  52% (388/746)   
Checking out files:  53% (396/746)   
Checking out files:  54% (403/746)   
Checking out files:  55% (411/746)   
Checking out files:  56% (418/746)   
Checking out files:  57% (426/746)   
Checking out files:  58% (433/746)   
Checking out files:  59% (441/746)   
Checking out files:  60% (448/746)   
Checking out files:  61% (456/746)   
Checking out files:  62% (463/746)   
Checking out files:  63% (470/746)   
Checking out files:  64% (478/746)   
Checking out files:  65% (485/746)   
Checking out files:  66% (493/746)   
Checking out files:  67% (500/746)   
Checking out files:  68% (508/746)   
Checking out files:  69% (515/746)   
Checking out files:  70% (523/746)   
Checking out files:  71% (530/746)   
Checking out files:  71% (535/746)   
Checking out files:  71% (537/746)   
Checking out files:  72% (538/746)   
Checking out files:  73% (545/746)   
Checking out files:  74% (553/746)   
Checking out files:  75% (560/746)   
Checking out files:  76% (567/746)   
Checking out files:  77% (575/746)   
Checking out files:  78% (582/746)   
Checking out files:  79% (590/746)   
Checking out files:  80% (597/746)   
Checking out files:  81% (605/746)   
Checking out files:  82% (612/746)   
Checking out files:  83% (620/746)   
Checking out files:  84% (627/746)   
Checking out files:  85% (635/746)   
Checking out files:  86% (642/746)   
Checking out files:  87% (650/746)   
Checking out files:  88% (657/746)   
Checking out files:  89% (664/746)   
Checking out files:  90% (672/746)   
Checking out files:  91% (679/746)   
Checking out files:  92% (687/746)   
Checking out files:  93% (694/746)   
Checking out files:  94% (702/746)   
Checking out files:  95% (709/746)   
Checking out files:  96% (717/746)   
Checking out files:  97% (724/746)   
Checking out files:  98% (732/746)   
Checking out files:  99% (739/746)   
Checking out files: 100% (746/746)   
Checking out files: 100% (746/746), done.

VERBOSE: Repository bridge-webgl migrated to https://myvstsaccount.visualstudio.com/DefaultCollection/My%20Team%20Project/_git/bridge-webgl
```