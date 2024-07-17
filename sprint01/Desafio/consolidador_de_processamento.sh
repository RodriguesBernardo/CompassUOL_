#!/bin/bash

if [ ! -d "vendas/backup" ]; then
    mkdir -p vendas/backup
fi

cat vendas/backup/Relatorio-*.txt > vendas/backup/relatorio_final.txt

