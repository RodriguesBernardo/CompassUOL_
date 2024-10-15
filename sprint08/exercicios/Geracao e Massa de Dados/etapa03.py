import random
import names
import time 
import os

random.seed(40)

qtd_nomes_unicos = 3000
qtd_nomes_aleatorios = 10000000

aux = []
for i in range(qtd_nomes_unicos):
    aux.append(names.get_full_name())
print(f'Gerando {qtd_nomes_aleatorios} nomes aleatórios...')

dados = []
for i in range(qtd_nomes_aleatorios):
    dados.append(random.choice(aux))

nomeArquivo = 'nomes_aleatorios.txt'
with open(nomeArquivo,'w') as arquivo:
    for nome in dados:
        arquivo.write(f'{nome}\n')

print(f"o arquivo {nomeArquivo} foi gerado com sucesso!")