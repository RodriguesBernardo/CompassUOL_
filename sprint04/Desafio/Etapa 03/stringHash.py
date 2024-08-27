import hashlib

stringTohash = input("Digite a string que deseja transformar em hash: ")

gerarHash = hashlib.sha1(stringTohash.encode())

print("O Hash da string fornecida é: ", gerarHash.hexdigest())