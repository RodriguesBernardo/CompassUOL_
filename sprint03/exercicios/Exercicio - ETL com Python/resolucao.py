import re

def ler_arquivo(caminho_arquivo):
    with open(caminho_arquivo, 'r') as arquivo:
        linhas = arquivo.readlines()
    return linhas

def escrever_arquivo(caminho_arquivo, conteudo):
    with open(caminho_arquivo, 'w') as arquivo:
        arquivo.write(conteudo)

def linha_para_lista(linha):
    
    return re.split(r',(?=(?:[^"]*"[^"]*")*[^"]*$)', linha.strip())

def etapa_1(linhas):
    maior_numero_filmes = 0
    ator_maior_numero_filmes = ""
    
    for linha in linhas[1:]:  
        dados = linha_para_lista(linha)
        ator = dados[0]
        try:
            numero_filmes = int(float(dados[2])) 
        except ValueError:
            continue
        
        if numero_filmes > maior_numero_filmes:
            maior_numero_filmes = numero_filmes
            ator_maior_numero_filmes = ator
    
    resultado = f"{ator_maior_numero_filmes} {maior_numero_filmes}\n"
    escrever_arquivo('etapa-1.txt', resultado)
    print("Etapa 1 concluída.")

def etapa_2(linhas):
    somatorio_gross = 0
    total_filmes = 0
    
    for linha in linhas[1:]: 
        dados = linha_para_lista(linha)
        if len(dados) < 6:
            continue
        try:
            gross = float(dados[5])  
        except ValueError:
            continue
        somatorio_gross += gross
        total_filmes += 1
    
    if total_filmes > 0:
        media_gross = somatorio_gross / total_filmes
    else:
        media_gross = 0
    resultado = f"{media_gross:.2f}\n"
    escrever_arquivo('etapa-2.txt', resultado)
    print("Etapa 2 concluída.")

def etapa_3(linhas):
    maior_media = 0
    ator_maior_media = ""
    
    for linha in linhas[1:]:  
        dados = linha_para_lista(linha)
        ator = dados[0]
        try:
            media_por_filme = float(dados[3])
        except ValueError:
            continue
        
        if media_por_filme > maior_media:
            maior_media = media_por_filme
            ator_maior_media = ator
    
    resultado = f"{ator_maior_media} {maior_media:.2f}\n"
    escrever_arquivo('etapa-3.txt', resultado)
    print("Etapa 3 concluída.")

def etapa_4(linhas):
    filmes_count = {}
    
    for linha in linhas[1:]:
        dados = linha_para_lista(linha)
        if len(dados) < 6:
            continue
        filme = dados[5]
        
        if filme in filmes_count:
            filmes_count[filme] += 1
        else:
            filmes_count[filme] = 1
    
    filmes_ordenados = sorted(filmes_count.items(), key=lambda item: (-item[1], item[0]))
    
    resultado = "\n".join([f"O filme ({filme}) aparece ({quantidade}) vez(es) no dataset" for filme, quantidade in filmes_ordenados]) + "\n"
    escrever_arquivo('etapa-4.txt', resultado)
    print("Etapa 4 concluída.")

def etapa_5(linhas):
    atores_total_gross = {}
    
    for linha in linhas[1:]: 
        dados = linha_para_lista(linha)
        if len(dados) < 2:
            continue
        ator = dados[0]
        try:
            total_gross = float(dados[1])
        except ValueError:
            continue
        
        atores_total_gross[ator] = total_gross
    
    atores_ordenados = sorted(atores_total_gross.items(), key=lambda item: -item[1])
    
    resultado = "\n".join([f"{ator} - {total_gross:.2f}" for ator, total_gross in atores_ordenados]) + "\n"
    escrever_arquivo('etapa-5.txt', resultado)
    print("Etapa 5 concluída.")

caminho_arquivo = 'C:/Users/bezudow/Desktop/CompassUOL/CompassUOL_/sprint03/exercicios/Exercicio - ETL com Python/actors.csv'
linhas = ler_arquivo(caminho_arquivo)

etapa_1(linhas)
etapa_2(linhas)
etapa_3(linhas)
etapa_4(linhas)
etapa_5(linhas)

print("Todas as etapas concluídas.")
