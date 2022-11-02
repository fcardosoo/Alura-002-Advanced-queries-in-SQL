use sucos_vendas;

/*
Case when
*/

select * from tabela_de_produtos;

select nome_do_produto, preco_de_lista,
case when 
preco_de_lista >= 12 then 'Produto CARO'
when preco_de_lista >= 7 AND preco_de_lista <12 then 'Produto EM CONTA'
else 'Produto BARATO' end
as status_preco 
from tabela_de_produtos;

select embalagem,
case 
	when preco_de_lista >= 12 then 'Produto CARO'
	when preco_de_lista >= 7 AND preco_de_lista <12 then 'Produto EM CONTA'
	else 'Produto BARATO' 
end
as status_preco, avg(preco_de_lista) as preco_medio
from tabela_de_produtos
group by embalagem,
case
	when preco_de_lista >= 12 then 'Produto CARO'
	when preco_de_lista >= 7 AND preco_de_lista <12 then 'Produto EM CONTA'
	else 'Produto BARATO'
end
order by embalagem;

/*
Veja o ano de nascimento dos clientes e classifique-os como:
 Nascidos antes de 1990 são velhos,
 nascidos entre 1990 e 1995 são jovens e
 nascidos depois de 1995 são crianças. 
 Liste o nome do cliente e esta classificação.
*/

select * from tabela_de_clientes;

select nome,
case
	when year(data_de_nascimento) < 1990 then 'Velho'
    when year(data_de_nascimento) >=1990 and year(data_de_nascimento)  <= 1995 then 'Jovens'
    else 'crianças'
end as 'classifiação por idade'
from tabela_de_clientes;

