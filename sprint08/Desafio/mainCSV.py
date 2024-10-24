import sys
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from pyspark.sql.functions import col, when, lit
from datetime import datetime

# Inicializamos o SparkContext e Glue
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

# Definimos variaves referentes a ano, mes e dia
data_atual = datetime.now()
ano = data_atual.strftime("%Y")
mes = data_atual.strftime("%m")
dia = data_atual.strftime("%d")

# Definimos o caminho destino e o local do arquivo CSV
caminhoArquivoSeries = "s3://sprint07/raw/Local/CSV/Movies/16/10/2024/movies.csv"
caminhoDestinoSeries = f"s3://sprint07/trusted/Movies-CSV/{ano}/{mes}/{dia}/"
# Le o arquivo CSV do filmes usando Spark, definindo cabeçalho e demais informações
series_df = spark.read.option("delimiter", "|").csv(caminhoArquivoSeries, header=True, inferSchema=True)
# Filtra os filmes que sejam do gênero Drama ou Romance 
series_drama_romance = series_df.filter((col("genero") == "Drama") | (col("genero") == "Romance"))
# Remove as duplicatas na coluna titulopincipal
series_drama_romance = series_drama_romance.dropDuplicates(["titulopincipal"])
# Substitui valores nulos ou invalidos na colula anoLancamento para Desconhecido
for coluna in series_drama_romance.columns:
    series_drama_romance = series_drama_romance.withColumn(
        coluna,
        when(col(coluna).isNull() | (col(coluna) == '') | (col(coluna) == '\\N'), lit('Desconhecido')).otherwise(col(coluna))
    )

# Escreve os dados em formato parquet, particinando por genero e anoLancamento
series_drama_romance.write.mode("overwrite").partitionBy("genero", "anoLancamento").parquet(caminhoDestinoSeries)
