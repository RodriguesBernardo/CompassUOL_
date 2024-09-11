import boto3

session = boto3.Session(profile_name='982081093508_AdministratorAccess')
s3_client = session.client('s3', region_name='us-east-1')  

nome_bucket = 'desafio-sprint05'
nome_arquivoCsv = 'dadosabertos_pos-graduacao_programas.csv'

sql_query = """
SELECT NomePPG, UPPER(NomePPG) AS NomeAbreviado, CAST(NrMatriculados AS INT) AS TotalMatriculados, CASE WHEN CAST(NrMatriculados AS INT) > 100 THEN 'Alto' ELSE 'Baixo' END AS MatriculadosClassificacao FROM S3Object WHERE Ano = '2014' AND NivelCursoPG = 'Doutorado';
"""

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
