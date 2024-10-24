import random
from pyspark.sql import SparkSession
from pyspark.sql.functions import udf
from pyspark.sql.types import StringType, IntegerType

# Criamos uma SparkSession com o nome do aplicativo definido como Exercicio Intro
spark = SparkSession \
    .builder \
    .master("local[*]") \
    .appName("Exercicio Intro") \
    .getOrCreate()

# Realiza a leaitura do arquivo CSV e renomeia a primeira coluna para Nomes
df_nomes = spark.read.csv("nomes_aleatorios.txt", inferSchema=True, header=False)
df_nomes = df_nomes.withColumnRenamed("_c0", "Nomes")

# Função que tem como objetivo gerar escolaridades aleatorias
def escolaridade_aleatoria():
    return random.choice(["Fundamental", "Medio", "Superior"])

# Criamos um UDF para adicionar a coluna Escolaridade com valores aleatorios
escolaridade_udf = udf(escolaridade_aleatoria, StringType())
df_nomes = df_nomes.withColumn("Escolaridade", escolaridade_udf())

# Array contendo países sul-americanos 
paises = ["Argentina", "Brasil", "Chile", "Uruguai", "Paraguai", "Peru", 
          "Bolívia", "Equador", "Colômbia", "Venezuela", "Guiana", 
          "Suriname", "Guiana Francesa"]

# Função para pegar um país aleatório da lista
def pais_aleatorio():
    return random.choice(paises)

# Criamos um UDF para adicionar a coluna país valores aleatorios
pais_udf = udf(pais_aleatorio, StringType())
df_nomes = df_nomes.withColumn("Pais", pais_udf())

# Função para gerar um ano de nascimento aleatorio entre 1945-2010
def ano_nascimento_aleatorio():
    return random.randint(1945, 2010)

# Cria um UDF para adicionar a coluna AnoNascimento valores aleatorios
ano_nascimento_udf = udf(ano_nascimento_aleatorio, IntegerType())
df_nomes = df_nomes.withColumn("AnoNascimento", ano_nascimento_udf())

# Filtra as pessoas nascidas a partir do ano 2000 e mostra os primeiros 10 nomes
df_select = df_nomes.filter(df_nomes["AnoNascimento"] >= 2000)
df_select.select("Nomes").show(10)

# Cria uma view temporaria chamada Pessoas para fazer as consultas SQL
df_nomes.createOrReplaceTempView("pessoas")

# Fazmos a consulta SQL com objetivo de selecionar os nomes das pessoas nascidas a partir de 2000
df_select_sql = spark.sql("SELECT Nomes FROM pessoas WHERE AnoNascimento >= 2000")
df_select_sql.show(10)

# Filtra somente as pessoas da geração Millennial (Nascidas entre 1980 e 1994)
df_millennials = df_nomes.filter((df_nomes["AnoNascimento"] >= 1980) & (df_nomes["AnoNascimento"] <= 1994))
millennials_count = df_millennials.count()
print(f"Número de Millennials: {millennials_count}")

# Conta o numero de Millennials 
df_millennials_sql = spark.sql("SELECT COUNT(*) FROM pessoas WHERE AnoNascimento >= 1980 AND AnoNascimento <= 1994")
df_millennials_sql.show()

# Classifica as pessoas em gerações com base no ano de nascimento
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

