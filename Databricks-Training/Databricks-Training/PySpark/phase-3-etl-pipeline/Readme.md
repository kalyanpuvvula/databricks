# 🚀 SQL to PySpark – Phase 3 (Final ETL & Pipeline)

## 📌 Objective

The goal of this phase is to understand the **ETL (Extract, Transform, Load)** process using **PySpark** and **Spark SQL**. This project focuses on reading data from multiple file formats, cleaning and transforming data, and generating business insights using Spark Playground sample datasets.

---

## 📂 Datasets Used

-  `customers.csv`
-  `sales.csv`
-  `products.json`
-  `titanic.parquet`

> All datasets are available in the `/samples/` directory of Spark Playground.

---


# 🔄 ETL Workflow

## 📥 Extract

- Read customer and sales data from CSV files.
- Read JSON, ORC, and Parquet datasets.
- Inspected data using `show()` and `printSchema()`.

---

## 🔄 Transform

- Identified missing values.
- Removed invalid records using `dropna()`.
- Converted `total_amount` to `Double`.
- Filtered invalid records.
- Joined multiple datasets.
- Performed aggregations and transformations.

---



# 📋 Hands-on Ingestion Tasks

-  Read CSV files
-  Inspect schema using `show()` and `printSchema()`
-  Identify missing values
-  Clean data using `dropna()`
-  Filter invalid records
-  Read JSON dataset
-  Read ORC dataset
-  Read Parquet dataset

---

# 📊 Business Pipeline Exercises

###  1. Daily Sales

Calculated the **total sales for each day** from the sales dataset.

###  2. City-wise Revenue

Calculated the **total revenue generated from each city**.

###  3. Repeat Customers

Identified customers who placed **more than two orders**.

###  4. Highest Spending Customer in Each City

Used **Window Functions** to identify the customer with the highest spending in every city.

###  5. Final Reporting Table

Built a final report containing:

- Customer ID
- First Name
- Last Name
- City
- Total Spend
- Order Count

---

# 📚 Concepts Practiced

## 🔹 Spark SQL

- SELECT
- GROUP BY
- ORDER BY
- JOIN
- HAVING
- Aggregate Functions
- Window Functions

---

## 🔹 PySpark

- Reading CSV files
- Reading JSON files
- Reading ORC files
- Reading Parquet files
- `dropna()`
- `cast()`
- `filter()`
- `join()`
- `groupBy()`
- `agg()`
- `orderBy()`
- Window Functions (`row_number`)
- `display()`

---

# 🎯 Learning Outcomes

By completing this phase, I learned how to:

-  Read data from multiple file formats.
-  Clean and preprocess datasets.
-  Build an ETL pipeline using PySpark.
-  Perform joins, filtering, and aggregations.
-  Apply Window Functions for ranking.
-  Convert SQL queries into equivalent PySpark transformations.

---

# 💡 Key Takeaways

- ETL is the foundation of every data engineering workflow.
- Data cleaning improves data quality before analysis.
- SQL and PySpark can solve the same business problems using different approaches.
- Window Functions simplify ranking and analytical tasks.
- Structuring code into ETL stages makes projects easier to maintain.

---

# 🎉 Conclusion

Phase 3 provided hands-on experience with the complete **Extract → Transform → Load (ETL)** process. Working with different file formats, cleaning data, building business reports, and implementing SQL-to-PySpark conversions strengthened my understanding of real-world data engineering workflows.

---
