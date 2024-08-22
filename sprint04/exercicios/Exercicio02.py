def conta_vogais(contador):
    vogais = filter(lambda contador: contador in 'aeiouAEIOU', contador)
    return len(list(vogais))

print(conta_vogais)