# Blog Post Creation Guide

This guide will help you create new blog posts for your website quickly and easily.

---

## Quick Start (3 Steps)

### Method 1: Using a Folder (Recommended for posts with images)

```bash
# 1. Create a new folder with your post's slug
mkdir content/regular_post/my-post-title-2025

# 2. Copy the template
cp content/regular_post/_template.md content/regular_post/my-post-title-2025/index.md

# 3. Edit the file
code content/regular_post/my-post-title-2025/index.md
```

### Method 2: Single Markdown File (For simple text-only posts)

```bash
# 1. Copy the template directly
cp content/regular_post/_template.md content/regular_post/my-post-title-2025.md

# 2. Edit the file
code content/regular_post/my-post-title-2025.md
```

---

## Understanding Post Structure

### Option 1: Folder Structure (Best for posts with images/media)
```
content/regular_post/
└── my-post-title-2025/
    ├── index.md              # Your post content
    ├── image1.jpg            # Images referenced in the post
    └── diagram.png           # Other media files
```

**Benefits:**
- Keep all post assets (images, PDFs) in one place
- Clean references: `{{< figure src="image1.jpg" >}}`
- Easy to manage and move

### Option 2: Single File Structure (Best for simple posts)
```
content/regular_post/
└── my-post-title-2025.md     # Standalone post file
```

**Benefits:**
- Simpler for text-only posts
- Faster to create

---

## Front Matter Fields Explained

### ✅ Required Fields

```yaml
title: "Your Post Title Here"        # Appears at top of post and in browser tab
author: admin                         # Leave as "admin" (links to your profile)
date: 2025-02-24                     # Publication date (YYYY-MM-DD format)
slug: my-post-title-2025             # URL slug: site.com/regular_post/this-slug/
```

### 📝 Recommended Fields

```yaml
summary: "Brief 1-2 sentence description"  # Shows in preview cards
tags:                                       # For categorization and SEO
  - Statistics
  - Data Science
  - R Programming
```

### 🎨 Optional Fields

```yaml
subtitle: "A longer subtitle"               # Appears below title
categories: []                              # Additional categorization
featured: false                             # Set to true to highlight post
lastmod: 2025-02-24T10:00:00-06:00         # Auto-generated if omitted

# Featured image (shows in preview cards)
image:
  caption: "Photo credit"
  focal_point: "Center"                    # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  preview_only: false                      # Set true to hide on post page

# Table of contents settings
output:
  blogdown::html_page:
    toc: true                              # Show table of contents
    toc_depth: 4                           # How many heading levels to include
```

---

## Adding Images and Media

### Method 1: Images in Post Folder (Recommended)

1. Save image in your post folder: `content/regular_post/my-post/image.jpg`
2. Reference in post:
   ```markdown
   {{< figure src="image.jpg" alt="Description for accessibility" >}}
   ```

### Method 2: Images in Static Folder

1. Save image in `static/uploads/image.jpg`
2. Reference in post:
   ```markdown
   {{< figure src="/uploads/image.jpg" alt="Description" >}}
   ```

### Method 3: External Images

```markdown
![Alt text](https://example.com/image.jpg)
```

---

## Hugo Shortcodes Reference

Hugo provides powerful shortcodes for rich content:

### Figures with Captions
```markdown
{{< figure src="diagram.png" alt="System architecture" caption="Figure 1: Our proposed system" >}}
```

### YouTube Videos
```markdown
{{< youtube VIDEO_ID >}}
```

### Vimeo Videos
```markdown
{{< vimeo VIDEO_ID >}}
```

### Tweets
```markdown
{{< tweet user="username" id="TWEET_ID" >}}
```

### Highlight Boxes
```markdown
{{< callout note >}}
This is a note callout box.
{{< /callout >}}

{{< callout warning >}}
This is a warning callout box.
{{< /callout >}}
```

---

## Common Formatting Examples

### Code Blocks with Syntax Highlighting

````markdown
```r
# R code example
library(ggplot2)
data <- read.csv("data.csv")
ggplot(data, aes(x=x, y=y)) + geom_point()
```

```python
# Python code example
import pandas as pd
df = pd.read_csv("data.csv")
print(df.head())
```

```bash
# Bash commands
cd my-directory
ls -la
```
````

### Inline Code

Use `single backticks` for inline code: `variable_name`

### Tables

```markdown
| Method | Accuracy | Time |
|--------|----------|------|
| Model A | 95.2% | 10s |
| Model B | 96.8% | 15s |
```

### Math Equations (LaTeX)

Inline: `$E = mc^2$`

Display:
```markdown
$$
\frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$
```

### Footnotes

```markdown
Here's a sentence with a footnote[^1].

[^1]: This is the footnote content.
```

---

## Using Tags Effectively

