select * from itens_notas_fiscais;
select * from notas_fiscais;

select * from notas_fiscais nf
inner join itens_notas_fiscais inf
on inf.NUMERO = inf.NUMERO;

select nf.CPF, nf.DATA_VENDA, inf.QUANTIDADE from notas_fiscais nf
inner join itens_notas_fiscais inf
on inf.NUMERO = inf.NUMERO;

select nf.CPF, date_format(nf.DATA_VENDA, '%Y-%m') as mes_ano, inf.QUANTIDADE from notas_fiscais nf
inner join itens_notas_fiscais inf
on inf.NUMERO = inf.NUMERO;

/*Consulta com vendas de clientes por mês*/
select nf.CPF, date_format(nf.DATA_VENDA, '%Y-%m') as mes_ano,
sum(inf.QUANTIDADE) as quantidade_vendas from notas_fiscais nf
inner join itens_notas_fiscais inf
on nf.NUMERO = inf.NUMERO
group by nf.CPF, date_format(nf.DATA_VENDA, '%Y-%m');

/* Limite de compra por cliente */
select * from tabela_de_clientes tc;

select tc.cpf, tc.nome, tc.volume_de_compra as quantidade_limite
from tabela_de_clientes tc;

select nf.CPF, tc.NOME, date_format(nf.DATA_VENDA, '%Y-%m') as mes_ano,
sum(inf.QUANTIDADE) as quantidade_vendas,
MAX(tc.VOLUME_DE_COMPRA) as quant_limite from notas_fiscais nf
inner join itens_notas_fiscais inf
on nf.NUMERO = inf.NUMERO
inner join tabela_de_clientes tc
on tc.CPF = nf.CPF
group by nf.CPF, tc.nome, date_format(nf.DATA_VENDA, '%Y-%m');


select x.cpf, x.nome, x.mes_ano, x.quantidade_vendas, x.quant_limite,
x.quant_limite - x.quantidade_vendas as diferença,
case when (x.quant_limite - x.quantidade_vendas) < 0 
then 'Inválida' else 'Válida' end as Status_venda, round((1-(x.quant_limite/x.quantidade_vendas))*100, 2) as percentual
from(
select nf.CPF, tc.NOME, date_format(nf.DATA_VENDA, '%Y-%m') as mes_ano,
sum(inf.QUANTIDADE) as quantidade_vendas,
MAX(tc.VOLUME_DE_COMPRA) as quant_limite from notas_fiscais nf
inner join itens_notas_fiscais inf
on nf.NUMERO = inf.NUMERO
inner join tabela_de_clientes tc
on tc.CPF = nf.CPF
group by nf.CPF, tc.nome, date_format(nf.DATA_VENDA, '%Y-%m')) x;