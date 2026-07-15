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

customers.createOrReplaceTempView("customers")
sales.createOrReplaceTempView("sales")
task1 = spark.sql("""
SELECT
    sale_date,
    SUM(CAST(total_amount AS DOUBLE)) AS total_sales
FROM sales
GROUP BY sale_date
ORDER BY sale_date
""")

task1.show()
task2 = spark.sql("""
SELECT
    c.city,
    SUM(CAST(s.total_amount AS DOUBLE)) AS total_revenue
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC
""")

task2.show()
task3 = spark.sql("""
SELECT
    CONCAT(first_name,' ',last_name) AS customer_name,
    SUM(CAST(total_amount AS DOUBLE)) AS total_spend
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY first_name,last_name
ORDER BY total_spend DESC
LIMIT 5
""")

task3.show()
task4 = spark.sql("""
SELECT
    customer_id,
    COUNT(sale_id) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(sale_id) > 1
""")

task4.show()
task5 = spark.sql("""
SELECT
    CONCAT(first_name,' ',last_name) AS customer_name,
    SUM(CAST(total_amount AS DOUBLE)) AS total_spend,

    CASE
        WHEN SUM(CAST(total_amount AS DOUBLE)) > 10000 THEN 'Gold'
        WHEN SUM(CAST(total_amount AS DOUBLE)) >= 5000 THEN 'Silver'
        ELSE 'Bronze'
    END AS segment

FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id

GROUP BY first_name,last_name
""")

task5.show()
task6 = spark.sql("""
SELECT

CONCAT(first_name,' ',last_name) AS customer_name,
city,

SUM(CAST(total_amount AS DOUBLE)) AS total_spend,

COUNT(sale_id) AS order_count,

CASE
    WHEN SUM(CAST(total_amount AS DOUBLE)) > 10000 THEN 'Gold'
    WHEN SUM(CAST(total_amount AS DOUBLE)) >= 5000 THEN 'Silver'
    ELSE 'Bronze'
END AS segment

FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id

GROUP BY
first_name,
last_name,
city

ORDER BY total_spend DESC
""")

task6.show()
task6.write.mode("overwrite").option("header", "true").csv("/tmp/report")