Hugo automatically creates tag pages. Use consistent tags to help readers find related content:

**Good tag examples:**
```yaml
tags:
  - Statistics
  - Data Science
  - R Programming
  - Machine Learning
  - Transportation Research
  - MATSim
  - Conference
```

**Tag pages are automatically generated:**
- `/tags/statistics/` - Lists all posts tagged "Statistics"
- `/tags/data-science/` - Lists all posts tagged "Data Science"

---

## Testing Your Post Locally

Before pushing to GitHub, test your post locally:

```bash
# Navigate to your site directory
cd shahriarzame.github.io

# Start Hugo development server
hugo server

# Open browser to http://localhost:1313/
```

**What to check:**
- ✅ Post appears on home page (if one of 3 most recent)
- ✅ Post appears on blog page (`/regular_post/`)
- ✅ Post title, summary, and date are correct
- ✅ Images load properly
- ✅ Links work
- ✅ Code formatting is correct
- ✅ Table of contents appears (if enabled)

**Hot reload:** Hugo automatically rebuilds when you save changes!

---

## Publishing Your Post

### Automatic Deployment via GitHub Actions

Simply push your changes to GitHub:

```bash
# Stage your new post
git add content/regular_post/my-post-title-2025/

# Commit with descriptive message
git commit -m "Add new blog post: My Post Title"

# Push to main branch
git push origin main
```

**What happens automatically:**
1. GitHub Actions workflow triggers (`.github/workflows/publish.yaml`)
2. Hugo builds your site (with `--minify` for optimization)
3. Site deploys to GitHub Pages
4. Your post is live in ~2-3 minutes!

**Check deployment status:**
- Go to your repository on GitHub
- Click "Actions" tab
- See the latest workflow run

---

## Post Workflow Checklist

### Before Writing
- [ ] Decide on post title and slug
- [ ] Create folder or file in `content/regular_post/`
- [ ] Copy template file

### While Writing
- [ ] Update front matter (title, date, slug, tags, summary)
- [ ] Write content in Markdown
- [ ] Add images to post folder (if needed)
- [ ] Use proper heading hierarchy (## for main sections, ### for subsections)
- [ ] Add code blocks with proper syntax highlighting
- [ ] Include alt text for images (accessibility)

### Before Publishing
- [ ] Test locally with `hugo server`
- [ ] Check formatting and layout
- [ ] Verify all links work
- [ ] Verify all images load
- [ ] Proofread content
- [ ] Review front matter fields

### Publishing
- [ ] Commit with clear message
- [ ] Push to GitHub
- [ ] Wait for GitHub Actions to complete
- [ ] Visit live site to verify

---

## Troubleshooting

### Post Not Appearing?

**Check date:** Posts with future dates won't appear by default.
```yaml
date: 2025-02-24  # Make sure this is today or earlier
```

**Check file name:**
- Folder structure: Must be named `index.md`
- Single file: Must end with `.md`

### Images Not Loading?

**Check file path:**
```markdown
# ✅ Correct (relative to post folder)
{{< figure src="image.jpg" >}}

# ❌ Wrong
{{< figure src="content/regular_post/my-post/image.jpg" >}}
```

### Build Errors?

**Check YAML syntax:**
- Ensure proper indentation (2 spaces)
- Ensure colons have spaces after them: `title: "Text"`
- Ensure strings with special characters are quoted

**Common fixes:**
```yaml
# ✅ Correct
title: "My Title: A Subtitle"
summary: "It's great!"

# ❌ Wrong (missing quotes)
title: My Title: A Subtitle
summary: It's great!
```

---

## Examples to Reference

### Existing Posts
Look at these existing posts for examples:
- `content/regular_post/heart-2025-tum/index.md` - Conference report with image
- `content/regular_post/ortner_prize_thesis-2025.md` - Single file format

---

## Quick Reference: File Locations

```
shahriarzame.github.io/
├── content/
│   └── regular_post/              # Your blog posts go here
│       ├── _index.md              # Blog list page config (don't edit)
│       ├── _template.md           # Template to copy for new posts
│       ├── README.md              # This guide
│       ├── heart-2025-tum/        # Example: folder structure post
│       │   ├── index.md
│       │   └── heart2025-photo.jpg
│       └── your-new-post-2025/    # Your new post folder
│           ├── index.md           # Your post content
│           └── image.jpg          # Your images
├── config/_default/
│   └── menus.yaml                 # Navigation menu (Blog link)
└── static/
    └── uploads/                   # Alternative location for media
```

---

## Need Help?

- **Hugo Documentation:** https://gohugo.io/documentation/
- **Wowchemy Documentation:** https://wowchemy.com/docs/
- **Markdown Guide:** https://www.markdownguide.org/

---

**Happy blogging! 🚀**
