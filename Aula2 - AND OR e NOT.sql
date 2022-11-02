use sucos_vendas;

select * from tabela_de_produtos where sabor = 'Manga'
or tamanho = '470 ml';

select * from tabela_de_produtos where sabor = 'Manga'
AND tamanho = '470 ml';

select * from tabela_de_produtos where not (sabor = 'Manga'
AND tamanho = '470 ml');

select * from tabela_de_produtos where sabor = 'Manga'
and not (tamanho = '470 ml');

select * from tabela_de_produtos where sabor in ('Laranja', 'Manga');
select * from tabela_de_produtos where sabor = 'Laranja' or sabor = 'Manga';

select * from tabela_de_clientes where cidade in ('Rio de Janeiro', 'São Paulo') and idade >= 20;

select * from tabela_de_clientes where cidade in ('Rio de Janeiro', 'São Paulo') and (idade >=20) AND (idade <=22);


