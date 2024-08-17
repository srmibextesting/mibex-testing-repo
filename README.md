


```mermaid
flowchart LR

subgraph xsrelease[XsRelease]
    jira[JIRA Change]
    cmdb[Jira CMDB]
    DeplRunner[Deployment\nRunner]:::api
    ChangeRegistry[Change\nRegistry]:::api
end
ama[AMA]
ralph[RALPH]
vault[HasihCorp\nVault]
powerbi[Power BI]
subgraph deptools[Deployment Tools]
    direction RL
    AzurePipelines
    TeamCity
    Jenkins
    ...
end

jira -->|Get AmaReport\nDoD & test data| ama 
jira -->|GetAssets\nto fill the form| cmdb
cmdb -->|GetRalphData\nto fill jira assets| ralph
jira -->|Deploy /Release\nchange| DeplRunner
DeplRunner -->|GetCredentials\nfor deployment| vault
DeplRunner -->|Deploy /\nRelease| deptools
deptools -->|Publish\nResults| DeplRunner
DeplRunner -->|Publish\nDeploymentReport| jira
jira -->|Publish\nChangeReport| ChangeRegistry
powerbi -->|Get data for\nreports| ChangeRegistry

classDef api stroke:#0f0
```

# README

It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

</details> 

😀
<details><summary>Change History</summary> 

> A history of significant changes or additions to the product. The change reference would typically be a portfolio reference number, or a Service Now ticket number, and the Github tag associated with the change. 

| Date | Description | Change reference |
| ---------- | ---------------- | ------------------------ |
| 29-Sep-22 | Initial Version    | Portfolio 0860                  |


</details> 

Dimensions | Megapixels
---|---
1,920 x 1,080 | 2.1MP
3,264 x 2,448 | 8MP
4,288 x 3,216 | 14MP


<table border="1">
    <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>John</td>
            <td>Doe</td>
            <td>johndoe@example.com</td>
        </tr>
        <tr>
            <td>Jane</td>
            <td>Smith</td>
            <td>janesmith@example.com</td>
        </tr>
    </tbody>
</table>
