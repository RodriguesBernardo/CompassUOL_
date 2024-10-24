import requests
import pandas as pd 
from IPython.display import display
from dotenv import load_dotenv
import os


load_dotenv()

api_key = os.getenv('API_KEY')

url = f'https://api.themoviedb.org/3/movie/top_rated?api_key={api_key}&language=pt-BR'

response = requests.get(url)
data = response.json()

filmes = []

for movie in data['results']:
    df = {'Titulo': movie['title'],
          'Data de Lançamento': movie['release_date'],
          'Visão geral': movie['overview'],
          'Votos': movie['vote_average'],
          'Média de votos:':movie['vote_average']}

filmes.append(df)

df = pd.DataFrame(filmes)
display(df)