def filtrar_acima_da_media(conteudo):
    precos = list(conteudo.values())
    media = sum(precos) / len(precos) 
    acima_da_media = {nome: preco for nome, preco in conteudo.items() if preco > media}   
    produtos_ordenados = sorted(acima_da_media.items(), key=lambda item: item[1])
    
    return produtos_ordenados
