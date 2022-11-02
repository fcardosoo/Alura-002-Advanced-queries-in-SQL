# Expressões matemáticas
use sucos_vendas;

select (23 + ((25-2)/2)*45) as resultado;

#Funções de arredondamento
select ceiling(12.3333333233333) as resultado;
select round(12.3333333233333) as resultado;

select floor(12.77777777774323333) as resultado;
select rand() as resultado;

select numero, quantidade, preco, round(quantidade * preco, 2) as faturamento from itens_notas_fiscais;

# Na tabela de notas fiscais temos o valor do imposto. Já na tabela de itens 
# temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano 
# de 2016 arredondando para o menor inteiro.

select * from notas_fiscais;
select * from itens_notas_fiscais;

select a.data_venda, a.cpf, a.numero, a.imposto, b.quantidade, b.preco, floor(b.quantidade * b.preco) as faturamento
from  notas_fiscais a, itens_notas_fiscais b
where a.numero = b.numero and year(data_venda) = 2016;

select year(data_venda), floor(sum(imposto*(quantidade * preco)))
from notas_fiscais nf
inner join itens_notas_fiscais inf on nf.numero = inf.numero
where year(data_venda) = 2016
group by year(data_venda);