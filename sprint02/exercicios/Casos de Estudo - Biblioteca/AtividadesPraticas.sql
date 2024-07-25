--- E01
select * from livro where publicacao > '2014-12-31' order by cod asc

--- E02
select titulo, valor from livro order by valor desc limit 10

--- E03
select subQuery.quantidade,e.nome, ed.estado,ed.cidade from 
( select editora, count(*) as quantidade
	from livro group by editora) as subQuery
join editora e on subQuery.editora = e.codEditora
join endereco ed on e.endereco = ed.codEndereco
order by subQuery.quantidade desc;

--- E04
select aut.codautor, aut.nome, aut.nascimento, count(liv.titulo) as quantidade
from autor as aut left join livro as liv on 
    aut.codautor = liv.autor
group by aut.codautor
order by aut.nome

--- E05
select distinct a.nome from autor a
join livro l on l.autor = a.codAutor
join editora e on l.editora = e.codEditora
join endereco ed on e.endereco = ed.codEndereco
where ed.estado not in ('RIO GRANDE DO SUL', 'PARANÁ', 'SANTA CATARINA')
order by a.nome asc;

--- E06
select  a.codautor, a.nome, count(l.cod) as quantidade_publicacoes
from autor a left join livro l on 
	a.codautor = l.autor
group by a.codAutor, a.nome 
order by quantidade_publicacoes desc
limit 1;

--- E07
select a.nome from autor a left join livro l 
on a.codautor = l.autor
where l.cod is null
order by a.nome asc;
