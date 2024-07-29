create view Quantidade_de_vezes_Locacao as
select carro.idcarro, carro.marcacarro, carro.modelocarro, carro.anocarro, count(locacao.idlocacao) as quantidade_de_locacoes
from carro left join locacao on 
	carro.idcarro = locacao.idcarro
group by carro.idcarro, carro.marcacarro, carro.modelocarro, carro.anocarro
order by quantidade_de_locacoes desc;

create view Vendedores_com_mais_vendas as
select vendedor.idVendedor, vendedor.nomeVendedor, vendedor.estadoVendedor, count(locacao.idLocacao) as Quantidade_de_vendas from vendedor
left join locacao on 
	vendedor.idVendedor = locacao.idVendedor
group by vendedor.idVendedor, vendedor.nomeVendedor, vendedor.estadoVendedor
order by Quantidade_de_vendas desc;

create view Detalhes_Locacao as
select l.idLocacao, c.nomeCliente, car.marcaCarro, car.modeloCarro, co.tipoCombustivel, l.datalocacao, l.horalocacao, l.qtddiaria, l.vlrdiaria, l.dataEntrega, l.horaEntrega, v.nomeVendedor
from locacao l join cliente c on 
	l.idCliente = c.idCliente
join carro car on 
	l.idCarro = car.idCarro
join combustivel co on 
	l.idCombustivel = co.idCombustivel
join vendedor v on l.idVendedor = v.idVendedor;

create view FaturamentoVendedor as
select v.idvendedor, v.nomevendedor, sum(l.qtddiaria * l.vlrdiaria) as faturamentototal
from vendedor v join locacao l on 
	v.idvendedor = l.idvendedor
group by v.idvendedor, v.nomevendedor
order by faturamentototal desc;

create view LocacoesCliente as
select c.idcliente, c.nomecliente, count(l.idlocacao) as quantidadelocacoes, sum(l.qtddiaria * l.vlrdiaria) as totalgasto
from cliente c left join locacao l on 
	c.idcliente = l.idcliente
group by c.idcliente, c.nomecliente
order by totalgasto desc;


select * from Quantidade_de_vezes_locacao;

select * from Vendedores_com_mais_vendas;

select * from Detalhes_locacao;

select * from faturamentoVendedor;

select * from LocacoesCliente;

