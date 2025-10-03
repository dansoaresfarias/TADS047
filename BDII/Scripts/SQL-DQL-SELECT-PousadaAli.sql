-- SQL - DQL
select * from funcionario;

select nome, cpf, carteiraTrab, chavePix, dataNasc, estadoCivil,
	genero, cargaHoraria, salario
	from funcionario;
    
select nome, cpf, carteiraTrab, chavePix, dataNasc, estadoCivil,
	genero, cargaHoraria, salario
	from funcionario
		order by nome;

select nome, cpf, carteiraTrab, chavePix, dataNasc, estadoCivil,
	genero, cargaHoraria, salario
	from funcionario
		order by salario;

select nome, cpf, carteiraTrab, chavePix, dataNasc, estadoCivil,
	genero, cargaHoraria, salario
	from funcionario
		order by salario desc;

select nome "Funcionário", cpf as "CPF", 
	carteiraTrab "Carteira de Trabalho", 
    chavePix "Chave PIX", 
    dataNasc "Data de Nascimento", 
    estadoCivil "Estado Civil", genero "Gênero", 
    cargaHoraria "Carga Horária", salario "Salário"
	from funcionario
		order by nome;

-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_replace
-- https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-format
-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_upper
-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_ucase
-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_concat
-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_format
select nome "Funcionário", 
	replace(replace(cpf, '.', ''), '-', '') as "CPF", 
	replace(carteiraTrab, '-', '') "Carteira de Trabalho", 
    chavePix "Chave PIX", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    upper(estadoCivil) "Estado Civil", ucase(genero) "Gênero", 
    concat(cargaHoraria, 'h') "Carga Horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		order by nome;

select nome "Funcionário", 
	replace(replace(cpf, '.', ''), '-', '') as "CPF", 
	replace(carteiraTrab, '-', '') "Carteira de Trabalho", 
    chavePix "Chave PIX", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    upper(estadoCivil) "Estado Civil", ucase(genero) "Gênero", 
    concat(cargaHoraria, 'h') "Carga Horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		where genero = "Feminino" and 
			salario between 3000 and 5000
			order by nome;

select nome "Funcionário", 
	replace(replace(cpf, '.', ''), '-', '') as "CPF", 
	replace(carteiraTrab, '-', '') "Carteira de Trabalho", 
    chavePix "Chave PIX", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    upper(estadoCivil) "Estado Civil", ucase(genero) "Gênero", 
    concat(cargaHoraria, 'h') "Carga Horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		where estadoCivil like "Casad%" and
			salario < 4000
			order by nome;
            
select nome "Funcionário", 
	replace(replace(cpf, '.', ''), '-', '') as "CPF", 
	replace(carteiraTrab, '-', '') "Carteira de Trabalho", 
    chavePix "Chave PIX", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    upper(estadoCivil) "Estado Civil", ucase(genero) "Gênero", 
    concat(cargaHoraria, 'h') "Carga Horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		where estadoCivil in ("Casado", "Casada")  and
			salario < 4000
			order by nome;

select nome "Funcionário", 
	replace(replace(cpf, '.', ''), '-', '') as "CPF", 
	replace(carteiraTrab, '-', '') "Carteira de Trabalho", 
    chavePix "Chave PIX", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    upper(estadoCivil) "Estado Civil", ucase(genero) "Gênero", 
    concat(cargaHoraria, 'h') "Carga Horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		where estadoCivil in ("Divorciada", "Casada")  and
			salario > 4000
			order by nome;

select nome "Funcionário", 
	replace(replace(cpf, '.', ''), '-', '') as "CPF", 
	replace(carteiraTrab, '-', '') "Carteira de Trabalho", 
    chavePix "Chave PIX", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    upper(estadoCivil) "Estado Civil", ucase(genero) "Gênero", 
    concat(cargaHoraria, 'h') "Carga Horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		where email like "%@gmail.com"
			order by nome;
            
select nome "Dependente",
	timestampdiff(year, dataNasc, now()) "Idade",
    replace(replace(cpf, '.', ''), '-', '') as "CPF",
    upper(parentesco) "Parentesco"
	from dependente
		order by idade, nome;
    
select d.nome "Dependente",
	timestampdiff(year, d.dataNasc, now()) "Idade",
    replace(replace(d.cpf, '.', ''), '-', '') as "CPF",
    upper(d.parentesco) "Parentesco",
    f.nome "Reponsável"
	from dependente d, funcionario f
		order by d.nome;

