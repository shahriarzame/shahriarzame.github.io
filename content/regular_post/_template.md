---
# TEMPLATE FILE - DO NOT BUILD
# Copy this file when creating a new post
# This prevents Hugo from building the template as an actual post
_build:
  render: false
  list: false

# When you copy this template, DELETE the _build section above
# Then fill in the fields below:

title: "Your Post Title Here"
author: admin
date: YYYY-MM-DD
slug: your-post-slug
categories: []
tags:
  - Tag1
  - Tag2
  - Tag3
subtitle: ""
summary: "Brief 1-2 sentence summary that appears in preview cards on the blog page and home page."
authors: []
lastmod: YYYY-MM-DDTHH:MM:SS-06:00
featured: false

# Featured image settings (optional)
image:
  caption: ""
  focal_point: ""
  preview_only: false

projects: []

# Table of contents settings
output:
  blogdown::html_page:
    toc: true
    toc_depth: 4
---

## Introduction

Write your introduction here. This should give readers an overview of what the post is about.

## Section 1

Your content here...

### Subsection 1.1

More detailed content...

## Section 2

Continue your content...

## Conclusion

Wrap up your main points and provide final thoughts.

---

### Tips for Writing Your Post:

**Adding Images:**
```
{{< figure src="image-filename.jpg" alt="Description of image" >}}
```

**Adding Links:**
```
[Link text](https://example.com)
```

**Code Blocks:**
```r
# R code example
data <- read.csv("file.csv")
model <- lm(y ~ x, data = data)
```

**Inline Code:**
Use `inline code` with backticks.

**Lists:**
- Bullet point 1
- Bullet point 2

**Numbered Lists:**
1. First item
2. Second item

**Bold and Italic:**
- **Bold text** using `**text**`
- *Italic text* using `*text*`

**Blockquotes:**
> This is a quoted text
