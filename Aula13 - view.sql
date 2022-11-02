/*
View - Visão
*/
use sucos_vendas;
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos
group by embalagem;

select x.embalagem, x.maior_preco from
(select embalagem, max(preco_de_lista) as maior_preco from tabela_de_produtos
group by embalagem) x where x.maior_preco >= 10;


select x.embalagem, x.maior_preco from
vw_maiores_embalagens x where x.maior_preco >= 10;

select a.nome_do_produto, a.embalagem, a.preco_de_lista, x.maior_preco,
(a.preco_de_lista / x.maior_preco) *100 as percentual, ((a.preco_de_lista / x.maior_preco)-1)*100 as variacao
from tabela_de_produtos a inner join vw_maiores_embalagens x
on a.embalagem = x.embalagem