# E-Commerce Conversion Funnel Analysis

## Project Overview

This project analyzes an e-commerce conversion funnel to identify where users drop off during the purchasing journey and determine whether customer segments can explain the low purchase conversion rate.

The objective was not only to calculate metrics but also to investigate the root cause of the conversion loss and provide actionable business recommendations.

---

## Business Problem

An e-commerce company observed that a large number of users browse products but only a small percentage complete a purchase.

The key business question was:

> Where do users drop off in the conversion funnel, and can available customer data explain the conversion loss?

---

## Analytical Approach

To answer this question, I followed a complete analytics workflow:

### 1. Funnel Analysis

I first measured user progression through the purchasing journey:

- Browse
- Add to Cart
- Checkout
- Purchase

The goal was to identify the stage where the largest number of users abandoned the process.

### 2. Segmentation Analysis

Once the main drop-off point was identified, I investigated whether specific customer segments performed differently.

The analysis included:

- Product Category
- Device Type
- Region
- Marketing Channel
- Promotion Usage

### 3. Data Validation

Before building the dashboard, I validated the processed datasets using Python to ensure:

- Dataset consistency
- Dataset dimensions
- Missing value detection

### 4. Dashboard & Communication

The results were presented in an interactive Power BI dashboard designed to communicate findings and support business decision-making.

---

## Key Findings

### Funnel Performance

The analysis revealed a significant loss of users throughout the purchasing journey.

#### Overall Conversion Rate

**10.04%**

#### Largest Drop-Off

**Checkout → Purchase**

Only **29.05%** of users who reached the checkout stage completed their transaction.

#### Users Lost

**8,996 users** did not reach the final purchase stage.

---

### Segmentation Results

Several customer segments were analyzed to identify potential explanations for the conversion loss.

The results showed only minor differences across:

- Product Categories
- Device Types
- Regions
- Marketing Channels
- Promotions

No segment demonstrated a significant enough difference to explain the large drop-off between Checkout and Purchase.

---

## Business Insight

The available data does not explain the conversion loss.

This suggests that the issue is likely caused by factors that are not captured in the dataset, such as:

- Payment process friction
- Technical issues during checkout
- Poor checkout user experience
- Trust or security concerns
- Payment failures

---

## Recommendations

Based on the findings, three areas should be investigated:

### 1. Review Payment Process

Analyze payment methods, transaction flow, and customer trust signals to identify potential barriers to purchase completion.

### 2. Investigate Technical Issues

Monitor payment errors, checkout failures, page loading issues, and other technical problems that may prevent successful transactions.

### 3. Improve Checkout Experience

Reduce friction by simplifying the checkout process and optimizing the user journey.

---

## Dashboard Overview

### Page 1 – Funnel Performance

Focuses on identifying where users leave the purchasing journey.

Key metrics:

- Overall Conversion Rate
- Largest Drop-Off
- Users Lost
- Funnel Visualization

### Page 2 – User Segmentation

Investigates whether customer segments explain the conversion loss.

Key analyses:

- Conversion by Category
- Conversion by Device
- Business Insight Summary

### Page 3 – Recommendations & Next Steps

Presents actionable business recommendations based on the analysis.

---

## Project Workflow

```text
Business Question
        ↓
SQL Data Analysis
        ↓
Python Data Validation
        ↓
Power BI Dashboard
        ↓
Business Recommendations
```

---

## Tools Used

- PostgreSQL
- Python
- Pandas
- Power BI
- Git
- GitHub

---

## Repository Structure

```text
retail-sales-analysis/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── sql/
│   └── analysis.sql
│
├── python/
│   └── analysis.py
│
├── powerbi/
│   └── retail_sales_dashboard.pbix
│
├── screenshots/
│
├── README.md
└── .gitignore
```

---

## Future Improvements

Additional analyses that could be explored include:

- Checkout behavior tracking
- Session-level analysis
- Payment error monitoring
- Customer feedback integration
- Time-based conversion trends

---

## Author

Created by Jama for portfolio and learning purposes.