from pyspark.sql import SparkSession
from pyspark.sql.functions import *

# Create Spark Session
spark = SparkSession.builder.appName("SQL to PySpark Phase 2").getOrCreate()

# Load datasets
customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")

# Display data
customers.show(5)
sales.show(5)

# Print schema
customers.printSchema()
sales.printSchema()

# Remove rows with missing customer_id
customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])

# Convert total_amount to numeric
sales = sales.withColumn("total_amount", col("total_amount").cast("double"))


# 1. Total order amount for each customer

print("1. Total Order Amount for Each Customer")

sales.groupBy("customer_id") \
     .agg(sum("total_amount").alias("total_spend")) \
     .show()


# 2. Top 3 customers by total spend

print("2. Top 3 Customers by Total Spend")

sales.groupBy("customer_id") \
     .agg(sum("total_amount").alias("total_spend")) \
     .orderBy(desc("total_spend")) \
     .limit(3) \
     .show()


# 3. Customers with no orders

print("3. Customers With No Orders")

customers.join(sales, on="customer_id", how="left_anti") \
         .show()


# 4. City-wise total revenue

print("4. City-wise Total Revenue")

customers.join(sales, "customer_id") \
         .groupBy("city") \
         .agg(sum("total_amount").alias("total_revenue")) \
         .show()


# 5. Average order amount per customer

print("5. Average Order Amount Per Customer")

sales.groupBy("customer_id") \
     .agg(avg("total_amount").alias("average_order")) \
     .show()


# 6. Customers with more than one order

print("6. Customers With More Than One Order")

sales.groupBy("customer_id") \
     .agg(count("sale_id").alias("total_orders")) \
     .filter(col("total_orders") > 1) \
     .show()


# 7. Sort customers by total spend descending

print("7. Customers Sorted by Total Spend")

customers.join(sales, "customer_id") \
         .groupBy("customer_id", "first_name", "last_name") \
         .agg(sum("total_amount").alias("total_spend")) \
         .orderBy(desc("total_spend")) \
         .show()