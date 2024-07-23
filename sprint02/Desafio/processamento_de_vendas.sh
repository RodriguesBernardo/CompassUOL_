#!/bin/bash

# Cria o diretório vendas e copia o arquivo de vendas para lá
mkdir -p ecommerce/vendas
cp ecommerce/dados_de_vendas.csv ecommerce/vendas/

# Cria o diretório de backup dentro de vendas
mkdir -p ecommerce/vendas/backup

# Pega a data atual no formato YYYYMMDD
DATA=$(date +%Y%m%d)

# Copia o arquivo de vendas para o diretório de backup com a data no nome
cp ecommerce/vendas/dados_de_vendas.csv ecommerce/vendas/backup/dados-${DATA}.csv

# Renomeia o arquivo no backup
mv ecommerce/vendas/backup/dados-${DATA}.csv ecommerce/vendas/backup/backup-dados-${DATA}.csv

# Cria o relatório
# Data do sistema
DATA_SISTEMA=$(date "+%Y/%m/%d %H:%M")

# Data do primeiro e último registro de venda
DATA_PRIMEIRO=$(head -n 2 ecommerce/vendas/backup/backup-dados-${DATA}.csv | tail -n 1 | cut -d',' -f5)
DATA_ULTIMO=$(tail -n 1 ecommerce/vendas/backup/backup-dados-${DATA}.csv | cut -d',' -f5)

# Quantidade total de itens vendidos
TOTAL_ITENS=$(awk -F',' 'NR>1 {sum += $3} END {print sum}' ecommerce/vendas/backup/backup-dados-${DATA}.csv)

# Cria o arquivo relatorio.txt
echo "Data do sistema: ${DATA_SISTEMA}" > ecommerce/vendas/backup/relatorio.txt
echo "Data do primeiro registro de venda: ${DATA_PRIMEIRO}" >> ecommerce/vendas/backup/relatorio.txt
echo "Data do último registro de venda: ${DATA_ULTIMO}" >> ecommerce/vendas/backup/relatorio.txt
echo "Quantidade total de itens vendidos: ${TOTAL_ITENS}" >> ecommerce/vendas/backup/relatorio.txt
echo "" >> ecommerce/vendas/backup/relatorio.txt
echo "Primeiras 10 linhas do arquivo:" >> ecommerce/vendas/backup/relatorio.txt
head -n 10 ecommerce/vendas/backup/backup-dados-${DATA}.csv >> ecommerce/vendas/backup/relatorio.txt

# Comprime o arquivo de backup
zip ecommerce/vendas/backup/backup-dados-${DATA}.zip ecommerce/vendas/backup/backup-dados-${DATA}.csv

# Remove o arquivo de backup não compactado e o arquivo original de vendas
rm ecommerce/vendas/backup/backup-dados-${DATA}.csv
rm ecommerce/vendas/dados_de_vendas.csv

