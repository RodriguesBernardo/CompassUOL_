# Exercicios Python.

## Exercicio 01

```
nome = "Bernardo"  
idade = 20     
ano_atual = 2024
anos_restantes = 100 - idade
ano = ano_atual + anos_restantes
print(f"{ano}")
```
## Exercicio 02
```
numeros = list(range(1, 4)) 
for numero in numeros:
    if numero % 2 == 0:
        print(f"Par: {numero}")
    else:
        print(f"Ímpar: {numero}")
```
## Exercicio 03
```
numeros = list(range(0, 21)) 
for numero in numeros:
    if numero % 2 == 0:
        print(f"{numero}")
```

## Exercicio 04
```
numeros = list(range(1, 101))
for numero in numeros:
    if numero > 1:  
        primo = True
        for i in range(2, int(numero**0.5) + 1):
            if numero % i == 0:
                primo = False
                break
        if primo:
            print(numero)
```

## Exercicio 05
```
dia = 22
mes = 10
ano = 2022

print(f'{dia}/{mes}/{ano}')
```
## Exercicio 06
```
a = [1, 1, 2, 3, 5, 8, 14, 21, 34, 55, 89]
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]


setA = set(a)
setB = set(b)

interseccao = setA & setB

print(list(interseccao))
```
## Exercicio 07
```
a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

impares = [i for i in a if i % 2 != 0]

print(impares)
```
## Exercicio 08
```
lista = ['maça', 'arara', 'audio', 'radio', 'radar', 'moto']

for palavra in lista:
    if palavra == palavra[::-1]:
        print(f"A palavra: {palavra} é um palíndromo")
    else:
        print(f"A palavra: {palavra} não é um palíndromo")
```
## Exercicio 09
```
primeirosNomes = ['Joao', 'Douglas', 'Lucas', 'José']
sobreNomes = ['Soares', 'Souza', 'Silveira', 'Pedreira']
idades = [19, 28, 25, 31]

for indice, (primeiroNome, sobreNome, idade) in enumerate(zip(primeirosNomes, sobreNomes, idades)):
    print(f"{indice} - {primeiroNome} {sobreNome} está com {idade} anos")
```
## Exercicio 10
```
lista = ['abc', 'abc', 'abc', '123', 'abc', '123', '123']

listaAtualizada = list(set(lista))


print(listaAtualizada)
```

## Exercicio 11
```
```
## Exercicio 12
```
```

## Exercicio 13
```
```
## Exercicio 14
```
```
## Exercicio 15
```
```
## Exercicio 16
```
```
## Exercicio 17
```
```
## Exercicio 18
```
```
## Exercicio 20
```
```
## Exercicio 21
```
```
## Exercicio 22
```
```
## Exercicio 23
```
```
## Exercicio 24
```
```
## Exercicio 25
```
```
## Exercicio 26
```
```