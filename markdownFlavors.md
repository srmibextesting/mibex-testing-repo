# MarkDown Flavors

## CommonMark (Standard Markdown)
# Level 1 Header

This is a paragraph with **bold** and *italic*.

- Unordered list
  - Secondary item

1. Ordered list
2. Second item

[Link to Google](https://www.google.com)

## GFM Markdon 
# Level 1 Header

- [x] Completed task
- [ ] Pending task

| Column 1 | Column 2 |
|-----------|-----------|
| Value 1   | Value 2   |
| Value 3   | Value 4   |

```python
def greet():
    print("Hello, World!")
```

[Link to GitHub](https://github.com)


## Markdown Extra
# Level 1 Header

## Table

Name | Age
-------|-----
Luis   | 25
Ana    | 30

## Definition List

Term
: Definition of the term



## MultiMarkdown
% Document Title
% Author
% Date

# Level 1 Header

This is a paragraph with a mathematical formula: \( E = mc^2 \).

## Footnotes

Here goes a footnote[^1].

[^1]: This is a footnote in MultiMarkdown.

## R Markdown 
---
title: "Document Title"
author: "Author"
output: html_document
---

# Data Analysis

```{r}
summary(cars)
```

The analysis of the car data is presented above.
