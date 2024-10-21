import json
import boto3
from tmdbv3api import TMDb, TV
from datetime import datetime

tmdb = TMDb()
tmdb.api_key = '03129dc562c7c51794b4fd34d2ca274b'

s3 = boto3.client('s3')

def lambda_handler(event, context):
    series = TV()

    dados_series = []

    series_melhores_avaliadas = series.top_rated()

    hoje = datetime.today()
    ano = hoje.strftime('%Y')
    mes = hoje.strftime('%m')
    dia = hoje.strftime('%d')

    for s in series_melhores_avaliadas:
        ano_lancamento = s.first_air_date.split('-')[0] if s.first_air_date else None
        detalhes_das_series = series.details(s.id)
        duracao_dos_episodios = detalhes_das_series.episode_run_time[0] if detalhes_das_series.episode_run_time and detalhes_das_series.episode_run_time[0] > 0 else None
        generos_series = [genero['name'] for genero in detalhes_das_series.genres] if detalhes_das_series.genres else None

        dados_series.append({
            "id": s.id,
            "tituloPrincipal": s.name,
            "tituloOriginal": s.original_name,
            "anoLancamento": ano_lancamento,
            "tempoMinutos": duracao_dos_episodios,
            "genero": generos_series,
            "notaMedia": s.vote_average,
            "numeroVotos": s.vote_count
        })
        
    dados_agrupados_series = [dados_series[i:i + 100] for i in range(0, len(dados_series), 100)]

    bucket_name = 'sprint07'
    for index, group in enumerate(dados_agrupados_series):
        dados_json = json.dumps(group)
        nome_arquivo = f"raw/TMDB/JSON/{ano}/{mes}/{dia}/series_{index + 2}.json"
        s3.put_object(Bucket=bucket_name, Key=nome_arquivo, Body=dados_json)

    return {
        'statusCode': 200,
        'body': json.dumps(f"Dados de séries gravados com sucesso: {len(dados_agrupados_series)} arquivos de séries criados.")
    }
