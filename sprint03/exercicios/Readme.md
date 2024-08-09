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
import json

def ler_e_imprimir_json(caminho_arquivo):
    try:
        with open(caminho_arquivo, 'r') as arquivo:
            dados = json.load(arquivo)
        
            print(dados)
    except FileNotFoundError:
        print(f"Arquivo {caminho_arquivo} não encontrado.")
    except json.JSONDecodeError:
        print("Erro ao decodificar o JSON.")


caminho_arquivo = 'person.json'


ler_e_imprimir_json(caminho_arquivo)

```
## Exercicio 12
```
def my_map (list, f):
    return [f(x) for x in list]

def square(x):
    return x ** 2


lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

resultado = my_map(lista, square)

print(resultado)
```

## Exercicio 13
```
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

```
## Exercicio 14
```
def imprimir_parametros(*args, **kwargs):

    for arg in args:
        print(arg)
    

    for value in kwargs.values():
        print(value)


imprimir_parametros(1, 3, 4, 'hello', parametro_nomeado='alguma coisa', x=20)

```
## Exercicio 15
```
class Lampada:
    def __init__(self, ligada):
        self.ligada = ligada

    def liga(self):
        self.ligada = True
    
    def desliga(self):
        self.ligada = False
    
    def esta_ligada(self):
        return self.ligada


lampada = Lampada(False)

lampada.liga()

print(f'A lâmpada está ligada?{lampada.esta_ligada()}')

lampada.desliga()
print(f'A lâmpada está ligada?{lampada.esta_ligada()}')
```
## Exercicio 16
```
def soma_numeros(string_numero):
    numeros = map(int, string_numero.split(','))
    return sum(numeros)


string_numeros = "1,3,4,6,10,76"

resultado  = soma_numeros(string_numeros)
print(resultado)
```
## Exercicio 17
```
def DividirLista(lista):
    tamanho_parte = len(lista) // 3
    parte1 = lista[:tamanho_parte]
    parte2 = lista[tamanho_parte:tamanho_parte*2]
    parte3 = lista[tamanho_parte * 2:]

    return parte1, parte2, parte3
    


lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

parte1,parte2,parte3 = DividirLista(lista)

print(parte1,parte2,parte3)
```
## Exercicio 18
```
speed = {'jan':47, 'feb':52, 'march':47, 'April':44, 'May':52, 'June':53, 'july':54, 'Aug':44, 'Sept':54}


valores = speed.values()
valores_unicos = list(set(valores))


print(valores_unicos)
```
## Exercicio 19
```
import random

random_list = random.sample(range(500), 50)


valor_minimo = min(random_list)

valor_maximo = max(random_list)


media = sum(random_list) / len(random_list)


random_list.sort()


if len(random_list) % 2 == 0:
    mediana = (random_list[len(random_list) // 2 - 1] + random_list[len(random_list) // 2]) / 2
else:
    mediana = random_list[len(random_list) // 2]


print(f"Media: {media}, Mediana: {mediana}, Mínimo: {valor_minimo}, Máximo: {valor_maximo}")

```
## Exercicio 20
```
import random

random_list = random.sample(range(500), 50)


valor_minimo = min(random_list)

valor_maximo = max(random_list)


media = sum(random_list) / len(random_list)


random_list.sort()


if len(random_list) % 2 == 0:
    mediana = (random_list[len(random_list) // 2 - 1] + random_list[len(random_list) // 2]) / 2
else:
    mediana = random_list[len(random_list) // 2]


print(f"Media: {media}, Mediana: {mediana}, Mínimo: {valor_minimo}, Máximo: {valor_maximo}")

```
## Exercicio 21
```
class Passaro:
    def voar(self):
        print("Voando...")

    def emitir_som(self):
        pass

class Pato(Passaro):
    def emitir_som(self):
        print("Quack Quack")

class Pardal(Passaro):
    def emitir_som(self):
        print("Piu Piu")


pato = Pato()
print("Pato")
pato.voar()
print("Pato emitindo som...")
pato.emitir_som()


pardal = Pardal()
print("Pardal")
pardal.voar()
print("Pardal emitindo som...")
pardal.emitir_som()

```
## Exercicio 22
```
class Pessoa:
    def __init__(self, id):
        self.id = id
        self.__nome = None
    
    @property
    def nome(self):
        return self.__nome
    
    @nome.setter

    def nome(self,valor):
        self.__nome = valor


pessoa = Pessoa(0)
pessoa.nome = "Fulano De Tal"
print(pessoa.nome)
```
## Exercicio 23
```
class Calculo:
    def somar(self, x, y):
        return x + y
    
    def subtrair(self, x, y):
        return x - y
    


x = 4 
y = 5


calculo = Calculo()
soma  = calculo.somar(x, y)
subtrair = calculo.subtrair(x ,y)


print((f'Somando: {x} + {y} = {soma}'))
print((f'Subtraindo: {x} - {y} = {subtrair}'))
```
## Exercicio 24
```
class Ordenadora:
    def __init__(self, listaBaguncada):
        self.listaBaguncada = listaBaguncada

    def ordenacaoCrescente(self):

        return sorted(self.listaBaguncada)

    def ordenacaoDecrescente(self):
 
        return sorted(self.listaBaguncada, reverse=True)


crescente = Ordenadora([3, 4, 2, 1, 5])
decrescente = Ordenadora([9, 7, 6, 8])


resultado_crescente = crescente.ordenacaoCrescente()
resultado_decrescente = decrescente.ordenacaoDecrescente()

print(resultado_crescente)
print(resultado_decrescente)

```
## Exercicio 25
```
class Aviao:
    cor = "Azul"  

    def __init__(self, modelo, velocidade_maxima, capacidade):
        self.modelo = modelo
        self.velocidade_maxima = velocidade_maxima
        self.capacidade = capacidade

    def __str__(self):
        return (f"O avião de modelo \"{self.modelo}\" possui uma velocidade máxima de \"{self.velocidade_maxima}\", "
                f"capacidade para \"{self.capacidade}\" passageiros e é da cor \"{self.cor}\".")


aviao1 = Aviao("BOIENG456", "1500 km/h", 400)
aviao2 = Aviao("Embraer Praetor 600", "863 km/h", 14)
aviao3 = Aviao("Antonov An-2", "258 km/h", 12)


avioes = [aviao1, aviao2, aviao3]

for aviao in avioes:
    print(aviao)

```
