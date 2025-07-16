

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
