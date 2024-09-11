# **Desafio**
1. Objetivo: 
* Praticar uso de AWS S3 Select, fazendo consultas usando o S3Select ou Desenvolver um código Python usando Boto3
2. Atividade:
* Escolher um arquivo CSV único na turma, no portal de dados públicos do Governo Brasileiro: http://dados.gov.br para realizar as consultas

# **Usando S3Select**

- Gostaria antes de iniciar a documentação da resolução do desafio colocar como referencia [Informacoes-S3Select](https://github.com/YanAndreatta/thank-God-S3-Select), criada pelo colega Yan Eduardo Andretta de Lima

## **Passo 1**
- Criação do bucket no S3 
<img src="/sprint05/evidencias/img/Criação do Bucket.png">

## **Passo 2**
- Configuração do bucket e realizar upload do arquivo .csv
<img src="/sprint05/evidencias/img/Arquivo Data carregado no bucket.png">

## **Passo 3**
- Realizar consultas usando o S3Select
<img src="/sprint05/evidencias/img/Executar consultas com o S3 Select.png">

### Cláusula que filtra dados usando ao menos dois operadores lógicos
- Consulta que filtra no ano de 2014 os cursos com doutorado
``` 
SELECT * FROM s3object where ano = '2014' and NivelCursoPG = 'Doutorado'; 
```
<img src="/sprint05/evidencias/img/Cursos em 2014 com nivel Doutorado.png">

### Duas funções de Agregação
- Consulta que filtra os totais de alunos matriculados em um ano especifico.
``` 
SELECT SUM(CAST(NrMatriculados AS INTEGER)) AS TotalMatriculados FROM S3Object WHERE Ano = '2018';
```
<img src="/sprint05/evidencias/img/Alunos matriculados .png">

### Uma função condicional
- Consulta agrupa entre Alto e Baixo conforme número de alunos matriculados, caso tenha mais de 100 temos respota "Alto", menores que 100 temos resposta "Baixo"
```
SELECT NomePPG, CASE WHEN CAST(NrMatriculados AS INTEGER) > 100 THEN 'Alto' ELSE 'Baixo' END AS MatriculadosClassificacao FROM S3Object;
```
<img src="/sprint05/evidencias/img/Nivel de alunos matriculados.png">

### Consulta adicional juntando as informações
```
SELECT NomePPG, UPPER(siglaPPG) AS NomeAbreviado, CAST(NrMatriculados AS INT) AS TotalMatriculados, CASE WHEN CAST(NrMatriculados AS INT) > 100 THEN 'Alto' ELSE 'Baixo' END AS MatriculadosClassificacao FROM S3Object WHERE Ano = '2014' AND NivelCursoPG = 'Doutorado';
```
<img src="/sprint05/evidencias/img/consultaGeral.png">


# **Usando Boto3**

## **Passo 1**
- Instalação da biblioteca Boto3
```
pip install boto3
```
## **Passo 2**
- Definir as credenciais na pasta .aws/credentias
<img src="/sprint05/evidencias/img/credentials.png">

## **Passo 3**
- Criação do script em python

1. Importar boto3(biblioteca que permite interagir com os serviços da AWS), e criamos uma sessão com AWS Com o perfil chamado(profile_name se refere as credencias armazenadas localmente na maquina)
```
import boto3
session = boto3.Session(profile_name='982081093508_AdministratorAccess')
```
2. A sessão AWS cria um cliente S3 e defimos a região usada
```
s3_client = session.client('s3', region_name='us-east-1')  
```
3. Definimos as variaveis que vao armazenar os nomes do bucket e do arquivo .csv
```
nome_bucket = 'desafio-sprint05'
nome_arquivoCsv = 'dadosabertos_pos-graduacao_programas.csv'
```
4. Realizamos a consulta no S3Select
```
sql_query = """
SELECT NomePPG, UPPER(NomePPG) AS NomeAbreviado, CAST(NrMatriculados AS INT) AS TotalMatriculados, CASE WHEN CAST(NrMatriculados AS INT) > 100 THEN 'Alto' ELSE 'Baixo' END AS MatriculadosClassificacao FROM S3Object WHERE Ano = '2014' AND NivelCursoPG = 'Doutorado';
"""
```
5. Criamos uma função para executar o S3Select
```
def run_s3_select(bucket, key, query):
    try:
        response = s3_client.select_object_content(
            Bucket=bucket,
            Key=key,
            ExpressionType='SQL',
            Expression=query,
            InputSerialization={
                'CSV': {
                    'FileHeaderInfo': 'USE',
                    'FieldDelimiter': ';' 
                }
            },
            OutputSerialization={'CSV': {}}
        )
```
6. Realizamos a leitura da resposta do select e executamos a função!        
```
        for event in response['Payload']:
            if 'Records' in event:
                print(event['Records']['Payload'].decode('utf-8'))
            if 'Progress' in event:
                print("Progress:", event['Progress'])
            if 'Stats' in event:
                print("Stats:", event['Stats'])
    
    except Exception as e:
        print(f"Erro inesperado: {e}")

run_s3_select(nome_bucket, nome_arquivoCsv, sql_query)

```










