import json
import boto3
import os
from tmdbv3api import TMDb, Movie

# Define a chave da API do TMDb (The Movie Database)
TMDB_API_KEY = '03129dc562c7c51794b4fd34d2ca274b'

# Inicializa a biblioteca TMDb e define a chave da API
tmdb = TMDb()
tmdb.api_key = TMDB_API_KEY

# Inicializa o cliente S3 do boto3 
s3 = boto3.client('s3')

# Função Lambda para processar a solicitação
def lambda_handler(event, context):
    try:
        # Inicializa a classe Movie da API TMDb
        filme = Movie()

        # Recupera o ID do filme do evento, se não houver, usa 550 como padrão
        id_filme = event.get("id_filme", 550)

        # Obtém os detalhes do filme da API TMDb com base no ID fornecido
        detalhes_filme = filme.details(id_filme)

        # Converte os detalhes do filme em um dicionário
        dados_filme = detalhes_filme.__dict__
        
        # Filtra os dados do filme para garantir que apenas tipos de dados serializáveis sejam mantidos
        dados_filme_serializáveis = {key: value for key, value in dados_filme.items() 
                                     if isinstance(value, (dict, list, str, int, float, bool))}

        # Define o bucket S3
        bucket_s3 = 'sprint07'

        # Define o caminho dentro do bucket S3 onde o arquivo JSON será salvo
        caminho_s3 = f"desafio/TMDB/JSON/{id_filme}.json"
        
        # Converte os dados do filme em JSON e os envia para o bucket S3
        s3.put_object(
            Body=json.dumps(dados_filme_serializáveis, ensure_ascii=False, indent=4),
            Bucket=bucket_s3,
            Key=caminho_s3
        )
        
        return {
            'statusCode': 200,
            'body': json.dumps(f"Dados do filme ID {id_filme} salvos com sucesso no S3 em {caminho_s3}")
        }
        
    # Em caso de erro, retorna uma resposta de erro e a mensagem correspondente
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(f"Erro ao salvar dados do filme: {str(e)}")
        }
