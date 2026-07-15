from pyspark.sql import SparkSession
from pyspark.sql.functions import *

# Create Spark Session
spark = SparkSession.builder.appName("Business Pipeline").getOrCreate()

# Load CSV Files
customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")


# Data Cleaning


customers = customers.dropDuplicates()
sales = sales.dropDuplicates()

customers = customers.filter(col("customer_id").isNotNull())
sales = sales.filter(col("customer_id").isNotNull())

sales = sales.withColumn("total_amount", col("total_amount").cast("double"))

sales = sales.filter(col("total_amount") >= 0)

print("Data Cleaning Completed")


# Task 1 : Daily Sales


print("Task 1 : Daily Sales")

daily_sales = sales.groupBy("sale_date") \
    .sum("total_amount") \
    .withColumnRenamed("sum(total_amount)", "total_sales")

daily_sales.show()


# Task 2 : City-wise Revenue


print("Task 2 : City-wise Revenue")

city_revenue = sales.join(customers, "customer_id") \
    .groupBy("city") \
    .sum("total_amount") \
    .withColumnRenamed("sum(total_amount)", "total_revenue")

city_revenue.show()


# Task 3 : Top 5 Customers


print("Task 3 : Top 5 Customers")

top5 = sales.join(customers, "customer_id") \
    .groupBy("first_name", "last_name") \
    .sum("total_amount") \
    .withColumnRenamed("sum(total_amount)", "total_spend") \
    .withColumn("customer_name", concat_ws(" ", col("first_name"), col("last_name"))) \
    .select("customer_name", "total_spend") \
    .orderBy(desc("total_spend")) \
    .limit(5)

top5.show()


# Task 4 : Repeat Customers


print("Task 4 : Repeat Customers")

repeat = sales.groupBy("customer_id") \
    .count() \
    .withColumnRenamed("count", "order_count") \
    .filter(col("order_count") > 1)

repeat.show()


# Task 5 : Customer Segmentation


print("Task 5 : Customer Segmentation")

segment = sales.join(customers, "customer_id") \
    .groupBy("first_name", "last_name") \
    .sum("total_amount") \
    .withColumnRenamed("sum(total_amount)", "total_spend")

segment = segment.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when(col("total_spend") >= 5000, "Silver")
    .otherwise("Bronze")
)

segment = segment.withColumn(
    "customer_name",
    concat_ws(" ", col("first_name"), col("last_name"))
)

segment.select("customer_name", "total_spend", "segment").show()


# Task 6 : Final Reporting Table
print("Task 6 : Final Reporting Table")

final_df = sales.join(customers, "customer_id") \
    .groupBy("first_name", "last_name", "city") \
    .agg(
        sum("total_amount").alias("total_spend"),
        count("sale_id").alias("order_count")
    )

final_df = final_df.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when(col("total_spend") >= 5000, "Silver")
    .otherwise("Bronze")
)

final_df = final_df.withColumn(
    "customer_name",
    concat_ws(" ", col("first_name"), col("last_name"))
)

final_df.select(
    "customer_name",
    "city",
    "total_spend",
    "order_count",
    "segment"
).show()


# Task 7 : Save Output


try:
    final_df.write.mode("overwrite").option("header", "true").csv("/tmp/report")
    print("Report Saved Successfully")
except:
    print("Unable to Save Report")

print("Mini Project Completed Successfully")