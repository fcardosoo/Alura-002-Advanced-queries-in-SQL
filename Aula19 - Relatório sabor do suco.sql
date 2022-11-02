use sucos_vendas;
select * from itens_notas_fiscais; # quantidade
select * from tabela_de_produtos; # sabor
select * from notas_fiscais; # data_venda

select tp.SABOR, nf.DATA_VENDA, inf.QUANTIDADE from 
tabela_de_produtos tp
inner join itens_notas_fiscais inf on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on nf.NUMERO = inf.NUMERO;

/*Quantidade de vandas por sabor ano 2016*/
select tp.SABOR, year(nf.DATA_VENDA) as ano, sum(inf.QUANTIDADE) as Quant_total from 
tabela_de_produtos tp
inner join itens_notas_fiscais inf on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on nf.NUMERO = inf.NUMERO
where year(data_venda) = 2016
group by tp.SABOR, year(nf.data_venda)
order by sum(inf.QUANTIDADE) desc;

/* Total de vendas de 2016 SEM a classificação por sabor*/
select year(nf.DATA_VENDA) as ano, sum(inf.QUANTIDADE) as Quant_total from 
tabela_de_produtos tp
inner join itens_notas_fiscais inf on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on nf.NUMERO = inf.NUMERO
where year(data_venda) = 2016
group by year(nf.data_venda);
# order by sum(inf.QUANTIDADE) desc;

/* JUNTANDO as duas consultas acima*/
select * from
(select tp.SABOR, year(nf.DATA_VENDA) as ano, sum(inf.QUANTIDADE) as Quant_total from 
tabela_de_produtos tp
inner join itens_notas_fiscais inf on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on nf.NUMERO = inf.NUMERO
where year(data_venda) = 2016
group by tp.SABOR, year(nf.data_venda)) as venda_sabor
inner join
(select year(nf.DATA_VENDA) as ano, sum(inf.QUANTIDADE) as Quant_total from 
tabela_de_produtos tp
inner join itens_notas_fiscais inf on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on nf.NUMERO = inf.NUMERO
where year(data_venda) = 2016
group by year(nf.data_venda)) as venda_total
on venda_sabor.ano = venda_total.ano;

/* Crando a coluna de percentual */

select venda_sabor.SABOR, venda_sabor.ano, venda_sabor.quant_total, 
round((venda_sabor.quant_total/venda_total.quant_total) *100, 2) as percentual from
(select tp.SABOR, year(nf.DATA_VENDA) as ano, sum(inf.QUANTIDADE) as Quant_total from 
tabela_de_produtos tp
inner join itens_notas_fiscais inf on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on nf.NUMERO = inf.NUMERO
where year(data_venda) = 2016
group by tp.SABOR, year(nf.data_venda)) as venda_sabor
inner join
(select year(nf.DATA_VENDA) as ano, sum(inf.QUANTIDADE) as Quant_total from 
tabela_de_produtos tp
inner join itens_notas_fiscais inf on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on nf.NUMERO = inf.NUMERO
where year(data_venda) = 2016
group by year(nf.data_venda)) as venda_total
on venda_sabor.ano = venda_total.ano
order by venda_sabor.quant_total desc;

# Modifique o relatório mas agora para ver o ranking das vendas por tamanho.

select venda_sabor.TAMANHO, venda_sabor.ano, venda_sabor.quant_total, 
round((venda_sabor.quant_total/venda_total.quant_total) *100, 2) as percentual from
(select tp.TAMANHO, year(nf.DATA_VENDA) as ano, sum(inf.QUANTIDADE) as Quant_total from 
tabela_de_produtos tp
inner join itens_notas_fiscais inf on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on nf.NUMERO = inf.NUMERO
where year(data_venda) = 2016
group by tp.TAMANHO, year(nf.data_venda)) as venda_sabor
inner join
(select year(nf.DATA_VENDA) as ano, sum(inf.QUANTIDADE) as Quant_total from 
tabela_de_produtos tp
inner join itens_notas_fiscais inf on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on nf.NUMERO = inf.NUMERO
where year(data_venda) = 2016
group by year(nf.data_venda)) as venda_total
on venda_sabor.ano = venda_total.ano
order by venda_sabor.quant_total desc;