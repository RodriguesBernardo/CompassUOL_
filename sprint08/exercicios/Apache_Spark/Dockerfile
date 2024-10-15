FROM bitnami/spark:latest

WORKDIR /app

COPY main.py .
COPY nomes_aleatorios.txt /app/

CMD ["spark-submit", "/app/main.py"]

