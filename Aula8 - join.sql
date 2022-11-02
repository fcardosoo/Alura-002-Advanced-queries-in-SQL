select * from tabela_de_vendedores;
select * from notas_fiscais;

select * from tabela_de_vendedores A
inner join notas_fiscais B
on A.MATRICULA = B.MATRICULA;

select A.matricula, A.nome, count(*) from
tabela_de_vendedores A
inner join notas_fiscais B
on A.MATRICULA = B.MATRICULA
group by A.MATRICULA, A.NOME;

select A.matricula, A.nome, count(*) from
tabela_de_vendedores A, notas_fiscais B
where A.MATRICULA = B.MATRICULA
group by A.MATRICULA, A.NOME;

/*
Obtenha o faturamento anual da empresa. Leve em consideração 
que o valor financeiro das vendas consiste em multiplicar a
quantidade pelo preço.
*/
use sucos_vendas;
select * from notas_fiscais;
select * from itens_notas_fiscais;
select year(data_venda), sum(quantidade * preco) as faturamento
from notas_fiscais NF inner join itens_notas_fiscais inf
on nf.numero = inf.numero
group by year(data_venda)