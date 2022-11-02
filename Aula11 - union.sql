select distinct bairro from tabela_de_clientes;
select distinct bairro from tabela_de_vendedores;

select distinct bairro, nome, "Cliente" as Tipo from tabela_de_clientes
union
select distinct bairro, nome, "Vendedor" as Tipo from tabela_de_vendedores;


/* Simulando um FULL JOIN *que não é suportado pelo mysql* 
através de um UNION */
select tabela_de_vendedores.bairro, tabela_de_vendedores.nome, de_ferias,
tabela_de_clientes.bairro, tabela_de_clientes.NOME from tabela_de_vendedores
left join tabela_de_clientes on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
union
select tabela_de_vendedores.bairro, tabela_de_vendedores.nome, de_ferias,
tabela_de_clientes.bairro, tabela_de_clientes.NOME from tabela_de_vendedores
right join tabela_de_clientes on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;