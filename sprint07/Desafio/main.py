import json
import boto3
import os
from tmdbv3api import TMDb, Movie
from datetime import datetime

TMDB_API_KEY = '03129dc562c7c51794b4fd34d2ca274b'

tmdb = TMDb()
tmdb.api_key = TMDB_API_KEY

s3 = boto3.client('s3')

def lambda_handler(event, context):
    try:
        filme = Movie()
        id_filme = event.get("id_filme", 180) 
        detalhes_filme = filme.details(id_filme)
        
        dados_filme = detalhes_filme.__dict__
        dados_filme_serializáveis = {key: value for key, value in dados_filme.items() if isinstance(value, (dict, list, str, int, float, bool))}

        bucket_s3 = 'sprint07'
    
        data_atual = datetime.now()
        ano = data_atual.strftime("%Y")
        mes = data_atual.strftime("%m")
        dia = data_atual.strftime("%d")
        
        camada_armazenamento = "raw" 
        origem_dado = "TMDB"
        formato_dado = "JSON"
        especificacao_dado = "details"

        caminho_s3 = f"{camada_armazenamento}/{origem_dado}/{formato_dado}/{especificacao_dado}/{ano}/{mes}/{dia}/{id_filme}.json"
        
        
        s3.put_object(
            Body=json.dumps(dados_filme_serializáveis, ensure_ascii=False, indent=4),
            Bucket=bucket_s3,
            Key=caminho_s3
        )
        
    
        return {
            'statusCode': 200,
            'body': json.dumps(f"Dados do filme ID {id_filme} salvos com sucesso no S3 em {caminho_s3}")
        }
        
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(f"Erro ao salvar dados do filme: {str(e)}")
        }


