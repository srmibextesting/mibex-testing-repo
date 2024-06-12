# What is DevSensei?

DevSensei is a new pull request workflow automation solution integrated into the Code Owners App.

It is for teams who want to:

- reduce the overhead of working with pull requests

- automate workflows in pull requests

- follow and enforce team policies

Examples of such workflows are assigning reviewers or auto-merging pull requests based on configurable conditions.

# How does it work?

DevSensei configuration is [YAML](https://yaml.org/)-based.

Add a `devsensei.yaml` file to the root of your repository for the default branch, and DevSensei will automate your 
pull request workflow.

The configuration file consists of a set of **workflows**. Each workflow is meant to automate specific tasks for the 
pull requests of your team. A workflow includes:

- a name to identify the workflow

- a set of conditions to be met for the actions of the workflow to be executed for a pull request

- a set of actions to be executed when the conditions are met for a pull request

## Example

```js
console.log("testing")
```

Here's an example `devsensei.yaml` that assigns Code Owners for a pull request introducing a new feature where the 
pull request is opened from a branch including the prefix `feature/` with the destination branch being 
`main` or `release`:

```yaml
workflows:
  - name: Add Code Owners
    conditions:
      - source~=feature/*
      - or:
        - destination=main
        - destination~=release/*
    actions:
      - add-codeowners:
        rules: |
          *.js            @@frontendDevs
          devsensei.yaml  @@team
```

# Migration: From Code Owners to DevSensei

## What advantages has DevSensei compared to Code Owners?

- The main advantage of `devsensei.yaml` compared to `CODEOWNERS` is sharing common rules across repositories with 
included `devsensei.yaml` files called "Includes" to reduce duplication and maintenance efforts.

- Another advantage is that common configuration parts (e.g. reusing the list of reviewers) can be shared with 
YAML anchors.

- DevSensei currently only supports a few actions like `add-codeowners`. We will add many more actions in the 
future to automate your pull request workflow. [Let us know](https://support.mibexsoftware.com) what actions 
(e.g. adding PR comments or tasks)  you are looking for.

- `devsensei.yaml` is always read from the **default branch** of your repository, instead of `CODEOWNERS`, which is 
taken from the destination branch of the pull request. This will reduce the maintenance efforts significantly when you 
want to make changes.

## How can I migrate from Code Owners to DevSensei?

To start using DevSensei from your existing `CODEOWNERS` file, you have two options:

1. a) **Automated** migration: migrate your `CODEOWNERS` file to `devsensei.yaml` with the built-in migration support 
     (see button `Download generated devsensei.yaml`).
1. b) **Manual** migration: migrate your `CODEOWNERS` settings to their equivalents in `devsensei.yaml`. 
      For the most part, copy everything except `CODEOWNERS` settings and custom groups from the `CODEOWNERS` file to 
      the `rules` section of `devsensei.yaml`.

    i. For the [settings](https://docs.mibexsoftware.com/codeowners/codeowners-settings-only-data-center), use the 
       alternatives from the `add-codeowners` action, see the Actions paragraph below.

    ii. For the custom Code Owner groups (`e.g. @@@my-group @peter @anna`), use the `custom-groups` section of `add-codeowners`.

2. push the `devsensei.yaml` file to the root directory in the default branch of your repository

3. enable DevSensei under `repository settings -> DevSensei | Code Owners -> DevSensei Workflows -> Enabled`

4. when the app sees a `devsensei.yaml` file, it will use that instead of `CODEOWNERS`.

---
**NOTE**

DevSensei reads the `devsensei.yaml` configuration from the default branch of your repository for every pull request. 
This is in contrast to Code Owners configuration in `CODEOWNERS` file, where it is taken from the destination branch 
of the pull request.

---

Below you can see both a `CODEOWNERS` file and the equivalent `devsensei.yaml` file. This should help you to migrate 
from your Code Owners rules to the new YAML format.

The format of the Code Owners rules is the same, so you can copy that to the rules section of the `add-codeowners` action.

**CODEOWNERS**

```
CODEOWNERS.destination_branch_pattern main
CODEOWNERS.destination_branch_pattern release/*
CODEOWNERS.toplevel.subdirectory_overrides enable
CODEOWNERS.toplevel.assignment_routing random 2
CODEOWNERS.toplevel.create_pull_request_comment disable
CODEOWNERS.toplevel.auto_unapprove_on_change enable
CODEOWNERS.source_branch_exclusion_pattern hotfix/*

@@@MyDevs                @PeterTheHacker  @PeterTheJavaExpert ann@scala.lang @@JSDevs

*                        @PeterTheHacker
*.java                   @PeterTheJavaExpert
*.js                     @PaulTheJSGuru @@JSExperts
"a/path with spaces/*"   docs@example.com
!ci/playgrounds.yml
src/components/**/*.js   @@MyDevs

Check(@@MyDevs >= 2)
```


**devsensei.yaml**

```yaml
shared:
  - custom-groups:
      MyDevs:
        - @PeterTheHacker
        - @PeterTheJavaExpert
        - ann@scala.lang 
        - @@JSDevs
      
workflows:
  - name: Add Code Owners
    conditions:
      - or:
        - destination=main
        - destination~=release/*
      - source~!=hotfix/*
    actions:
      - add-codeowners:
          auto-unapprove-on-change: true      
          assignment-routing:
            random: 2
          custom-groups:
            MyDevs: *MyDevs 
          rules: |
            *                       @PeterTheHacker
            *.java                  @PeterTheJavaExpert
            *.js                    @PaulTheJSGuru @@JSExperts
            "a/path with spaces/*"  docs@example.com
            !ci/playgrounds.yml
            src/components/**/*.js  @@MyDevs
            Check(@@MyDevs >= 2)
```

## Code Owners Settings NOT supported in DevSensei add-codeowners action

| Code Owners feature                               | Why not supported / Alternative? |
|---------------------------------------------------|----------------------------------|
| `CODEOWNERS.toplevel.create_pull_request_comment` | May be added later               |
| `CODEOWNERS.toplevel.subdirectory_override`       | Obsolete with includes           |

---
**NOTE**

To replicate the previous behavior of the sub-dir override feature with DevSensei workflows, you must:
  1. prefix the file patterns with the subdir in the corresponding `add-codeowners` action

  2. exclude the subdirs in the "root" `add-codeowners` actions with a negation rule

Example: if you have `CODEOWNERS` with `subdirectory_override=true` and `module-a/CODEOWNERS`.

  1. prefix file patterns in migrated `add-codeowners` of `module-a` like `module-a/PATTERN`

  2. add `!module-a/` as last rule to migrated root `CODEOWNERS` action to ignore the sub directory of `module-a` 
     in this action

---

# IDE support for DevSensei configuration

The app provides a YAML Schema for the `devsensei.yaml` file. Benefits:

- Auto-completion of YAML keys

- Basic validations (e.g. ensure that a workflow has actions)

- Documentation of YAML elements within the editor

- Showing code examples from the Spec as help

Download the YAML Schema from Bitbucket:

https://YOUR_BITBUCKET/rest/codeowners/1.0/devsensei/schema

Depending on your IDE, map that YAML Schema to files named `devsensei.yaml`.

## IntelliJ IDEA & JetBrains IDE's

1. Go to IntelliJ IDEA (or other Jetbrains IDE) settings

2. Search for `JSON Schema Mappings`

3. Add a new mapping:

    a. Name: `DevSensei Schema file`
    
    b. Schema URL: https://YOUR_BITBUCKET/rest/codeowners/1.0/devsensei/schema
    
    c. Schema version: `JSON Schema version 7`

    d. File: `devsensei.yaml`

## VS Code

VS Code with the [RedHat YAML plugin](https://github.com/redhat-developer/vscode-yaml) can either use an inline reference to the JSON Schema

```yaml
# yaml-language-sever: $schema=https://YOUR_BITBUCKET/rest/codeowners/1.0/devsensei/schema

workflows:
  # ...
```

or have a global mapping within the VS Code settings.json:

```json
{
  "yaml.schemas": {
    "https://YOUR_BITBUCKET/rest/codeowners/1.0/devsensei/schema": [
      "devsensei.yaml"
    ]
  }
}
```

# Reference: devsensei.yaml

## Workflows

Each workflow is meant to automate specific tasks for the pull requests of your team.

### Attributes

#### name

The name of the workflow. Must be unique in a repository.

#### conditions

A set of conditions to be met for the actions of the workflow to be executed for a pull request

#### actions

A set of actions to be executed when the conditions are met for a pull request

#### overrides

A workflow with the same name can be overridden in the main devsensei.yaml file. If so, the workflow object must have 
`overrides=true`. If not, then you will get a validation error for the duplicate names.

`main.yaml`
```yaml
includes:
  - other.yaml
workflows:
  - name: Code Owners
  - name: I am overridden
    overrides: true
```

`other.yaml`
```yaml
workflows:
  - name: Checklist
  - name: I am overridden
```


## Conditions

Conditions define the criteria that must be met so that the actions of a workflow are executed. They allow you to define 
which pull requests should be handled by DevSensei based on various criteria like the draft pull request status, source 
and destination branches, and more.

Syntax for a `condition`:

```
<attribute> <operator> <value>
```

The conditions are implicitly combined with `and`. More complex conditions can be created with `and` and `or` 
logical operators.

Example:

```yaml
conditions:
- or:
    - destination=main
    - destination~=release/*
    - source~!=hotfix/*
```

| Condition Attributes            | Meaning                             |
|---------------------------------|-------------------------------------|
| `source`                        | Source branch of pull request       |
| `destination`                   | Destination branch of pull request  |
| `draft`                         | Is it a draft pull request          |


| Conditions Combination Operator | Meaning                                          |
|---------------------------------|--------------------------------------------------|
| `and`                           | All conditions must be fulfilled                 |
| `or`                            | At least one of the conditions must be fulfilled |    

| Conditions Attributes Operator  | Meaning                                                                                                      |
|---------------------------------|--------------------------------------------------------------------------------------------------------------|
| `~=`                            | [Glob](https://confluence.atlassian.com/bitbucketserver080/branch-permission-patterns-1115142320.html) match |
| `~!=`                           | Glob negative match                                                                                          |    
| `=`                             | Equals                                                                                                       |
| `!=`                            | Not equals                                                                                                   |
| `!` or `not`                    | Negate a boolean attribute                                                                                   |


## Actions

### add-codeowners

Adds Code Owners as reviewers to a pull request.

##### assignment-routing

`random`: n reduce the number of Code Owners that are automatically assigned to a pull request. (opt-in) Currently, 
the only available method of assignment is at random.

```yaml
- add-codeowners:
  assignment-routing:
  random: 2
```

##### rules

The [Code Owners rules](https://docs.mibexsoftware.com/codeowners/owner-rules) and [merge checks](https://docs.mibexsoftware.com/codeowners/merge-checks).
For existing `CODEOWNERS` users, copy your owner rules and the merge checks to the `rules` section.
Note: for sub-directory overrides, check "Not supported settings" section.

```yaml
- add-codeowners:
  rules: |
    *          @jordan jordan@example.com
    /backend/  @@backendies
    /frontend/ @@frontendies
```

##### custom-groups

Define [custom Code Owners groups](https://docs.mibexsoftware.com/codeowners/owner-rules#Ownerrules-CustomGroups).

```yaml
- add-codeowners:
  rules: |
    pipelines.yml           @@admins
    backend/                @@backendies
    src/components/**/*.js  @@frontendies
  custom-groups:
    admins:
      - @bobby
    backendies:
      - @jordan
      - john.doe@localhost.ch
    frontendies:
      - @charly
      - @@admins
```

##### auto-unapprove-on-change

Remove approval if owned code changes.

```yaml
- add-codeowners:
  auto-unapprove-on-change: true
```

## Includes

With `includes`, common Devsensei workflows can be shared both across repositories as well within projects in a monorepo.

To include a `devsensei.yaml` file from another repository, use this syntax:

```yaml
includes:
- repository: shared-configs
  file: project-devsensei.yaml
```

Only repositories of the same Bitbucket project are supported:

When a plain YAML file path is specified, the included file is read from the same repository:

```yaml
includes:
- common/devsensei.yaml
```

- The files are read from the latest commit of the default branch

- YAML Anchors will be resolved per file.

- Only one level of includes are support (no recursion supported)

### YAML Anchors

Use YAML Anchors to define reusable content in the same YAML file.

Example:

```yaml
shared:
- &myanchor
  name: My Anchor
  description: This is a reusable anchor

workflows:
  - *myanchor
```

- Anchors can be used for any content. For example, they can be used to define reusable custom user groups, 
  or conditions.

- Reference must only reference anchors in the same file. It is not possible to define an anchor in one file, and 
  reference it from another file.

- Anchor names cannot contain the `[`, `]`, `{`, `}`, and `,` characters.

- Anchors can be defined anywhere in the file, although we encourage to use the `shared` section at the top of the file 
  for clarity and easier maintenance.
