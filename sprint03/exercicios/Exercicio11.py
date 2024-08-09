import json

def ler_e_imprimir_json(caminho_arquivo):
    try:
        with open(caminho_arquivo, 'r') as arquivo:
            dados = json.load(arquivo)
        
            print(dados)
    except FileNotFoundError:
        print(f"Arquivo {caminho_arquivo} não encontrado.")
    except json.JSONDecodeError:
        print("Erro ao decodificar o JSON.")


caminho_arquivo = 'person.json'


ler_e_imprimir_json(caminho_arquivo)
