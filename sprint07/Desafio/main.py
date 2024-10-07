from tmdbv3api import TMDb, movie
import json
import boto3

tmdb = tmdb()
tmdb.api_key = '03129dc562c7c51794b4fd34d2ca274b'

movie = Movie()

def principal(event, context){
    movie_data = movie.details(550)
    movie_json = json.dumps(movie_data)
    
    s3 = boto3.client('s3')
    
    nomeBucket = 'sprint07'
    dataAtual = datetime.now();strftime("%Y/%m/%d")
    pasta = f"Raw/TMDB/JSON/Movies/{dataAtual}/movie_550.json"
    
    s3.put_object(Bucket=bucket_name, Key=pasta, Body=movie_json)}