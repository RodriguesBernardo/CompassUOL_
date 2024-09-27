# Use uma imagem Python 
FROM python:3.9-slim

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo requirements.txt para o container
COPY requirements.txt .

# Instale as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie todos os arquivos da aplicação para o container
COPY . .

# Comando para iniciar o script Python
CMD ["python", "main.py"]
