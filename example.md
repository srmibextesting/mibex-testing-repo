[Relative Link](defender_rocket.png)

[Absolute Link](https://bitbucket.org/srtestaudit/jupyter-viewer-for-confluence-cloud/src/master/defender_rocket.png)

[Other Relative Link](src/globe_poor.png)

[File Relative Link](src/example.md)

MARKDOWN IMAGE
![Image Link](defender_rocket.png)

IMAGE HTML TAG with width
<img src="defender_rocket.png" alt="Alt text" width="800">

MARKDOWN IMAGE with width
![Image Link with Size](defender_rocket.png){width=800 height=800}

To create a new task, use `+task+` followed by the task description.
Bitbucket markdown (https://confluence.atlassian.com/bitbucketserver/markdown-syntax-guide-776639995.html) is supported.
To create a reminder (a non-blocking comment), use `+comment+` followed by the comment text
```
+task+ No local configuration (passwords, comments, debugging) has been committed.
```
---
To filter when a task is applied, prepend the task/comment/title with one or more of the following filters:
- '--source' - the source branch
- '--target' - the target/destination branch
- '--files' - diff file pattern, similar to .gitignore
- '--source-except' - all pull requests except those matching this pattern

When more than one task has the same filter settings, these are grouped as a checklist.
Note: entries with the same filter settings will be grouped together, regardless of position in file

To name a checklist, create a line entry with the desired filter settings and +title+ Your Checklist Title
```
--target master +title+ **[CHECKLISTBUDDY](https://marketplace.atlassian.com/apps/1225571/pull-request-checklist-buddy-for-bitbucket?hosting=datacenter&tab=overview) release checklist** :checkered_flag:
--target master +task+ Bump version number
--target master +task+ [Internal release testing](https://wiki/display/CHECKLISTBUDDY/Releases): All [test cases](https://wiki/display/CHECKLISTBUDDY/Manual+testing) have been :white_check_mark: off on the release page or have been confirmed by the team for ignoring
--target master +task+ Each test case is annotated with the date of testing and the tester's name
--target master +task+ [Jira version](https://jira/projects/CHECKLISTBUDDY?selectedItem=com.atlassian.jira.jira-projects-plugin%3Arelease-page&status=released-unreleased): description is updated
--target master +task+ Fix version on all issues, remove version from unfinished issue
--target master +task+ [Public documentation](https://mibexsoftware.atlassian.net/wiki/spaces/CB) and [Public release notes](https://mibexsoftware.atlassian.net/wiki/spaces/CB/pages/3000401921) are up to date
--target master +task+ Social media announcement is scheduled
--target master +comment+ All done? merge PR with --ff-only .
```
---
Use diff file pattern to only apply checklists for certain file types
```
--files /src/main/app/** +title+ Frontend testing checklist :art:
--files /src/main/app/** +task+ UI changes visually inspected on Chrome
--files /src/main/app/** +task+ UI changes visually inspected on Safari 
--files /src/main/app/** +task+ UI changes visually inspected on Firefox
--files /src/main/app/** +task+ UI changes visually inspected on IE/Edge (reply with version)

# Extra reminder, because the settings page is fragile
--files /src/main/app/gsettings-page/** +task+ Open the [settings page](https://link-top-page) of our app and check it the visuals :mag: are correct
```
---
You can filter by branches for appropriate task
```
--target master --source feature/* +task+ User Documentation updated?
--target bugfix/*                  +task+ Is there a automated test reproducing this issue
             
--target release/* --source-except bugfix/* +task+ Double check with the Release Manager if this change is required for the release.
--target release/* --source release/*       +task+ Double check that the pull request is from older to a newer release
```

@startuml
Alice -> Bob: Authentication Request
Bob --> Alice: Authentication Response
@enduml
