use sucos_vendas;

select * from itens_notas_fiscais;

select * from tabela_de_clientes;

select cpf as Identificador, nome as Cliente from tabela_de_clientes;

select * from tabela_de_produtos where CODIGO_DO_PRODUTO = '1000889';

select * from tabela_de_produtos where sabor = 'Laranja';

select * from tabela_de_produtos where (PRECO_DE_LISTA >19.50 and PRECO_DE_LISTA <19.53);
select * from tabela_de_produtos where PRECO_DE_LISTA between 19.50 and 19.52;

