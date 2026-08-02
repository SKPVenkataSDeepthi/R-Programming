# Analyze YouTube Trends with a Dashboard

> An interactive data visualization project exploring YouTube video trends over the past decade using **R**, **ggplot2**, **Plotly**, and **Flexdashboard**.

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Plotly](https://img.shields.io/badge/Plotly-3F4F75?style=for-the-badge&logo=plotly&logoColor=white)
![ggplot2](https://img.shields.io/badge/ggplot2-0099CC?style=for-the-badge)
![Flexdashboard](https://img.shields.io/badge/Flexdashboard-Dashboard-success?style=for-the-badge)

---

## Overview

With millions of videos uploaded every year, YouTube trends continuously evolve. This project analyzes YouTube video statistics to understand how different factors influence engagement and popularity.

The dashboard explores questions such as:

- How has YouTube content changed over the years?
- Which categories receive the most engagement?
- Do shorter titles perform better?
- Is there a relationship between likes and comments?
- Which categories generate the highest number of views?

The project combines **data wrangling**, **feature engineering**, **interactive visualization**, and **dashboard development** to uncover meaningful insights.

---

## Learning Objectives

After completing this project, I was able to:

- Engineer useful features for visualization
- Clean and preprocess real-world datasets
- Create statistical visualizations using **ggplot2**
- Build interactive charts using **Plotly**
- Develop dashboards using **Flexdashboard**
- Analyze relationships between engagement metrics

---

# Tech Stack

- R
- RStudio
- dplyr
- tidyr
- ggplot2
- plotly
- flexdashboard
- corrplot
- fmsb
- ggridges
- treemapify

---

# Dataset

Dataset:

```
videos-stats.csv
```

The dataset contains YouTube video statistics including:

- Title
- Published Date
- Views
- Likes
- Comments
- Category (Keyword)

---

# Data Preprocessing

The following preprocessing steps were performed:

- Imported dataset
- Checked dimensions and structure
- Generated summary statistics
- Identified missing values
- Removed incomplete records
- Converted publication dates
- Created additional analytical features

### Engineered Features

| Feature | Description |
|----------|-------------|
| LikesPer1k | Likes per 1000 views |
| CommentsPer1k | Comments per 1000 views |
| TitleLen | Number of characters in title |
| PubYear | Publication year |

---

# Visualizations

## 1️⃣ Videos Published by Year

**Chart:** Bar Chart

Shows the number of YouTube videos uploaded each year.

---

## 2️⃣ Distribution of Title Length

**Chart:** Histogram

Visualizes how long YouTube titles tend to be.

---

## 3️⃣ Total Comments by Category Over Time

**Chart:** Interactive Plotly Line Chart

Shows engagement trends across different YouTube categories over multiple years.

---

## 4️⃣ Average Title Length Over Time

**Chart:** Interactive Line Chart

Analyzes whether YouTube titles have become shorter over time.

---

## 5️⃣ Average Title Length by Category

**Chart:** Interactive Multi-Line Plot

Compares title length trends across different categories.

---

## 6️⃣ Likes vs Comments per 1000 Views

**Chart:** Interactive Bubble Scatter Plot

Features:

- Bubble size represents views
- Hover tooltips
- Category coloring

Helps identify engagement patterns among categories.

---

## 7️⃣ Correlation Matrix

**Chart:** Heatmap

Examines relationships between:

- Views
- Likes
- Comments
- LikesPer1k
- CommentsPer1k
- Title Length

---

## 8️⃣ Title Length by Category

**Chart:** Box Plot

Compares the distribution of title lengths for each content category.

---

## 9️⃣ Top Categories by Total Views

**Chart:** Horizontal Bar Chart

Ranks categories based on cumulative view count.

---

## 🔟 Radar Chart

Compares average performance of each category across:

- Views
- Likes
- Comments
- LikesPer1k
- CommentsPer1k

---

## 1️⃣1️⃣ Ridgeline Plot

Displays the distribution of title lengths across publication years.

---

## 1️⃣2️⃣ Treemap

Visualizes the contribution of each category to the total view count.

---

# 📈 Dashboard

A static dashboard was developed using **Flexdashboard**, integrating multiple interactive and statistical visualizations into a single analytical report.

Dashboard includes:

- Publication trends
- Engagement metrics
- Interactive Plotly graphs
- Correlation analysis
- Category comparison
- Distribution analysis

---

# Required Packages

```r
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(flexdashboard)
library(corrplot)
library(fmsb)
library(ggridges)
library(treemapify)
```

Install packages if necessary:

```r
install.packages(c(
"dplyr",
"tidyr",
"ggplot2",
"plotly",
"flexdashboard",
"corrplot",
"fmsb",
"ggridges",
"treemapify"
))
```

---

# Project Workflow

```
Load Dataset
      │
      ▼
Data Cleaning
      │
      ▼
Feature Engineering
      │
      ▼
Exploratory Data Analysis
      │
      ▼
Statistical Visualizations
      │
      ▼
Interactive Plotly Charts
      │
      ▼
Dashboard Creation
```

---

# Skills Demonstrated

- Data Cleaning
- Data Wrangling
- Feature Engineering
- Exploratory Data Analysis (EDA)
- Interactive Data Visualization
- Dashboard Development
- Statistical Analysis
- Storytelling with Data
- R Programming

---

# Course Information

**Course:** Analyze YouTube Trends with a Dashboard

**Platform:** IBM Skills Network

**Estimated Duration:** 45 Minutes

**Level:** Intermediate

**Language:** English


---

# Author

**Venkata Sri Deepthi SriKotaPeetambaram**

- Data Analyst | Data Scientist
- Data Visualization Enthusiast
- AI & Machine Learning
- Business Intelligence
- SQL • Python • R • Tableau • Power BI

---

⭐ If you found this project helpful, consider giving the repository a star!
