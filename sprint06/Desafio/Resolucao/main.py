import boto3
import pandas as pd
import os
from datetime import datetime


# Cria uma sessão com o perfil de credenciais especificado
session = boto3.Session(profile_name='982081093508_AdministratorAccess')
s3 = session.client('s3')


nomeBucket = 'sprint-06'            # Variavel informando o nome do bucket
caminhoRawZone = 'Raw/Local/CSV/'   # Variavel define a pasta onde os dados brutos serao armazenados
caminhoCSV_movies = 'movies.csv'    # Variavel informa o caminho do arquivo 
caminhoCSV_series = 'series.csv'    # Variavel informa o caminho do arquivo 
delimitador = '|'                   # Variavel informa o delimitador do arquivo CSV

# Criamos uma função para pegar a data atual registrada no SO
def pegarData():
    hoje = datetime.today()
    return hoje.strftime("%d/%m/%Y")

# Criamos uma função para fazer o upload pro S3
def uploadS3(caminho_arquivo, caminhoS3):
    try:
        # Tentamos fazer o upload do arquivo, e exibimos mensagem de sucesso
        s3.upload_file(caminho_arquivo, nomeBucket, caminhoS3)
        print(f"Arquivo {caminho_arquivo} enviado com sucesso para o bucket {nomeBucket}")
    # Caso de algum erro informamos    
    except Exception as e: 
        print(f"Erro ao enviar o arquivo {caminho_arquivo} ERRO: {e}")

# Criamos uma função para processar os arquivos de filmes e series
def processarArquivos():
    ## ------ ENVIAR FILMES ------ 
    try:
        # Fazemos a leitura do arquivo 
        movies_ = pd.read_csv(caminhoCSV_movies, delimiter=delimitador)
        print("Arquivos de Filmes lido com sucesso!")
        # Definimos o caminho no S3 onde sera armazenados
        caminhoS3Filmes = f"{caminhoRawZone}Movies/{pegarData()}/{caminhoCSV_movies}"
        # Chamamos a função uploadS3 para fazer upload do arquivo
        uploadS3(caminhoCSV_movies, caminhoS3Filmes)
        print("Sucesso ao enviar arquivos de filmes")
    except Exception as e:
        # Caso ocorra algum erro, informamos:
        print(f"Erro ao processar o arquivo de filmes: {e}") 
    
    ## ------ ENVIAR SÉRIES ------ 
    try: 
        # Fazemos a leitura do arquivo 
        series_ = pd.read_csv(caminhoCSV_series, delimiter=delimitador)
        print("Arquivo de séries lido com sucesso")
        # Definimos o caminho no S3 onde sera armazenados
        caminhoS3Series = f"{caminhoRawZone}Series/{pegarData()}/{caminhoCSV_series}"
        # Chamamos a função uploadS3 para fazer upload do arquivo
        uploadS3(caminhoCSV_series, caminhoS3Series)
    except Exception as e:
        # Caso ocorra algum erro, informamos:
        print(f"Erro ao processar o arquivo de séries: {e}")    
        
if __name__ == "__main__":
    processarArquivos()  # Executamos a função 