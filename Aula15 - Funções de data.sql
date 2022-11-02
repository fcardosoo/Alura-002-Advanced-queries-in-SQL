use sucos_vendas;

select datediff("2022-09-21", "1979-03-20"); # Trás a diferença entre duas datas
select current_date(); # retorna a data atual d sistema;
select current_time(); # retorna a hora/minuto/segundo atual do sistema;
select current_timestamp(); # retorna data + hora;
select day(current_timestamp()); # retorna o dia do mês;
select month(current_timestamp()); # retorna o mês em números;
select monthname(current_timestamp()); # retorna o nome do mês;
select datediff(current_timestamp(), '2019-01-01') as Resultado;
select date_sub(current_timestamp(), interval 5 day) as resultado; # Diminui 5 da data atual
select distinct data_venda,
dayname(data_venda) as dia, monthname(data_venda) as mês, year(data_venda) as ano from notas_fiscais;

# Crie uma consulta que mostre o nome e a idade atual dos clientes.

select * from tabela_de_clientes;
select nome, (year(current_date()) - year(data_de_nascimento)) as idade from tabela_de_clientes;
select nome, timestampdiff(year, data_de_nascimento, curdate()) as Idade from tabela_de_clientes;