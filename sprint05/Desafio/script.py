import boto3

# Cria sessão com o perfil selecionado
session = boto3.Session(profile_name='982081093508_AdministratorAccess')
s3_client = session.client('s3', region_name='us-east-1')  


# Nome do bucket e do Arquivo CSV
nome_bucket = 'desafio-sprint05'
nome_arquivoCsv = 'dadosabertos_pos-graduacao_programas.csv'


# Informamos a query que vamos executar no S3Select
sql_query = """
SELECT NomePPG, UPPER(siglaPPG) AS NomeAbreviado, CAST(NrMatriculados AS INT) AS TotalMatriculados, CASE WHEN CAST(NrMatriculados AS INT) > 100 THEN 'Alto' ELSE 'Baixo' END AS MatriculadosClassificacao FROM S3Object WHERE Ano = '2014' AND NivelCursoPG = 'Doutorado';
"""
# Função para executar a query 
def run_s3_select(bucket, key, query):
    try:
        response = s3_client.select_object_content( #função do boto3 para selecionar conteudo de um objeto no S3
            Bucket=bucket,  # Pega o nome do bucket
            Key=key,        # Pega o nome do arquivo CSV
            ExpressionType='SQL',  # Informa que a expressao executada é SQL
            Expression=query,      # Informa a consulta SQL que vai ser executada
            InputSerialization={
                'CSV': {     # Informa que a entrada é CSV
                    'FileHeaderInfo': 'USE' ,    # Usa o cabeçalho do CSV para informar os dados
                    'FieldDelimiter': ';'        # Informa o delimitador
                }
            },
            OutputSerialization={'CSV': {}}      # Informa que a saida vai ser CSV
        )
        
        for event in response['Payload']:
            if 'Records' in event: # Verifica se a consulta teve registros
                print(event['Records']['Payload'].decode('utf-8')) # Exibe o resultado da consulta decodificado
            if 'Progress' in event:
                print("Progress:", event['Progress'])
            if 'Stats' in event:
                print("Stats:", event['Stats'])
    
    except Exception as e:
        print(f"Erro inesperado: {e}") # Exibe mensagem de erro se tiver

run_s3_select(nome_bucket, nome_arquivoCsv, sql_query) # Chama a função com os dados informados no inicio do código
