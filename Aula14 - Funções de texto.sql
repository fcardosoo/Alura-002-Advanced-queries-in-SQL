use sucos_vendas;

select ltrim('      Olá') as Resultado;
select rtrim('      Olá') as Resultado;
select trim('    Olá   ') as Resultado;
select concat('Olá', ' ', 'Tudo bem', '?') as Resultado;
select upper('olá, tudo bem?') as Resultado;
select lower('OlÁ, TUDo bEM?') as Resultado;
select substring('Olá, tudo bem?', 6) as resultado; # retorna a partir da sexta posição até o final
select substring('Olá, tudo bem?', 6, 4) as Resultado; # Retorna a partir da sexta posição 4 posições
select concat(Nome, ' (', CPF, ') ')  as Resultado from tabela_de_clientes;

select* from tabela_de_clientes;
select concat (Nome, ' - ', 'Rua: ', Endereco_1, 'Bairro: ', bairro, ' - ', cidade, ' - ', estado) as Resultado from tabela_de_clientes;