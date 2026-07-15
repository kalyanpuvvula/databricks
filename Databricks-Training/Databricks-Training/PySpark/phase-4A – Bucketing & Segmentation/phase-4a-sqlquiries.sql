from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Bucketing and Segmentation SQL") \
    .getOrCreate()
df = spark.read.format("csv") \
.option("header","true") \
.option("inferSchema","true") \
.load("/samples/sales.csv")
df = df.withColumnRenamed("amount","total_amount")
df.createOrReplaceTempView("sales")
segment_sql = spark.sql("""

SELECT *,
CASE
    WHEN total_amount > 10000 THEN 'Gold'
    WHEN total_amount BETWEEN 5000 AND 10000 THEN 'Silver'
    ELSE 'Bronze'
END AS segment
FROM sales

""")

segment_sql.show()

display(segment_sql)
group_sql = spark.sql("""

SELECT
segment,
COUNT(*) AS total_customers
FROM
(
SELECT *,
CASE
    WHEN total_amount > 10000 THEN 'Gold'
    WHEN total_amount BETWEEN 5000 AND 10000 THEN 'Silver'
    ELSE 'Bronze'
END AS segment
FROM sales
)
GROUP BY segment

""")

group_sql.show()

display(group_sql)
quantiles = df.approxQuantile("total_amount",[0.33,0.66],0)

print(quantiles)
q1 = quantiles[0]
q2 = quantiles[1]
quantile_sql = spark.sql(f"""

SELECT *,
CASE
    WHEN total_amount <= {q1} THEN 'Bronze'
    WHEN total_amount <= {q2} THEN 'Silver'
    ELSE 'Gold'
END AS quantile_segment
FROM sales

""")

quantile_sql.show()

display(quantile_sql)
comparison_sql = spark.sql(f"""

SELECT
segment,
quantile_segment,
COUNT(*) AS total

FROM

(
SELECT *,

CASE
    WHEN total_amount > 10000 THEN 'Gold'
    WHEN total_amount BETWEEN 5000 AND 10000 THEN 'Silver'
    ELSE 'Bronze'
END AS segment,

CASE
    WHEN total_amount <= {q1} THEN 'Bronze'
    WHEN total_amount <= {q2} THEN 'Silver'
    ELSE 'Gold'
END AS quantile_segment

FROM sales
)

GROUP BY
segment,
quantile_segment

""")

comparison_sql.show()

display(comparison_sql)
bucket_sql = spark.sql("""

SELECT *,

CASE
    WHEN total_amount < 5000 THEN 0
    WHEN total_amount BETWEEN 5000 AND 10000 THEN 1
    ELSE 2
END AS bucket

FROM sales

""")

bucket_sql.show()

display(bucket_sql)
rank_sql = spark.sql("""

SELECT *,

PERCENT_RANK() OVER(
ORDER BY total_amount
) AS rank_pct

FROM sales

""")

rank_sql.show()

display(rank_sql)
final_sql = spark.sql("""

SELECT

customer_id,
total_amount,

CASE
    WHEN total_amount > 10000 THEN 'Gold'
    WHEN total_amount BETWEEN 5000 AND 10000 THEN 'Silver'
    ELSE 'Bronze'
END AS segment,

PERCENT_RANK() OVER(
ORDER BY total_amount
) AS rank_pct

FROM sales

""")

final_sql.show()

display(final_sql)