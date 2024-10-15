import random
from pyspark.sql import SparkSession
from pyspark.sql.functions import udf
from pyspark.sql.types import StringType, IntegerType

spark = SparkSession \
    .builder \
    .master("local[*]") \
    .appName("Exercicio Intro") \
    .getOrCreate()

df_nomes = spark.read.csv("nomes_aleatorios.txt", inferSchema=True, header=False)
df_nomes = df_nomes.withColumnRenamed("_c0", "Nomes")

def escolaridade_aleatoria():
    return random.choice(["Fundamental", "Medio", "Superior"])

escolaridade_udf = udf(escolaridade_aleatoria, StringType())
df_nomes = df_nomes.withColumn("Escolaridade", escolaridade_udf())

paises = ["Argentina", "Brasil", "Chile", "Uruguai", "Paraguai", "Peru", 
          "Bolívia", "Equador", "Colômbia", "Venezuela", "Guiana", 
          "Suriname", "Guiana Francesa"]

def pais_aleatorio():
    return random.choice(paises)

pais_udf = udf(pais_aleatorio, StringType())
df_nomes = df_nomes.withColumn("Pais", pais_udf())

def ano_nascimento_aleatorio():
    return random.randint(1945, 2010)

ano_nascimento_udf = udf(ano_nascimento_aleatorio, IntegerType())
df_nomes = df_nomes.withColumn("AnoNascimento", ano_nascimento_udf())

df_select = df_nomes.filter(df_nomes["AnoNascimento"] >= 2000)
df_select.select("Nomes").show(10)

df_nomes.createOrReplaceTempView("pessoas")

df_select_sql = spark.sql("SELECT Nomes FROM pessoas WHERE AnoNascimento >= 2000")
df_select_sql.show(10)

df_millennials = df_nomes.filter((df_nomes["AnoNascimento"] >= 1980) & (df_nomes["AnoNascimento"] <= 1994))
millennials_count = df_millennials.count()
print(f"Número de Millennials: {millennials_count}")

df_millennials_sql = spark.sql("SELECT COUNT(*) FROM pessoas WHERE AnoNascimento >= 1980 AND AnoNascimento <= 1994")
df_millennials_sql.show()

df_generations = spark.sql("""
    SELECT Pais, 
           CASE 
               WHEN AnoNascimento BETWEEN 1944 AND 1964 THEN 'Baby Boomers'
               WHEN AnoNascimento BETWEEN 1965 AND 1979 THEN 'Geracao X'
               WHEN AnoNascimento BETWEEN 1980 AND 1994 THEN 'Millennials'
               WHEN AnoNascimento BETWEEN 1995 AND 2015 THEN 'Geracao Z'
           END AS Geracao, 
           COUNT(*) AS Quantidade
    FROM pessoas
    GROUP BY Pais, Geracao
    ORDER BY Pais, Geracao
""")

df_generations.show()

