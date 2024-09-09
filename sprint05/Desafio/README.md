# **Desafio**
1. Objetivo: 
* Praticar uso de AWS S3 Select, fazendo consultas usando o S3Select ou Desenvolver um código Python usando Boto3
2. Atividade:
* Escolher um arquivo CSV único na turma, no portal de dados públicos do Governo Brasileiro: http://dados.gov.br para realizar as consultas

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