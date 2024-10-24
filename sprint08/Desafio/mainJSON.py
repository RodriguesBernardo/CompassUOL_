import sys
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from pyspark.sql.functions import array_contains, col, when, explode, lit
from datetime import datetime

# Inicializamos o SparkContext e o Glue
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

# Definimos variaveis para armazenas as informações de horario
data_atual = datetime.now()
ano = data_atual.strftime("%Y")
mes = data_atual.strftime("%m")
dia = data_atual.strftime("%d")

# Definimos variaveis para o caminho dos arquivos de leitura e destino
caminhoArquivoJSON = "s3://sprint07/raw/TMDB/JSON/2024/10/18/movies_2.json"
caminhoDestino = f"s3://sprint07/trusted/Movies_TMDb/{ano}/{mes}/{dia}/"

# Usamos o Spark para fazer a leitura do arquivo JSON
json_df = spark.read.json(caminhoArquivoJSON)

# Explodimos o array genero em linhas individuais
json_exploded = json_df.withColumn("genero", explode(col("genero")))

# Filtramos os filmes que são do genero Drama ou Romance
json_drama_romance = json_exploded.filter((col("genero") == "Drama") | (col("genero") == "Romance"))

# Removemos duplicatas com base na coluna titulo prinicipal
json_drama_romance = json_drama_romance.dropDuplicates(["tituloprincipal"])

# Substituiomos valores nulos ou invalidos na coluna anoLancamento para Desconhecido
json_drama_romance = json_drama_romance.withColumn(
    "anoLancamento",
    when(col("anoLancamento").isNull() | (col("anoLancamento") == ''), lit('Desconhecido')).otherwise(col("anoLancamento"))
)

# Escreve os dados no formato Parquet
json_drama_romance.write.mode("overwrite").partitionBy("genero", "anoLancamento").parquet(caminhoDestino)
