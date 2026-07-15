from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("Phase3_SQL").getOrCreate()

customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")

customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])

customers.createOrReplaceTempView("customers")
sales.createOrReplaceTempView("sales")


# 1. Daily Sales

result1 = spark.sql("""
SELECT
    sale_date,
    SUM(CAST(total_amount AS DOUBLE)) AS daily_sales
FROM sales
GROUP BY sale_date
ORDER BY sale_date
""")

display(result1)


# 2. City-wise Revenue


result2 = spark.sql("""
SELECT
    c.city,
    SUM(CAST(s.total_amount AS DOUBLE)) AS total_revenue
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC
""")

display(result2)


# 3. Repeat Customers (>2 Orders)


result3 = spark.sql("""
SELECT
    customer_id,
    COUNT(sale_id) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(sale_id) > 2
""")

display(result3)

# 4. Highest Spending Customer in Each City


result4 = spark.sql("""
SELECT *
FROM (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city,
        SUM(CAST(s.total_amount AS DOUBLE)) AS total_spend,
        ROW_NUMBER() OVER (
            PARTITION BY c.city
            ORDER BY SUM(CAST(s.total_amount AS DOUBLE)) DESC
        ) AS rn
    FROM customers c
    JOIN sales s
    ON c.customer_id = s.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city
) t
WHERE rn = 1
""")

display(result4)

# 5. Final Reporting Table

result5 = spark.sql("""
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    SUM(CAST(s.total_amount AS DOUBLE)) AS total_spend,
    COUNT(s.sale_id) AS order_count
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
ORDER BY total_spend DESC
""")

display(result5)