def ler_e_imprimir_arquivo(caminho_arquivo):
    try:
        
        with open(caminho_arquivo, 'r') as arquivo:
        
            conteudo = arquivo.read().rstrip('\n')  
            print(conteudo, end='') 
    except FileNotFoundError:
        print(f"Arquivo {caminho_arquivo} não encontrado.")
    except IOError:
        print(f"Erro ao ler o arquivo {caminho_arquivo}.")


caminho_arquivo = 'arquivo_texto.txt'


ler_e_imprimir_arquivo(caminho_arquivo)
