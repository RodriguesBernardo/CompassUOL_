## Exercicio Lab AWS S3
- Após a conclusão do passo a passo temos como resultado a evidencia do website hospedado no S3
<img src="../evidencias/img/Atividade-AWS_S3.png">

## Exercicio Lab AWS Athena
- Após a conclusão do passo a passo é solictado a criação de uma consulta que liste os 3 nomes mais usados em cada década desde o 1950 até hoje.
<img src="../evidencias/img/Resultado_query_AWS-ATHENA.png">
<img src="../evidencias/img/Resultado_query_AWS-ATHENA-Parte02.png">

## Exercicio Lab AWS Lambda
- É solicitado no passo a passo da atividade a criação do runtime da function como *Python 3.7*, porém nos dias atuais o Amazon Linux não oferece mais suporte para tal, portanto, usei o *Python 3.11* como runtime da function. 
Vale lembrar também que para usar a nova versão foi necessario trocar a versão base do Amazon Linux de *amazonlinux:2.0.20200602.0* para *FROM amazonlinux:2023*
- Segue alterações feitas no código base oferecido no passo a passo para: 
```
FROM amazonlinux:2023

RUN yum update -y && \
    yum install -y python3.11 python3.11-pip zip && \
    yum clean all

RUN python3.11 -m pip install --upgrade pip
RUN python3.11 -m pip install numpy pandas
```
- Também foi necessario editar as configurações básicas da função, alterando o tamanho da memória para 256MB o tempo limite para 20seg
- Após as alterações temos como resultado: 
<img src="../evidencias/img/AWS_LAMBDA.png">
