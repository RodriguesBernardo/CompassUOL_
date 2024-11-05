import sys
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from pyspark.sql.functions import explode, col, lit, split, monotonically_increasing_id, array_contains
from pyspark.sql.types import DoubleType, IntegerType
from datetime import datetime

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

# Criamos variavies para identificar ano, mes e dia 
data_atual = datetime.now()
ano = data_atual.strftime("%Y")
mes = data_atual.strftime("%m")
dia = data_atual.strftime("%d")

# Criamos variaveis identificando os caminhos para os dados da trusted
caminho_trusted_movies_csv = "s3://sprint07/trusted/Movies-CSV/"
caminho_trusted_movies_json = "s3://sprint07/trusted/Movies_TMDb/"

# Criamos variaveis para definir o caminho da pasta refined
caminho_refined_genero = f"s3://sprint07/refined/DimGenero/{ano}/{mes}/{dia}/"
caminho_refined_diretor = f"s3://sprint07/refined/DimDiretor/{ano}/{mes}/{dia}/"
caminho_refined_ator = f"s3://sprint07/refined/DimAtor/{ano}/{mes}/{dia}/"
caminho_refined_fatosfilme = f"s3://sprint07/refined/FatosFilme/{ano}/{mes}/{dia}/"

# Carrega os dados Trusted dos filmes em formato Parquet
movies_df_csv = spark.read.parquet(caminho_trusted_movies_csv)
movies_df_json = spark.read.parquet(caminho_trusted_movies_json)

# Renomeia e ajusta as colunas do CSV, padronizando com o JSON
movies_df_csv = movies_df_csv.withColumnRenamed("titulopincipal", "titulo_principal") \
                             .withColumnRenamed("titulooriginal", "titulo_original") \
                             .withColumnRenamed("tempominutos", "duracao_min") \
                             .withColumnRenamed("notamedia", "nota_media") \
                             .withColumnRenamed("numerovotos", "num_votos") \
                             .withColumnRenamed("anolancamento", "anoLancamento") \
                             .withColumn("nota_media", col("nota_media").cast(DoubleType())) \
                             .withColumn("duracao_min", col("duracao_min").cast(IntegerType()))

# Renomeia e ajusta as colunas do JSON, padronizando com o CSV
movies_df_json = movies_df_json.withColumnRenamed("tituloprincipal", "titulo_principal") \
                               .withColumnRenamed("titulooriginal", "titulo_original") \
                               .withColumnRenamed("tempominutos", "duracao_min") \
                               .withColumnRenamed("notamedia", "nota_media") \
                               .withColumnRenamed("numerovotos", "num_votos") \
                               .withColumnRenamed("anolancamento", "anoLancamento") \
                               .withColumn("nota_media", col("nota_media").cast(DoubleType())) \
                               .withColumn("duracao_min", col("duracao_min").cast(IntegerType()))

# Adiciona colunas nulas ao JSON para compatibilidade com o CSV 
#(As colunas que são exclusivas do CSV, criamos ela como nula no JSON, para nao termos erro na uniao posteriormente)
movies_df_json = movies_df_json \
    .withColumn("generoArtista", lit(None).cast("string")) \
    .withColumn("personagem", lit(None).cast("string")) \
    .withColumn("nomeartista", lit(None).cast("string")) \
    .withColumn("anonascimento", lit(None).cast("string")) \
    .withColumn("anofalecimento", lit(None).cast("string")) \
    .withColumn("profissao", lit(None).cast("string")) \
    .withColumn("titulosmaisconhecidos", lit(None).cast("string"))

# Une os dados CSV e JSON
dados_combinados = movies_df_csv.unionByName(movies_df_json, allowMissingColumns=True)
dados_combinados = dados_combinados.withColumn("profissao", split(col("profissao"), ","))

# Cria a dimensão de Gênero
dim_genero = dados_combinados.select("genero").distinct() \
                             .withColumnRenamed("genero", "nomeGenero") \
                             .withColumn("idGenero", monotonically_increasing_id())
dim_genero.write.mode("overwrite").parquet(caminho_refined_genero)

# Cria a dimensão de Diretor
dim_diretor = dados_combinados.filter(array_contains(col("profissao"), "director")) \
                              .select("nomeartista", "anonascimento", "anofalecimento").distinct() \
                              .withColumnRenamed("nomeartista", "nomeDiretor") \
                              .withColumn("idDiretor", monotonically_increasing_id())
dim_diretor.write.mode("overwrite").parquet(caminho_refined_diretor)

# Cria a dimensão de Ator
dim_ator = dados_combinados.filter(array_contains(col("profissao"), "actor")) \
                           .select("nomeartista", "anonascimento", "anofalecimento", "personagem").distinct() \
                           .withColumnRenamed("nomeartista", "nomeAtor") \
                           .withColumn("idAtor", monotonically_increasing_id())
dim_ator.write.mode("overwrite").parquet(caminho_refined_ator)

# Cria a tabela de fatos Filme
fatos_filme = dados_combinados.select(
    "titulo_principal", "titulo_original", "anoLancamento", col("nota_media").cast(DoubleType()), 
    "num_votos", col("duracao_min").cast(IntegerType()), "genero"
).withColumn("idFatoFilme", monotonically_increasing_id())
fatos_filme.write.mode("overwrite").parquet(caminho_refined_fatosfilme)
