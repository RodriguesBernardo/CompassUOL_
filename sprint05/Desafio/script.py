import boto3

session = boto3.Session(profile_name='982081093508_AdministratorAccess')
s3_client = session.client('s3', region_name='us-east-1')  

bucket_name = 'desafio-sprint05'
file_key = 'dadosabertos_pos-graduacao_programas.csv'

sql_query = """
SELECT * FROM s3object WHERE ano = '2014' AND NivelCursoPG = 'Doutorado'
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

run_s3_select(bucket_name, file_key, sql_query)
