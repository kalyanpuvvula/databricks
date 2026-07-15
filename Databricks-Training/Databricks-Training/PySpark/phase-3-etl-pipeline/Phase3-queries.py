from pyspark.sql import SparkSession
from pyspark.sql.functions import (
    col,
    sum,
    count,
    when,
    desc,
    row_number
)
from pyspark.sql.window import Window

spark = SparkSession.builder.appName("Phase3_ETL").getOrCreate()

# Read CSV files
customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")

print("Customers Dataset")
display(customers.limit(10))

print("Sales Dataset")
display(sales.limit(10))

customers.printSchema()
sales.printSchema()

print("Missing customer_id in Customers")
customers.filter(col("customer_id").isNull()).show()

print("Missing customer_id in Sales")
sales.filter(col("customer_id").isNull()).show()

# Clean Data


customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])

# Convert total_amount to double
sales = sales.withColumn(
    "total_amount",
    col("total_amount").cast("double")
)

# Filter invalid records
sales = sales.filter(col("total_amount") > 0)

products = spark.read \
    .option("multiLine", "true") \
    .json("/samples/products.json")

print("Products JSON")
display(products.limit(10))



titanic = spark.read.parquet("/samples/titanic.parquet")

print("Titanic Parquet")
display(titanic.limit(10))

# BUSINESS PIPELINE

# 1. Daily Sales

daily_sales = sales.groupBy("sale_date") \
    .agg(sum("total_amount").alias("daily_sales")) \
    .orderBy("sale_date")

print("Daily Sales")
display(daily_sales)


# 2. City-wise Revenue

city_revenue = customers.join(sales, "customer_id") \
    .groupBy("city") \
    .agg(sum("total_amount").alias("total_revenue")) \
    .orderBy(desc("total_revenue"))

print("City-wise Revenue")
display(city_revenue)



# 3. Repeat Customers (>2 Orders)

repeat_customers = sales.groupBy("customer_id") \
    .agg(count("sale_id").alias("order_count")) \
    .filter(col("order_count") > 2)

print("Repeat Customers")
display(repeat_customers)



# 4. Highest Spending Customer in Each City

customer_spend = customers.join(sales, "customer_id") \
    .groupBy(
        "customer_id",
        "first_name",
        "last_name",
        "city"
    ) \
    .agg(sum("total_amount").alias("total_spend"))

windowSpec = Window.partitionBy("city").orderBy(desc("total_spend"))

highest_spending = customer_spend.withColumn(
    "rank",
    row_number().over(windowSpec)
).filter(col("rank") == 1)

print("Highest Spending Customer in Each City")
display(highest_spending)



# 5. Final Reporting Table

report = customers.join(sales, "customer_id") \
    .groupBy(
        "customer_id",
        "first_name",
        "last_name",
        "city"
    ) \
    .agg(
        sum("total_amount").alias("total_spend"),
        count("sale_id").alias("order_count")
    ) \
    .orderBy(desc("total_spend"))

print("Final Reporting Table")
display(report)