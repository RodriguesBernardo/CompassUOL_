# **Evidencias**
## Evidencias do funcionamento do bucket e do S3Select

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
