select distinct bairro from tabela_de_vendedores;

select * from tabela_de_clientes where bairro 
in ("Tijuca", "Jardins", "Copacabana", "Santo Amaro");

select * from tabela_de_clientes where bairro 
in (select distinct bairro from tabela_de_vendedores);

select x.embalagem, x.preco_maximo from
(select embalagem, max(preco_de_lista) as preco_maximo from tabela_de_produtos group by EMBALAGEM) x
where x.preco_maximo >= 10;


select embalagem, max(preco_de_lista) as preco_maximo from tabela_de_produtos where preco_maximo >=10 group by embalagem;


# Qual seria a consulta usando subconsulta que seria equivalente a:
use sucos_vendas;
select cpf, count(*) from notas_fiscais
where year(data_venda) = 2016
group by cpf
having count(*) > 2000;

select x.cpf, x.contador from
(select cpf, count(*) as contador from notas_fiscais
where year(data_venda) = 2016
group by cpf) x where x.contador >2000