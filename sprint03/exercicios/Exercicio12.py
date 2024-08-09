def my_map (list, f):
    return [f(x) for x in list]

def square(x):
    return x ** 2


lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

resultado = my_map(lista, square)

print(resultado)