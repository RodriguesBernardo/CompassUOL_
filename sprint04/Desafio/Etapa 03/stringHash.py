import hashlib

# Recebe a string 
stringTohash = input("Digite a string que deseja transformar em hash: ")

# Gera o hash utilizando SHA-1
gerarHash = hashlib.sha1(stringTohash.encode())

print("O Hash da string fornecida é: ", gerarHash.hexdigest())