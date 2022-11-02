/* GROUP BY
É possível realizar as seguintes operações:
SUM: Soma
MAX: Máximo
MIN: Mínimo
AVG: Média
COUNT: Conta ocorrências
*/

select * from tabela_de_clientes;
select estado, limite_de_credito from tabela_de_clientes;

select estado, SUM(limite_de_credito) as limite_total from tabela_de_clientes group by estado;

select embalagem, preco_de_lista from tabela_de_produtos;
select embalagem, MAX(preco_de_lista) as Maior_preco from tabela_de_produtos group by embalagem;
select embalagem, count(*) as contador from tabela_de_produtos group by embalagem;

select bairro, sum(limite_de_credito) as limite from tabela_de_clientes group by BAIRRO;

select estado, bairro, sum(limite_de_credito) as limite from tabela_de_clientes
where cidade = 'Rio de Janeiro' group by BAIRRO;

select estado, bairro, sum(limite_de_credito) as limite from tabela_de_clientes
where cidade = 'Rio de Janeiro' group by BAIRRO order by bairro desc;

select estado, bairro, sum(limite_de_credito) as limite from tabela_de_clientes
where cidade = 'Rio de Janeiro' group by BAIRRO order by limite desc;

/*
quantos itens de venda existem com a maior quantidade do produto '1101035'?
*/
select * from itens_notas_fiscais;
select max(quantidade) as 'maior_quant' from itens_notas_fiscais
where CODIGO_DO_PRODUTO = '1101035'; /*retornou 99*/
select count(*) from itens_notas_fiscais
where CODIGO_DO_PRODUTO = '1101035' and QUANTIDADE=99;