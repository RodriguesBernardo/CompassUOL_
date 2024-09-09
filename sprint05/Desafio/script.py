import boto3

s3_client = boto3.client('s3')

bucket_name = 'desafio-sprint05'
file_key = 'dadosabertos_pos-graduacao_programas.csv'  
expression = """
SELECT * FROM s3object where ano = '2014' and NivelCursoPG = 'Doutorado'; 
"""


# Chama o S3 Select para realizar a consulta
response = s3_client.select_object_content(
    Bucket=bucket_name,
    Key=file_key,
    ExpressionType='SQL',
    Expression=expression,
    InputSerialization={'CSV': {"FileHeaderInfo": "USE"}},
    OutputSerialization={'CSV': {}}
)

# Imprime o resultado da consulta
for event in response['Payload']:
    if 'Records' in event:
        # Decodifica o payload dos registros e imprime
        print(event['Records']['Payload'].decode('utf-8'))

    if 'Stats' in event:
        # Imprime estatísticas se disponível
        print("S3 Select statistics:", event['Stats'])
        
    if 'End' in event:
        # Sinaliza o fim da resposta
        print("End of response")