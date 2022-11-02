use sucos_vendas;

select * from tabela_de_produtos;
select * from tabela_de_clientes;

select * from tabela_de_produtos where sabor like '%Maça%'
and embalagem = 'PET';

select * from tabela_de_clientes where nome like '%Mattos%';