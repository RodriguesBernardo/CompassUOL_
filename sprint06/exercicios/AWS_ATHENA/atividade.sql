CREATE EXTERNAL TABLE IF NOT EXISTS meubanco.names (
  nome STRING,
  sexo STRING,
  total INT,
  ano INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'serialization.format' = ',',
 'field.delim' = ','
)
LOCATION 's3://sprint-06/'
TBLPROPERTIES ('skip.header.line.count'='1');

-- consulta que lista os 3 nomes mais usados em cada década desde o 1950 até hoje.
SELECT nome, decada, total
FROM (
    SELECT 
        nome, 
        FLOOR(ano / 10) * 10 AS decada, 
        SUM(total) AS total,
        ROW_NUMBER() OVER (PARTITION BY FLOOR(ano / 10) * 10 ORDER BY SUM(total) DESC) AS quantidade_aparicoes
    FROM meubanco.names
    WHERE ano >= 1950
    GROUP BY nome, FLOOR(ano / 10) * 10
) AS ranked
WHERE quantidade_aparicoes <= 3
ORDER BY decada, total DESC;
