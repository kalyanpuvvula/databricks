# 🚀 Bucketing & Segmentation in PySpark – Phase 4A

## 📌 Objective

The objective of this phase is to understand how continuous numerical values can be transformed into meaningful categories using **Bucketing** and **Segmentation** techniques in PySpark. This phase explores different methods such as conditional logic, quantile-based segmentation, MLlib Bucketizer, and window functions to classify and analyze customer spending behavior.

---

## 📂 Dataset Used

- 💰 `sales.csv`

> The dataset is available in the `/samples/` directory of Spark Playground.

---

## 🛠️ Technologies Used

- 🐍 Python 3.8
- ⚡ PySpark 3.5.5
- 📊 Apache Spark
- 💻 Spark Playground

---

# 🧹 Data Preparation

Before performing segmentation, the following preprocessing steps were completed:

- ✅ Loaded the `sales.csv` dataset.
- ✅ Displayed the dataset and verified the schema.
- ✅ Renamed the `amount` column to `total_amount` for better readability.
- ✅ Verified the updated schema before analysis.

---

# 📋 Tasks Completed

### ✅ 1. Gold / Silver / Bronze Segmentation

Used PySpark's `when()` function to classify customers into:

- 🥇 Gold
- 🥈 Silver
- 🥉 Bronze

based on their total spending.

---

### ✅ 2. Group Data by Segment

Grouped the data by customer segment and counted the number of customers in each category.

---

### ✅ 3. Quantile-Based Segmentation

Calculated the 33rd and 66th percentiles using `approxQuantile()` and created dynamic customer segments based on data distribution.

---

### ✅ 4. Compare Segmentation Methods

Compared the results of:

- Fixed Threshold Segmentation
- Quantile-Based Segmentation

to understand the differences between business rules and statistical segmentation.

---

### ✅ 5. Bucketizer (MLlib)

Implemented PySpark MLlib's `Bucketizer` to divide customer spending into predefined buckets.

Bucket ranges:

- Bucket 0 → Less than 5000
- Bucket 1 → 5000 to 10000
- Bucket 2 → Greater than 10000

---

### ✅ 6. Window-Based Ranking

Applied the `percent_rank()` window function to rank customers according to their spending percentage.

---

### ✅ 7. Final Comparison

Displayed the final output including:

- Customer ID
- Total Amount
- Customer Segment
- Percent Rank

---

# 📚 Concepts Practiced

## 🔹 PySpark DataFrame Operations

- Reading CSV files
- `withColumnRenamed()`
- `withColumn()`
- `when()`
- `otherwise()`
- `groupBy()`
- `count()`
- `display()`

---

## 🔹 Bucketing & Segmentation

- Fixed Threshold Segmentation
- Business Rule Segmentation
- Quantile-Based Segmentation
- Customer Categorization

---

## 🔹 PySpark MLlib

- `Bucketizer`
- Bucket Splits
- Feature Bucketing

---

## 🔹 Window Functions

- `Window`
- `percent_rank()`
- Ranking Records

---

# 🎯 Learning Outcomes

By completing this phase, I learned how to:

- 📊 Convert continuous numerical values into meaningful customer categories.
- 🏆 Implement Gold, Silver, and Bronze customer segmentation.
- 📈 Use quantiles to create data-driven customer segments.
- 🤖 Apply MLlib Bucketizer for automatic bucketing.
- 📉 Rank customers using Window Functions.
- ⚡ Compare multiple bucketing techniques and understand their business applications.

---

# 💡 Key Takeaways

- Bucketing simplifies continuous numerical data into meaningful categories.
- Business segmentation uses fixed thresholds, while quantile segmentation adapts to the data distribution.
- MLlib Bucketizer provides an efficient method for creating buckets.
- Window Functions help analyze customer rankings without modifying the original data.
- Different bucketing techniques are suitable for different business scenarios.

---

# 🎉 Conclusion

Phase 4A provided practical experience in implementing customer segmentation using PySpark. By exploring multiple bucketing techniques—including conditional logic, quantile-based segmentation, Bucketizer, and window functions—I gained a deeper understanding of how data can be categorized for business intelligence, customer analytics, and machine learning applications.

---

## ⭐ Project Status

**✅ Completed Successfully**