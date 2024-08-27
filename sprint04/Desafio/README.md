# **Desafio**
1. Objetivo: 
* Pratica de Python com Containers DOcker combinando conhecimentos adquiridos
2. Atividade:
* Construa uma imagem a partir de um arquivo de instruções Dockerfile que execute o código carguru.py, após execute um container a partir da imagem criada
* É possivel reutilizar containers? Em caso positivo, apresente o comando necessaio para reiniciar um dos containers parados em seu ambiente Docker. Não sendo possível reutulizar, justifique

## **Etapa 01**

### **Passo 1**
- Criação do arquivo Dockerfile 
```
FROM python:3.9-slim 

WORKDIR /app

COPY carguru.py .

CMD ["python", "carguru.py"]
```
### **Passo 2**
- Construir a imagem com o seguinte comando 
```
docker build -t carguru-image .
```
### **Passo 3**
- Executar o comando para obtermos o resultado
```
docker run --name carguru-container carguru-image
```
<img src="/sprint04/evidencias/img/ExecucaoCarguru.png">

## **Etapa 02**
### É possivel reutilizar containers? Em caso positivo, apresente o comando necessário para reiniciar um dos containers parados em seu ambiente Docker? Não sendo possível reutilizar, justifique sua resposta 

- Sim! É possível reutilizar containers que foram parados. Para isso utilizamos o comando abaixo: 
```
docker start "nome-container"
```
No nosso caso: 
```
docker start carguru-container
```
- **Resumindo**: Containers podems ser reutilizados sem problema enquanto ainda existirem. O comando *start* permite reiniciar o container no estado em que foi parado

## **Etapa 03**
### **Passo 1**
- Criei um arquivo chamado *stringHash.py* com o seguinte conteúdo: 
```
import hashlib

stringTohash = input("Digite a string que deseja transformar em hash: ")

gerarHash = hashlib.sha1(stringTohash.encode())

print("O Hash da string fornecida é: ", gerarHash.hexdigest())
```
1. Esse código recebe uma string via input
2. Gera o hash SHA-1 da string fornecida
3. Mostra o hash em formato hexadecimal

### **Passo 2**
- Criei um arquivo Dockerfile com o seguinte conteúdo: 
```
FROM python:3.9-slim

WORKDIR /app

COPY stringHash.py .

CMD [ "python", "stringHash.py" ]
```

### **Passo 3**
- Executamos no terminal para a criação do container: 
```
docker build -t mascarar-dados
```
- Em seguida iniciamos o container e fornecemos um imput para gerar o hash
```
docker run -it --name mascarar-container mascarar-dados
```
- Como podemos ver: 
<img src="/sprint04/evidencias/img/MascararDados.png">
