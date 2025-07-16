# Data Warehouse and Analytics Project

This project showcases a complete data warehousing and analytics solution — from building a modern data warehouse to delivering actionable business insights. It is designed as a portfolio project to demonstrate strong skills in data engineering and analytics using SQL.

---

## 🏗️ Data Architecture

This project follows the **Medallion Architecture**, structured into three layers:

- **Bronze Layer**: Stores raw data ingested directly from ERP and CRM CSV files into the SQL Server database.
- **Silver Layer**: Cleansed, standardized, and normalized data prepared for analysis.
- **Gold Layer**: Business-ready, analytics-optimized data modeled in a star schema for reporting and insights.

---

## 📖 Project Overview

Key components of this project include:

- **Data Architecture**: Designing a modern data warehouse using Medallion principles.
- **ETL Pipelines**: Building SQL-based pipelines to extract, transform, and load data from source systems into the warehouse.
- **Data Modeling**: Creating fact and dimension tables to support efficient analytical queries.
- **Analytics & Reporting**: Developing SQL queries and reports to provide insights into key business metrics.

---

## 🎯 Who Should Explore This

This project is ideal for:

- SQL Developers
- Data Engineers
- Data Architects
- ETL Pipeline Developers
- Data Analysts looking to strengthen their data engineering skill set

---

## 🛠️ Tools & Resources

- **Datasets**: Provided as CSV files (ERP and CRM data).
- **SQL Server Express**: Database server for hosting the data warehouse.
- **SQL Server Management Studio (SSMS)**: Interface for managing and querying the database.
- **GitHub**: Version control and collaboration.
- **Draw.io**: Diagrams for architecture, data models, and ETL flows.
- **Notion**: Project planning and task tracking (template included).

---

## 🚀 Project Requirements

### Data Engineering: Building the Data Warehouse

**Objective**:  
Develop a modern SQL Server-based data warehouse to consolidate and integrate sales data, enabling analytical reporting and data-driven decision-making.

**Specifications**:

- **Data Sources**: ERP and CRM data in CSV format.
- **Data Quality**: Clean and resolve data quality issues before analysis.
- **Integration**: Combine data sources into a unified, analytics-friendly star schema.
- **Scope**: Focus on the latest data (no historical archiving).
- **Documentation**: Provide clear and accessible data model documentation for business and technical teams.

---

### Data Analysis: Analytics & Reporting

**Objective**:  
Develop SQL-based analyses to deliver insights on:

- Customer behavior
- Product performance
- Sales trends

These insights enable stakeholders to make informed strategic and operational decisions.

Detailed information can be found in `docs/data_catalog.md`.

---

## ✨ Star Schema Overview

The star schema in the Gold Layer simplifies analytical queries and supports business reporting. It consists of:

- **Fact Table:** `fact_sales` (stores transactional sales data).
- **Dimension Tables:** `dim_customers`, `dim_products`.

This design reduces query complexity and improves performance, allowing for faster and more intuitive data exploration.

---
## Credits to @DataWithBaraa
