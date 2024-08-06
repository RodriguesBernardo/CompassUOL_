-- E08
select v.cdvdd, v.nmvdd from 
tbvendas ve left join tbvendedor v on 
	v.cdvdd = ve.cdvdd
group by  v.cdvdd, v.nmvdd
order by count(ve.cdven) desc
limit 1;

-- E09

select cdpro, nmpro from tbvendas 
where dtven between '2014-02-03' and '2018-02-02'
group by cdpro, nmpro
order by count(cdpro) desc
limit 1;

-- E10
select vd.nmvdd as vendedor, round(sum(t.qtd * t.vrunt), 2) as valor_total_vendas, round(sum(t.qtd * t.vrunt) * (vd.perccomissao / 100), 2) as comissao from tbvendas t
join tbvendedor vd on t.cdvdd = vd.cdvdd
where t.status = 'concluído'
group by vd.nmvdd, vd.perccomissao
order by comissao desc
limit 0, 1000;

-- E11
select cdcli,nmcli, sum(qtd * vrunt) as gasto from tbvendas
where status = 'Concluído'
group by cdcli ,nmcli 
order by gasto desc
limit 1;


-- E12
s
select cddep, nmdep, dtnasc, sum(tbvendas.qtd * tbvendas.vrunt) as valor_total_vendas from tbdependente
join tbvendedor on 
	tbdependente.cdvdd = tbvendedor.cdvdd
join tbvendas on
	tbvendedor.cdvdd = tbvendas.cdvdd
where tbvendas.status = 'Concluído'
group by cddep, nmdep, dtnasc
having sum(tbvendas.qtd * tbvendas.vrunt) = (
    select min(valor_total)from (
        select tbvendedor.cdvdd, sum(tbvendas.qtd * tbvendas.vrunt) as valor_total from tbvendedor
        join tbvendas on 
			tbvendedor.cdvdd = tbvendas.cdvdd
        where tbvendas.status = 'Concluído'
        group by tbvendedor.cdvdd
        having sum(tbvendas.qtd * tbvendas.vrunt) > 0
    ) as subquery
);

-- E13
select cdpro, nmcanalvendas, nmpro, sum(qtd) as quantidade_vendas from tbvendas
where status = 'Concluído'
group by cdpro, nmcanalvendas, nmpro
order by quantidade_vendas asc

-- E14
select estado, round(avg(qtd * vrunt),2) as gastomedio
from tbvendas
where status = 'Concluído'
group by estado
order by gastomedio desc


-- E15
select cdven from tbvendas
where deletado = true
order by cdven asc

-- E16
select estado, nmpro, round(avg(qtd), 4) as quantidade_media from tbvendas
where status = 'Concluído'
group by estado, nmpro
order by estado asc, nmpro asc;

