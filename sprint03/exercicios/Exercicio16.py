def soma_numeros(string_numero):
    numeros = map(int, string_numero.split(','))
    return sum(numeros)


string_numeros = "1,3,4,6,10,76"

resultado  = soma_numeros(string_numeros)
print(resultado)