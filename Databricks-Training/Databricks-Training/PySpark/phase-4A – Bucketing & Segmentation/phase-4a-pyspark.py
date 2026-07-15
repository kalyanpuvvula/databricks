#Create Spark Session
from pyspark.sql import SparkSession
spark = SparkSession.builder \
    .appName("Bucketing and Segmentation") \
    .getOrCreate()

#Load the Dataset
df = spark.read.format("csv") \
.option("header","true") \
.option("inferSchema","true") \
.load("/samples/sales.csv")

#View the Dataset
df.show(5)
df.printSchema()
display(df)
df = df.withColumnRenamed("amount","total_spend")
df.printSchema()
df.printSchema()

#Create Gold / Silver / Bronze Segmentation
from pyspark.sql.functions import when
segment_df = df.withColumn(
    "segment",
    when(df.total_amount > 10000, "Gold")
    .when(
        (df.total_amount >= 5000) &
        (df.total_amount <= 10000),
        "Silver"
    )
    .otherwise("Bronze")
)
segment_df.show()
#Display Result
display(segment_df)

#Group Data by Segment and Count Customers
segment_count = segment_df.groupBy("segment").count()
segment_count.show()
display(segment_count)

#Quantile-Based Segmentation
quantiles = segment_df.approxQuantile(
    "total_amount",
    [0.33,0.66],
    0
)
print(quantiles)
[4200, 8600]
q1 = quantiles[0]
q2 = quantiles[1]

#Create segments.
quantile_df = segment_df.withColumn(
    "quantile_segment",
    when(segment_df.total_amount <= q1,"Bronze")
    .when(segment_df.total_amount <= q2,"Silver")
    .otherwise("Gold")
)
quantile_df.show()
display(quantile_df)

#Compare Both Methods
comparison = quantile_df.groupBy(
    "segment",
    "quantile_segment"
).count()
comparison.show()
display(comparison)

#Bucketizer Method
from pyspark.ml.feature import Bucketizer
splits = [
    float("-inf"),
    5000,
    10000,
    float("inf")
]
bucketizer = Bucketizer(
    splits=splits,
    inputCol="total_amount",
    outputCol="bucket"
)
bucket_df = bucketizer.transform(segment_df)
bucket_df.show()
display(bucket_df)

# Window-Based Ranking
from pyspark.sql.window import Window
from pyspark.sql.functions import percent_rank
window = Window.orderBy("total_amount")
rank_df = segment_df.withColumn(
    "rank_pct",
    percent_rank().over(window)
)
rank_df.show()
display(rank_df)

#Final Comparison
display(rank_df.select(
    "customer_id",
    "total_amount",
    "segment",
    "rank_pct"
))