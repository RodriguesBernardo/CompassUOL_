import hashlib
from datetime import datetime

# Recebe a string 
stringTohash = input("Digite a string que deseja transformar em hash: ")

# Gera o hash utilizando SHA-1
gerarHash = hashlib.sha1(stringTohash.encode())

print("O Hash da string fornecida é: ", gerarHash.hexdigest())

with open("log.txt", "a") as log_file:
    log_file.write(f"{datetime.now()} - Palavra: {stringTohash}, Hash: {gerarHash.hexdigest()}\n")