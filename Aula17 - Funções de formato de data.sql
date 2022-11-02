select current_timestamp() as resultado;

select concat('O dia de hoje é: ', current_timestamp()) as resultado;

select concat('O dia de hoje é: ',
date_format(current_timestamp(), '%W, %d/%m/%Y - %U semana do ano')) AS resultado;

select substring(convert (23.3, char), 1, 1) as resultado; #convertendo número em strig e aplicando funções de texto

# Queremos construir um SQL cujo resultado seja, para cada cliente:
# “O cliente João da Silva faturou 120000 no ano de 2016”.
# Somente para o ano de 2016.

select * from itens_notas_fiscais;
select * from notas_fiscais;
select * from tabela_de_clientes;

select concat('O cliente ', tc.nome, ' faturou ', 
round(cast(sum(inf.quantidade*inf.preco) as char (20)), 2),
' no ano ', cast(year(nf.data_venda) as char(20))) as sentenca
from notas_fiscais nf
inner join itens_notas_fiscais inf on nf.NUMERO = inf.NUMERO
inner join tabela_de_clientes tc on nf.CPF = tc.CPF
where year(DATA_VENDA) = 2016
group by tc.NOME, year(data_venda);