from pyspark.sql import SparkSession

# Create Spark Session
spark = SparkSession.builder.appName("SQL Phase 2").getOrCreate()

# Load datasets
customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")

# Remove rows with missing customer_id
customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])

# Create Temporary SQL Views
customers.createOrReplaceTempView("customers")
sales.createOrReplaceTempView("sales")


# 1. Total order amount for each customer

result1 = spark.sql("""
SELECT
    customer_id,
    SUM(CAST(total_amount AS DOUBLE)) AS total_spend
FROM sales
GROUP BY customer_id
LIMIT 10
""")

display(result1)

# 2. Customers with no orders

result2 = spark.sql("""
SELECT
    customer_id,
    SUM(CAST(total_amount AS DOUBLE)) AS total_spend
FROM sales
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 3
""")

display(result2)

# 3.  Customers with no orders

result3 = spark.sql("""
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customers c
LEFT JOIN sales s
ON c.customer_id = s.customer_id
WHERE s.customer_id IS NULL
""")

display(result3.limit(10))

# 4. City-wise total revenue

result4 = spark.sql("""
SELECT
    c.city,
    SUM(CAST(s.total_amount AS DOUBLE)) AS total_revenue
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.city
""")

display(result4.limit(10))

# 5. Average order amount per customer

result5 = spark.sql("""
SELECT
    customer_id,
    AVG(CAST(total_amount AS DOUBLE)) AS average_order
FROM sales
GROUP BY customer_id
""")

display(result5.limit(10))

# 6. Customers with more than one order

result6 = spark.sql("""
SELECT
    customer_id,
    COUNT(sale_id) AS total_orders
FROM sales
GROUP BY customer_id
HAVING COUNT(sale_id) > 1
""")

display(result6.limit(10))

#  7. Sort customers by total spend descending

result7 = spark.sql("""
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(CAST(s.total_amount AS DOUBLE)) AS total_spend
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spend DESC
""")

display(result7.limit(10))