## Exercicio 01
```
numeros = ["8000", "7998", "7996", "7994", "7994", "123", "456", "789", "1011", "2024", "3036", "4048", "5050"]

numeros_inteiros = list(map(int, numeros))

pares = filter(lambda x: x % 2 == 0, numeros_inteiros)

pares_ordenados = sorted(pares, reverse=True)

cinco_maiores_pares = pares_ordenados[:5]

soma_cinco_maiores = sum(cinco_maiores_pares)

print(cinco_maiores_pares)

print(soma_cinco_maiores)

```

## Exercicio 02
```
def conta_vogais(contador):
    vogais = filter(lambda contador: contador in 'aeiouAEIOU', contador)
    return len(list(vogais))

print(conta_vogais)
```

## Exercicio 03
```
from functools import reduce

def calcula_saldo(lancamentos) -> float:
    valores = map(lambda x: x[0] if x[1] == 'C' else -x[0],lancamentos)
    saldo_final = reduce(lambda saldo, valor: saldo + valor, valores)
    return saldo_final
```

## Exercicio 04
```
def calcular_valor_maximo(operadores, operandos):
    def aplicar_operacao(op, x, y):
        if op == '+':
            return x + y
        elif op == '-':
            return x - y
        elif op == '*':
            return x * y
        elif op == '/':
            return x / y
        elif op == '%':
            return x % y
        else:
            raise ValueError(f"Operação {op} não suportada")

    resultados = map(lambda t: aplicar_operacao(t[0], t[1][0], t[1][1]), zip(operadores, operandos))
    return max(resultados)

operadores = ['+', '-', '*', '/', '+']
operandos  = [(3, 6), (-7, 4.9), (8, -8), (10, 2), (8, 4)]

print(calcular_valor_maximo(operadores, operandos))  


```

## Exercicio 05
```
import csv

def process_line(line):
    nome = line[0]
    notas = list(map(int, line[1:]))
    notas.sort(reverse=True)
    top_three = notas[:3]
    media = round(sum(top_three) / len(top_three), 2)
    return (nome, top_three, media)


def generate_report(filename):
    with open(filename, newline='', encoding='utf-8') as csvfile:
        reader = csv.reader(csvfile)
        processed_data = [process_line(row) for row in reader]


    sorted_data = sorted(processed_data, key=lambda x: x[0])


    for nome, top_three, media in sorted_data:
        if media.is_integer():
            print(f'Nome: {nome} Notas: {top_three} Média: {media:.1f}')
        else:
            print(f'Nome: {nome} Notas: {top_three} Média: {media:.2f}')

generate_report('estudantes.csv')

```

## Exercicio 06
```
def filtrar_acima_da_media(conteudo):
    precos = list(conteudo.values())
    media = sum(precos) / len(precos) 
    acima_da_media = {nome: preco for nome, preco in conteudo.items() if preco > media}   
    produtos_ordenados = sorted(acima_da_media.items(), key=lambda item: item[1])
    
    return produtos_ordenados

```

## Exercicio 07
```
def pares_ate(n:int):
    for i in range(2, n + 1):
        if i % 2 == 0:
            yield i
```
