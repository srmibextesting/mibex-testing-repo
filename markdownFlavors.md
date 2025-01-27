# MarkDown Flavors

## CommonMark (Standard Markdown)
This is a paragraph with **bold text** and *italic text*.

- Bullet list item 1
- Bullet list item 2

1. Numbered list item 1
2. Numbered list item 2

[Link to example](https://example.com)

> This is a blockquote.

## Markdown Extra

# Footnotes
Here is a sentence with a footnote.[^1]

[^1]: This is the footnote text.

# Definition List
Term 1
: Definition 1

# Table with Alignment
| Left-aligned | Centered   | Right-aligned |
|:-------------|:----------:|--------------:|
| Row 1        | Center     |      Right    |

# Inline HTML
<div class="custom-class">Custom HTML block</div>

## MultiMarkdown
# Metadata Header
Title: MultiMarkdown Example
Author: John Doe
Date: January 27, 2025

# Citations
Here is a reference to a source[@source-key].

# Footnotes
This is a footnote.[^note]
[^note]: Footnote definition.

# Math
Inline math: $E = mc^2$.

Displayed math:
$$
a^2 + b^2 = c^2
$$

## Pandoc Markdown
---
title: "Pandoc Example"
author: "Jane Doe"
date: "2025-01-27"
---

# Cross-References
See Figure [fig:example].

# Divs and Spans
::: {.custom-div}
This is a custom-styled div.
:::

# Inline Math
$E = mc^2$

# Block Math
\[
a^2 + b^2 = c^2
\]

# Citations
Here’s a citation[@doe2025].


## Markua
# Part 1
## Chapter 1
This is the start of a book.

# Image with Caption
![This is a caption](image.png)

# Callouts
> Warning: This is a callout for important information.

# TOC Entry
{part=2, chapter=3}

## Strict Markdown
# Strict Markdown

This is a strict implementation of Markdown. Only core features are supported:
- **Bold** and *Italic* text.
- [Links](https://example.com).
- Code blocks:
    ```
    print("Hello, World!")
    ```
- Blockquotes:
    > This is a blockquote.

##  Wiki Markdown

= Wiki Page Title =

This is a Wiki-style Markdown example.

== Section Header ==
This is a sub-section.

* Bullet point 1
* Bullet point 2

[[Internal Wiki Link|Link Name]]

## Textile (Markdown-Like)
h1. Heading 1

*This text is italic* and **this is bold**.

# Bullet List Item 1
# Bullet List Item 2

"Link to example":https://example.com

## YAML Metadata Example
---
title: "Document Title"
author: "Author Name"
date: "2025-01-27"
output: pdf_document
---

---

## GitHub-Flavored Markdown (GFM)

```markdown
# Heading with a Task List
- [ ] Unchecked item
- [x] Checked item

| Column 1 | Column 2 |
|----------|----------|
| Row 1    | Row 2    |

~~Strikethrough text~~

Here’s an inline code block: `print("Hello, World!")`


## RMarkdown
---
title: "RMarkdown Example"
author: "Data Scientist"
output: html_document
---

# Inline R Code
The mean of 1 and 2 is `r mean(c(1, 2))`.

# R Code Chunk
```{r echo=TRUE}
summary(cars)