select d.nome "Dependente",
	timestampdiff(year, d.dataNasc, now()) "Idade",
    replace(replace(d.cpf, '.', ''), '-', '') as "CPF",
    upper(d.parentesco) "Parentesco",
    f.nome "Reponsável"
	from dependente d, funcionario f
		where d.funcionario_cpf = f.cpf
			order by d.nome;

select d.nome "Dependente",
	timestampdiff(year, d.dataNasc, now()) "Idade",
    replace(replace(d.cpf, '.', ''), '-', '') as "CPF",
    upper(d.parentesco) "Parentesco",
    f.nome "Reponsável"
	from dependente d
		inner join funcionario f on d.funcionario_cpf = f.cpf
			order by d.nome;

select nome "Funcionário", 
	replace(replace(cpf, '.', ''), '-', '') as "CPF", 
	replace(carteiraTrab, '-', '') "Carteira de Trabalho", 
    chavePix "Chave PIX", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    upper(estadoCivil) "Estado Civil", ucase(genero) "Gênero",
    cidade "Cidade",
    concat(cargaHoraria, 'h') "Carga Horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		inner join endereco on funcionario_cpf = cpf
		order by nome;
        
select nome "Funcionário", 
	replace(replace(cpf, '.', ''), '-', '') as "CPF", 
	replace(carteiraTrab, '-', '') "Carteira de Trabalho", 
    chavePix "Chave PIX", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    upper(estadoCivil) "Estado Civil", ucase(genero) "Gênero",
    bairro "Bairro", cidade "Cidade",
    concat(cargaHoraria, 'h') "Carga Horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		inner join endereco on funcionario_cpf = cpf
			where cidade = "Recife" and bairro like "Boa%"
				order by nome;

-- funcionario, cpf, email, telefone, cidade, ch, salario ???
select func.nome "Funcionário", func.cpf "CPF",
	timestampdiff(year, func.dataNasc, now()) "Idade",
    func.email "E-mail", 
    group_concat(
		concat('(', substring(tel.numero, 1, 2), ')', substring(tel.numero, 3, 5), 
			'-', substring(tel.numero, 8)) 
			separator ', ') "Telefone",
	endc.cidade "Cidade", concat(func.cargaHoraria, 'h') "Carga Horária",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário"
	from funcionario func
    inner join telefone tel on tel.funcionario_cpf = func.cpf
    inner join endereco endc on endc.funcionario_cpf = func.cpf
		group by func.cpf
			order by func.nome;

select date_format(oi.dataHora, '%d/%m/%Y - %h:%i') "Data Ocorrência", 
	oi.gravidade "Gravidade", 
	oi.descricao "Descrição", func.nome "Funcionário"
	from ocorrenciaInterna oi
		inner join funcionario func on func.cpf = oi.funcionario_cpf
			order by oi.dataHora desc;

select fer.anoRef "Ano Referência",
	date_format(fer.dataInicio, '%d/%m/%Y') "Data de Início",
    date_format(
		date_add(fer.dataInicio, interval fer.qtdDias day), '%d/%m/%Y'
        ) "Data Fim", 
    fer.qtdDias "Quantidade de Dias",
    concat("R$ ", format(fer.valor, 2, 'de_DE')) "Valor",
    upper(fer.`status`) "Situação",
    func.nome "Funcionário"
	from ferias fer
    inner join funcionario func on func.cpf = fer.funcionario_cpf
		order by fer.anoRef desc;

select func.nome "Funcionário", 
	replace(replace(func.cpf, '.', ''), '-', '') as "CPF", 
    timestampdiff(year, func.dataNasc, now()) "Idade", 
    crg.nome "Cargo",
    concat(func.cargaHoraria, 'h') "Carga Horária", 
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário",
    dpt.nome "Departamento", grt.nome "Gerente"
	from funcionario func
    inner join trabalhar trb on trb.funcionario_cpf = func.cpf
    inner join cargo crg on crg.cbo = trb.cargo_cbo
    inner join departamento dpt on dpt.idDepartamento = trb.Departamento_idDepartamento
    left join funcionario grt on grt.cpf = dpt.gerente_cpf
		where trb.dataFim is null
			order by func.nome;












