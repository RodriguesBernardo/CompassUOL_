def DividirLista(lista):
    tamanho_parte = len(lista) // 3
    parte1 = lista[:tamanho_parte]
    parte2 = lista[tamanho_parte:tamanho_parte*2]
    parte3 = lista[tamanho_parte * 2:]

    return parte1, parte2, parte3
    


lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

parte1,parte2,parte3 = DividirLista(lista)

print(parte1,parte2,parte3)