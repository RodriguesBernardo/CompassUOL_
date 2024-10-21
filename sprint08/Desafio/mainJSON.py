import sys
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from pyspark.sql.functions import array_contains, col, when, explode, trim, lit

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

data_atual = datetime.now()
ano = data_atual.strftime("%Y")
mes = data_atual.strftime("%m")
dia = data_atual.strftime("%d")

caminhoArquivoJSON = "s3://sprint07/raw/TMDB/JSON/2024/10/18/movies_2.json"
caminhoDestino = f"s3://sprint07/trusted/Movies_TMDb/{ano}/{mes}/{dia}/"

json_df = spark.read.json(caminhoArquivoJSON)

json_exploded = json_df.withColumn("genero", explode(col("genero")))

json_drama_romance = json_exploded.filter((col("genero") == "Drama") | (col("genero") == "Romance"))

json_drama_romance = json_drama_romance.withColumn(
    "anoLancamento",
    when(col("anoLancamento").isNull() | (col("anoLancamento") == ''), lit('Desconhecido')).otherwise(col("anoLancamento"))
)

json_drama_romance.write.mode("overwrite").partitionBy("genero", "anoLancamento").parquet(caminhoDestino)
