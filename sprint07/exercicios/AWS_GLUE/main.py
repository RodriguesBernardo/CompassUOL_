import sys
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue.utils import getResolvedOptions
from pyspark.sql.functions import col, upper, count, desc

args = getResolvedOptions(sys.argv, ['JOB_NAME', 'S3_INPUT_PATH', 'S3_TARGET_PATH'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

job = Job(glueContext)
job.init(args['JOB_NAME'], args)

caminhoArquivoNomes = args['S3_INPUT_PATH']
caminhoDestinoArquivo = args['S3_TARGET_PATH']

arquivoNomes = spark.read.option("header", "true").csv(caminhoArquivoNomes)

arquivoNomes.printSchema()

arquivoNomesMaiusculo = arquivoNomes.withColumn("nome", upper(col("nome")))

numeroLinhas = arquivoNomesMaiusculo.count()
print(f"Número de linhas: {numeroLinhas}")

# Agrupa por "ano" e "sexo", conta os registros e ordena pelo ano de forma decrescente
arquivoAgrupadoPorAnoSexo = (
    arquivoNomesMaiusculo.groupBy("ano", "sexo")
    .agg(count("*"))
    .orderBy(col("ano").desc())
)
arquivoAgrupadoPorAnoSexo.show()

# Filtra para sexo feminino, agrupa por "nome" e "ano", conta os registros e ordena para pegar o mais frequente
nomeFemininoMaisRegistrado = (
    arquivoNomesMaiusculo
    .filter(col("sexo") == "F")
    .groupBy("nome", "ano")
    .agg(count("*").alias("contagemNomes"))
    .orderBy(desc("contagemNomes"))
    .first()
)
print(f"Nome feminino com mais registros: {nomeFemininoMaisRegistrado['nome']} - Ano: {nomeFemininoMaisRegistrado['ano']}")

# Filtra para sexo masculino, agrupa por "nome" e "ano", conta os registros e ordena para pegar o mais frequente
nomeMasculinoMaisRegistrado = (
    arquivoNomesMaiusculo
    .filter(col("sexo") == "M")
    .groupBy("nome", "ano")
    .agg(count("*").alias("contagemNomes"))
    .orderBy(desc("contagemNomes"))
    .first()
)
print(f"Nome masculino com mais registros: {nomeMasculinoMaisRegistrado['nome']} - Ano: {nomeMasculinoMaisRegistrado['ano']}")

# Conta o número total de registros por ano e exibe os 10 primeiros anos
totalRegistros = arquivoNomesMaiusculo.groupBy("ano").agg(count("*")).orderBy("ano")
totalRegistros.limit(10).show()


# Grava o DataFrame particionado por "sexo" e "ano" no S3 em formato JSON
arquivoNomesMaiusculo.write.mode("overwrite").partitionBy("sexo", "ano").json(caminhoDestinoArquivo)

# Finaliza o job
job.commit()
