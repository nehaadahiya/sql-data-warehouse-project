# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository.  
This project demonstrates the end-to-end development of a modern data warehouse using SQL Server, designed to enable actionable business insights through robust data modeling and analytics.

---

## 📖 Project Overview

This repository showcases:

- **Data Architecture:** Follows a multi-layered Medallion Architecture (Bronze, Silver, Gold).
- **ETL Pipelines:** Ingest, cleanse, and transform data using SQL scripts.
- **Data Modeling:** Implements a star schema for simplified, performant analytics.
- **Analytics & Reporting:** Enables key business insights using SQL-based analyses.

---

## 🏗️ Data Architecture

The warehouse is structured as follows:

- **Bronze Layer:** Raw data from ERP and CRM systems ingested as-is (CSV format).
- **Silver Layer:** Cleansed, standardized, and integrated data ready for modeling.
- **Gold Layer:** Business-ready, analytics-optimized data modeled using a star schema.

---

## ✨ Star Schema Overview

The star schema in the Gold Layer simplifies analytical queries and supports business reporting. It consists of:

- **Fact Table:** `fact_sales` (stores transactional sales data).
- **Dimension Tables:** `dim_customers`, `dim_products`.

This design reduces query complexity and improves performance, allowing for faster and more intuitive data exploration.

---

## 📄 Data Catalog — Gold Layer

The Gold Layer represents the final, business-facing data model. It enables comprehensive reporting and supports advanced analytics.  

### 1️⃣ `gold.dim_customers`

**Purpose:** Stores detailed customer data to support segmentation and behavior analysis.

| Column          | Type      | Description                                |
|-----------------|-----------|--------------------------------------------|
| customer_key    | INT       | Surrogate key.                             |
| customer_id     | INT       | Source system identifier.                  |
| customer_number | NVARCHAR  | External reference ID.                     |
| first_name      | NVARCHAR  | Customer’s first name.                     |
| last_name       | NVARCHAR  | Customer’s last name.                      |
| country         | NVARCHAR  | Country of residence.                      |
| marital_status  | NVARCHAR  | Marital status (e.g., Single, Married).   |
| gender          | NVARCHAR  | Gender information.                        |
| birthdate       | DATE      | Date of birth.                             |
| create_date     | DATE      | Record creation date.                      |

---

### 2️⃣ `gold.dim_products`

**Purpose:** Stores product details for performance analysis and assortment planning.

| Column              | Type      | Description                                |
|---------------------|-----------|--------------------------------------------|
| product_key         | INT       | Surrogate key.                             |
| product_id          | INT       | Source system identifier.                  |
| product_number      | NVARCHAR  | Structured product code.                   |
| product_name        | NVARCHAR  | Product description.                       |
| category_id         | NVARCHAR  | Category identifier.                       |
| category            | NVARCHAR  | Main product category.                    |
| subcategory         | NVARCHAR  | More detailed classification.             |
| maintenance_required| NVARCHAR  | Maintenance requirement flag.            |
| cost                | INT       | Base cost.                                |
| product_line        | NVARCHAR  | Product line/series.                      |
| start_date          | DATE      | Launch or availability date.              |

---

### 3️⃣ `gold.fact_sales`

**Purpose:** Central table containing sales transactions, linking customers and products.

| Column        | Type      | Description                                |
|---------------|-----------|--------------------------------------------|
| order_number  | NVARCHAR  | Unique sales order identifier.             |
| product_key   | INT       | FK to `dim_products`.                     |
| customer_key  | INT       | FK to `dim_customers`.                    |
| order_date    | DATE      | Order placement date.                      |
| shipping_date | DATE      | Shipment date.                             |
| due_date      | DATE      | Payment due date.                          |
| sales_amount  | INT       | Total transaction value.                   |
| quantity      | INT       | Number of units sold.                      |
| price         | INT       | Unit price.                               |

---

## 🔄 Data Flow Explanation

1. **Data Ingestion (Bronze):** Raw CSV files from ERP and CRM systems are imported into the SQL Server staging schema without modifications.
2. **Data Transformation (Silver):** Data is cleaned, standardized (e.g., resolving duplicates, normalizing codes), and integrated into consolidated tables.
3. **Data Modeling (Gold):** Data is loaded into star schema tables, ready for analytical queries and reporting.

This structured flow ensures traceability, scalability, and clear data lineage.

---

## 💬 Example SQL Queries

Below are sample SQL queries stakeholders might use to generate insights:

```sql
-- Top-selling products
SELECT 
    dp.product_name,
    SUM(fs.sales_amount) AS total_sales
FROM gold.fact_sales fs
JOIN gold.dim_products dp ON fs.product_key = dp.product_key
GROUP BY dp.product_name
ORDER BY total_sales DESC;

-- Customer purchase behavior
SELECT 
    dc.country,
    COUNT(DISTINCT fs.customer_key) AS unique_customers,
    SUM(fs.sales_amount) AS total_revenue
FROM gold.fact_sales fs
JOIN gold.dim_customers dc ON fs.customer_key = dc.customer_key
GROUP BY dc.country
ORDER BY total_revenue DESC;

-- Monthly sales trend
SELECT 
    FORMAT(order_date, 'yyyy-MM') AS sales_month,
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY sales_month;

