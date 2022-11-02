use sucos_vendas;

/*Retornando todas as linhas da consulta*/
select embalagem, tamanho, sabor from tabela_de_produtos;

/*Retornando apenas as linhas dstintas*/
select distinct embalagem, tamanho from tabela_de_produtos;

select distinct embalagem, tamanho from tabela_de_produtos
where sabor='Maça';

select * from tabela_de_clientes;
select distinct bairro from tabela_de_clientes where cidade = 'Rio de Janeiro';

select * from tabela_de_clientes limit 4;

/*Selecionando a partir da posição 2, os três próximos registros*/
select * from tabela_de_produtos limit 2,3;

select * from notas_fiscais;
select * from notas_fiscais where data_venda = '2017-01-01' limit 10;

/* ORDER BY*/

select * from tabela_de_clientes order by nome;
select * from tabela_de_clientes order by nome desc;

select * from tabela_de_produtos order by PRECO_DE_LISTA;
select * from tabela_de_produtos order by PRECO_DE_LISTA DESC;

select * from tabela_de_produtos order by NOME_DO_PRODUTO;
select * from tabela_de_produtos order by EMBALAGEM, NOME_DO_PRODUTO;

select * from tabela_de_produtos order by EMBALAGEM DESC, NOME_DO_PRODUTO ASC;

SELECT * FROM notas_fiscais;

/* 
Qual (ou quais) foi (foram) a(s) maior(es) venda(s) do produto
 “Linha Refrescante - 1 Litro - Morango/Limão”, em quantidade? 
*/

/*1ª PARTE DA RESPOSTA*/
SELECT * FROM tabela_de_produtos;
SELECT CODIGO_DO_PRODUTO FROM tabela_de_produtos 
WHERE NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limão';

/*Com o código do produto = 1101035*/
select * from itens_notas_fiscais;
select * from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035' order by QUANTIDADE desc;