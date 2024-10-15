import random

numAleatorios = [random.randint(1, 800) for _ in range(250)]
numAleatorios.reverse()
print(numAleatorios)