import sys
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from pyspark.sql.functions import col, when, lit

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

caminhoArquivoSeries = "s3://sprint07/raw/Local/CSV/Movies/16/10/2024/movies.csv"
caminhoDestinoSeries = "s3://sprint07/trusted/Movies-CSV/"
series_df = spark.read.option("delimiter", "|").csv(caminhoArquivoSeries, header=True, inferSchema=True)

series_drama_romance = series_df.filter((col("genero") == "Drama") | (col("genero") == "Romance"))

series_drama_romance = series_drama_romance.withColumn(
    "anoLancamento",
    when(col("anoLancamento").isNull() | (col("anoLancamento") == ''), lit('Desconhecido')).otherwise(col("anoLancamento"))
)

series_drama_romance.write.mode("overwrite").partitionBy("genero", "anoLancamento").parquet(caminhoDestinoSeries)
