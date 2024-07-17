#!/bin/bash


mkdir -p vendas
cp dados_de_vendas.csv vendas/

mkdir -p vendas/backup

DATA=$(date +%Y%m%d)

cp vendas/dados_de_vendas.csv vendas/backup/dados-${DATA}.csv

mv vendas/backup/dados-${DATA}.csv vendas/backup/backup-dados-${DATA}.csv

RELATORIO=vendas/backup/Relatorio-${DATA}.txt

DATA_SISTEMA=$(date "+%Y/%m/%d %H:%M")

DATA_PRIMEIRO=$(head -n 2 vendas/backup/backup-dados-${DATA}.csv | tail -n 1 | cut -d',' -f5)
DATA_ULTIMO=$(tail -n 1 vendas/backup/backup-dados-${DATA}.csv | cut -d',' -f5)

TOTAL_ITENS=$(awk -F',' 'NR>1 {sum += $3} END {print sum}' vendas/backup/backup-dados-${DATA}.csv)

echo "Data do sistema: ${DATA_SISTEMA}" > $RELATORIO
echo "Data do primeiro registro de venda: ${DATA_PRIMEIRO}" >> $RELATORIO
echo "Data do último registro de venda: ${DATA_ULTIMO}" >> $RELATORIO
echo "Quantidade total de itens vendidos: ${TOTAL_ITENS}" >> $RELATORIO
echo "" >> $RELATORIO
echo "Primeiras 10 linhas do arquivo:" >> $RELATORIO
head -n 10 vendas/backup/backup-dados-${DATA}.csv >> $RELATORIO

zip vendas/backup/backup-dados-${DATA}.zip vendas/backup/backup-dados-${DATA}.csv

rm vendas/backup/backup-dados-${DATA}.csv
rm vendas/dados_de_vendas.csv

