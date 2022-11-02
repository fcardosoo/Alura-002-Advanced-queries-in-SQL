select * from tabela_de_vendedores;
select * from tabela_de_clientes;

/*Campos que só existem em UMA das tabelas não é necessário indicar a tabela origem*/
select tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME,
DE_FERIAS
from tabela_de_vendedores inner join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO