## Exercicio Apache-Spark
### Passo 1
- Iniciamos fazendo o download da imagem Docker com Spark e Jupyer com o comando 
``` 
docker pull jupyter/all-spark-notebook 
```
### Passo 2
- Criar um container com o Jupyer e Spark com o comando 
```
docker run -p 8888:8888 -it jupyter/app-spark-notebook
```
- Com isso vamos iniciar o Jupyer Lab e no terminal vamos receber um token e um link de acesso, por exemplo
*[I 2024-10-02 16:35:18.907 ServerApp]     http://127.0.0.1:2b91374cadfb7804b903324c9*

### Passo 3 
- Em um outro terminal executamos o comando *docker ps* e copiamos o ID do nosso container
- Então acessamos o bash do nosso container com o comando:
```
docker exec -it 97e7e159cd45 bash   
```
- Em seguida, entramos no GitHub, selecinamos o README.md, **imporante, o arquivo deve ser localizado como RAW**
<img src="../evidencias/img/GitHUB_RAW.png">

- Enfim rodamos o comando abaixo para fazer download do arquivo: 
```
https://raw.githubusercontent.com/RodriguesBernardo/CompassUOL_/refs/heads/main/README.md?token=GHSAT0AAAAAACUUUND4BIMJ7DXP6PV5RBGAZX5PCNQ
``` 
- Conferimos o local que foi feito o download e se nao tivemos nenhum imprevisto com o comando com o comando *ls*

### Passo 4
- Acessamos o navegador com o link que conseguimos no *Passo 2*, para entrarmos no Jupyer Lab, então selecionamos o formato desejado

#### Criação do arquivo main.py
1. Importamos a biblioteca necessaria, inicializamos o *SparkContext*, e carregamos o *README.md* informando o caminho: 
```
from pyspark import SparkContext
sc = SparkContext.getOrCreate()
arquivo = sc.textFile("/home/jovyan/README.md")
```

2. Dividimos as linhas em palavras, criamos uma váriavel que armazena o total de palavras no arquivo
```
palavras = arquivo.flatMap(lambda line: line.split(" "))
total_palavras = palavras.count()
```
3. Criamos pares para cada palavra usando a função map e criamos a variavel contador, verificar as ocorrencias de cada palavra: 
```
paresPalavras = palavras.map(lambda word: (word, 1))
contador = paresPalavras.reduceByKey(lambda a, b: a + b)
```
4. Por fim, coletamos os resultados e mostramos na tela
```
contador.collect()
print(f"O numero total de palavras são: {total_palavras}")
```



## Exercicio Lab AWS GLUE
