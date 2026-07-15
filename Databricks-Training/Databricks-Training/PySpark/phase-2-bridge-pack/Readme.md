# 🚀 SQL to PySpark – Phase 2 (SQL to PySpark Bridge Pack)

## 📌 Objective

The objective of this phase is to bridge the gap between **SQL** and **PySpark** by solving real-world data analysis tasks. This phase focuses on learning joins, aggregations, filtering, sorting, and converting SQL queries into equivalent PySpark DataFrame operations.

---

## 📂 Datasets Used

- 👥 `customers.csv`
- 💰 `sales.csv`

> Both datasets are available in the `/samples/` directory of Spark Playground.

---

## 🛠️ Technologies Used

- 🐍 Python 3.8
- ⚡ PySpark 3.5
- 🗃️ Spark SQL
- 💻 Spark Playground

---

# 🧹 Data Preparation

Before solving the exercises, the following preprocessing steps were performed:

-  Loaded the datasets.
-  Removed rows with missing `customer_id`.
-  Converted the `total_amount` column to `Double`.
-  Created temporary SQL views for SQL execution.

---

# 📋 Tasks Completed

### ✅ 1. Total Order Amount for Each Customer

Calculated the total amount spent by every customer.

### ✅ 2. Top 3 Customers by Total Spend

Identified the top three customers based on their total spending.

### ✅ 3. Customers with No Orders

Found customers who have not placed any orders.

### ✅ 4. City-wise Total Revenue

Calculated the total revenue generated from each city.

### ✅ 5. Average Order Amount per Customer

Computed the average order amount for every customer.

### ✅ 6. Customers with More Than One Order

Identified customers who placed multiple orders.

### ✅ 7. Customers Sorted by Total Spend

Generated a report of customers sorted by their total spending in descending order.

---

# 📚 Concepts Practiced

## 🔹 Spark SQL

- SELECT
- GROUP BY
- ORDER BY
- LIMIT
- INNER JOIN
- LEFT JOIN
- Aggregate Functions (`SUM`, `AVG`, `COUNT`)
- HAVING

---

## 🔹 PySpark

- Reading CSV files
- `dropna()`
- `cast()`
- `groupBy()`
- `agg()`
- `join()`
- `left_anti` join
- `filter()`
- `orderBy()`
- `display()`

---

# 🎯 Learning Outcomes

By completing this phase, I learned how to:

-  Convert SQL queries into PySpark DataFrame operations.
-  Perform joins between multiple datasets.
-  Generate business insights using aggregation functions.
-  Clean and prepare datasets before analysis.
-  Understand the similarities between SQL and PySpark.

---

# 💡 Key Takeaways

- SQL and PySpark can solve the same business problems using different syntax.
- Data cleaning is an important step before performing analysis.
- Aggregations and joins are fundamental operations in data engineering.
- PySpark DataFrames provide a scalable way to process large datasets.

---

# 🎉 Conclusion

Phase 2 helped me build a strong foundation in **SQL** and **PySpark** by implementing common business queries using both approaches. It improved my understanding of data transformations, joins, aggregations, and SQL-to-PySpark conversion, preparing me for more advanced ETL and data engineering tasks.

---

