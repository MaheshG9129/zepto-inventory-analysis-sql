# Zepto SQL Data Analytics Project

## Overview

This project analyzes Zepto's product inventory dataset using SQL. The objective is to perform data cleaning, inventory analysis, pricing analysis, discount evaluation, and revenue estimation to generate actionable business insights.

## Database Design

A relational table named `zepto` was created to store product-level information including:

* SKU ID
* Product Category
* Product Name
* MRP
* Discount Percentage
* Available Quantity
* Discounted Selling Price
* Product Weight
* Stock Status
  ## Project Workflow

Data Collection
↓
Data Cleaning
↓
Exploratory Analysis
↓
Business Insights
↓
Revenue & Inventory Analysis

## Data Cleaning Performed

* Identified null values across all columns.
* Removed products with invalid prices (MRP = 0).
* Converted pricing data from paise to rupees for accurate analysis.

## Exploratory Data Analysis

The project includes:

* Total product count
* Unique category analysis
* Stock vs out-of-stock comparison
* Duplicate product detection
* Product pricing validation

## Business Questions Solved

### 1. Top 10 Best-Value Products

Identified products offering the highest discounts.

### 2. High MRP Products Currently Out of Stock

Found premium products unavailable for purchase.

### 3. Estimated Revenue by Category

Calculated potential revenue using:
Revenue = Discounted Selling Price × Available Quantity

### 4. Premium Products with Low Discounts

Identified products with MRP above ₹500 but discount below 10%.

### 5. Categories with Highest Average Discounts

Ranked categories based on average discount percentage.

### 6. Best Value by Price per Gram

Calculated cost efficiency of products based on weight.

### 7. Product Weight Segmentation

Classified products into:

* Low Weight
* Medium Weight
* Bulk Weight

### 8. Total Inventory Weight by Category

Measured inventory distribution across categories.

## Key SQL Concepts Used

* DDL (CREATE TABLE)
* DML (UPDATE, DELETE)
* Aggregate Functions
* GROUP BY
* HAVING
* CASE Statements
* Data Cleaning Techniques
* Business KPI Analysis
* Sorting and Filtering
* Revenue Estimation

## Technologies Used

* PostgreSQL
* SQL
* Data Analytics

## Outcome

This project demonstrates practical SQL skills used in real-world retail and e-commerce analytics, including inventory management, pricing strategy analysis, discount optimization, and revenue forecasting.
