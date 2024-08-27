numeros = ["8000", "7998", "7996", "7994", "7994", "123", "456", "789", "1011", "2024", "3036", "4048", "5050"]

numeros_inteiros = list(map(int, numeros))

pares = filter(lambda x: x % 2 == 0, numeros_inteiros)

pares_ordenados = sorted(pares, reverse=True)

cinco_maiores_pares = pares_ordenados[:5]

soma_cinco_maiores = sum(cinco_maiores_pares)

print(cinco_maiores_pares)

print(soma_cinco_maiores)
