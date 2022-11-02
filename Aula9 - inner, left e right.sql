/*Conta o número de registros da tabela
Se não informar campos, não é necessário usar o group by */
select count(*) from tabela_de_clientes;
/* esta consulta retornou 15;

select cpf, count(*) from notas_fiscais group by cpf;
/*Esta consulta retornou 14 linhas, ou seja, temos 1 cliente na base que 
não comprou suco de frutas*/

/*O inner join retorna todos os que tem correspondência nas duas tabelas*/
select distinct A.cpf, A.nome, b.cpf from tabela_de_clientes A
inner join notas_fiscais B on A.cpf = B.cpf;

/*No lect é possível identificar o cliente que não tem correspondente na tabela de NF*/
select distinct A.cpf, A.nome, b.cpf from tabela_de_clientes A
left join notas_fiscais B on A.cpf = B.cpf;

/*Retornando apenas os campos nulos*/
select distinct A.cpf, A.nome, b.cpf from tabela_de_clientes A
left join notas_fiscais B on A.cpf = B.cpf
where b.cpf is null;