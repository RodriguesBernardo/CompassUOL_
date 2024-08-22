import csv

def processar_estudantes(nome_arquivo):
    with open(nome_arquivo, mode='r') as file:
        leitor = csv.reader(file)
        estudantes = []
        for linha in leitor:
            nome = linha[0].strip()  
            notas = list(map(float, linha[1:])) 
            maiores_notas = sorted(notas, reverse=True)[:3]
            media = round(sum(maiores_notas) / len(maiores_notas), 2)
            estudantes.append((nome, maiores_notas, media))
    
    estudantes = sorted(estudantes, key=lambda x: x[0])
    
    for estudante in estudantes:
        nome, notas, media = estudante
        print(f"Nome: {nome} Notas: {notas} Média: {media:.2f}")

