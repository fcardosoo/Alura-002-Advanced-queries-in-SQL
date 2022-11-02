/* O having é útil para fazer seleções APÓS o uso do GROUP BY*/

use sucos_vendas;

select estado, sum(limite_de_credito) as soma_limite from tabela_de_clientes
group by estado;

/* Aplicando o HAVING*/

select estado, sum(limite_de_credito) as soma_limite from tabela_de_clientes
group by estado having sum(LIMITE_DE_CREDITO) > 900000;

select embalagem, MAX(preco_de_lista) as maior_preco, MIN(preco_de_lista) as menor_preco 
from tabela_de_produtos group by EMBALAGEM;

select embalagem, MAX(preco_de_lista) as maior_preco, MIN(preco_de_lista) as menor_preco 
from tabela_de_produtos group by EMBALAGEM having sum(PRECO_DE_LISTA) <= 80 ;

select embalagem, MAX(preco_de_lista) as maior_preco, MIN(preco_de_lista) as menor_preco 
from tabela_de_produtos group by EMBALAGEM having sum(PRECO_DE_LISTA) <= 80 AND
max(PRECO_DE_LISTA) >= 5;

/*
Quais foram os clientes que fizeram mais de 2000 compras em 2016?
*/

select cpf, count(*) from notas_fiscais
where year(data_venda) = 2016
group by cpf
having count(*) > 2000;