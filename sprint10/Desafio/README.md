# **Desafio**
1. Objetivo: 
- Responder apresentando no quicksight as perguntas criadas:
    - Qual a relação entre a duração dos filmes e suas avaliações ? 
    - Quais atores têm o maior número de filmes no gênero? 
    - Quais filmes tiveram o maior número de avaliação em cada ano de lançamento?
    - Quais diretores têm o maior número de filmes no gênero?


## Passo 1 
- Criação dos conjuntos de dados no quicksight com objetivo de iniciar a análise, 
- Para isso foram criado conjutos de dados para todas as tabelas(dimensões e fato)
<img src='../evidencias/img/ConjuntoDados.png'>

## Passo 2
- Após a criação dos conjuntos de dados, vamos fazer um *FULLJOIN* das tabelas dimensões com a fato, da seguinte maneira: 
<img src='../evidencias/img/UniaoDosDados.png'>

## Passo 3
- Criação dos gráficos 

### Qual a relação entre a duração dos filmes e suas avaliações ? 
- Usando gráfico de linhas para melhor representação, fazemos a seguinte configuração para gerar o gráfico da maneira correta: 
<img src='../evidencias/img/CriacaoFilmeDuracao.png'>

### Quais atores têm o maior número de filmes no gênero? 
- Usando gráfico de barras empilhadas para melhor representação, fazemos a seguinte configuração para gerar o gráfico da maneira correta: 
<img src='../evidencias/img/CriacaoAtoresGenero.png'>

### Quais filmes tiveram o maior número de avaliação em cada ano de lançamento?
- Usando uma tabela para melhor representação, fazemos a seguinte configuração para gerar o gráfico da maneira correta: 
<img src='../evidencias/img/CriacaoMelhoresFilmesPorAno.png'>

### Quais diretores têm o maior número de filmes no gênero?
- Usando gráficos de barras horizontais para melhor representação, fazemos a seguinte configuração para gerar o gráfico da maneira correta: 
<img src='../evidencias/img/CriacaoDiretoresGenero.png'>




























Qual foi o gênero de filmes e séries abordado e qual foi o refinamento que você definiu para sua entrega final?

Quais foram as etapas do desafio? Como você as desenvolveu? Houve dificuldades? Nos mostre um pouco do código em execução

Como ficou seu modelo de dados? Apresente via diagrama ou utilizando o Glue Catalog. Importante descrever como você imaginou seu modelo dimensional.

Como ficou seu dashboard? O que os dados estão nos contando? Mostre os dashboards funcionando de forma responsiva.

Como você imagina que os conhecimentos obtidos no decorrer do Programa de Bolsas podem gerar valor para os clientes da Compass?

E por fim, indique apenas uma área de interesse: Engenharia de Dados, Análise de Dados ou Visualização de Dados