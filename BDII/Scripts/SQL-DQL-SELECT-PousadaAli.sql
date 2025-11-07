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

-- Funcionario, cpf, cargo, cargahoraria, chavePix, auxCreche, salario, telefone
select func.nome "Funcionário", func.cpf "CPF", crg.nome "Cargo",
	concat(func.cargaHoraria, 'h') "Carga Horária", func.chavePIX "Chave PIX",
    "Auxílio Creche", -- 180 por filho menor que 7 anos
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário",
    group_concat(tel.numero separator ', ') "Telefone"
	from funcionario func
	inner join trabalhar trb on trb.Funcionario_CPF = func.CPF
    inner join cargo crg on crg.CBO = trb.Cargo_CBO
    inner join telefone tel on tel.Funcionario_CPF = func.CPF
		where trb.dataFim is null
			group by func.cpf, crg.CBO
				order by func.nome;
                
SELECT Funcionario_CPF, count(cpf) * 180 "auxCreche"
	FROM dependente
		where timestampdiff(year, dataNasc, now()) < 7
			group by Funcionario_CPF;

create view vAuxCreche as
	SELECT Funcionario_CPF, count(cpf) * 180 "auxCreche"
		FROM dependente
			where timestampdiff(year, dataNasc, now()) < 7
				group by Funcionario_CPF;
                
select * from vauxcreche;

select func.nome "Funcionário", func.cpf "CPF", crg.nome "Cargo",
	concat(func.cargaHoraria, 'h') "Carga Horária", func.chavePIX "Chave PIX",
	concat("R$ ", format(coalesce(vac.auxCreche, 0), 2, 'de_DE')) "Auxílio Creche", -- 180 por filho menor que 7 anos
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário",
    group_concat(tel.numero separator ', ') "Telefone"
	from funcionario func
	inner join trabalhar trb on trb.Funcionario_CPF = func.CPF
    inner join cargo crg on crg.CBO = trb.Cargo_CBO
    inner join telefone tel on tel.Funcionario_CPF = func.CPF
    left join vauxcreche vac on vac.Funcionario_CPF = func.CPF
		where trb.dataFim is null
			group by func.cpf, crg.CBO
				order by func.nome;

create view vRelatorioRH as
	select func.nome "Funcionário", func.cpf "CPF", crg.nome "Cargo",
		concat(func.cargaHoraria, 'h') "Carga Horária", func.chavePIX "Chave PIX",
		concat("R$ ", format(coalesce(vac.auxCreche, 0), 2, 'de_DE')) "Auxílio Creche", -- 180 por filho menor que 7 anos
		concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário",
		group_concat(tel.numero separator ', ') "Telefone"
		from funcionario func
		inner join trabalhar trb on trb.Funcionario_CPF = func.CPF
		inner join cargo crg on crg.CBO = trb.Cargo_CBO
		inner join telefone tel on tel.Funcionario_CPF = func.CPF
		left join vauxcreche vac on vac.Funcionario_CPF = func.CPF
			where trb.dataFim is null
				group by func.cpf, crg.CBO
					order by func.nome;

select * from vrelatoriorh
	where `Salário` >= avg(`Salário`);
    
select avg(salario) from funcionario;

select * from vrelatoriorh
	where `Salário` >= (select avg(salario) from funcionario);

select func.nome "Funcionário", func.cpf "CPF", crg.nome "Cargo",
	concat(func.cargaHoraria, 'h') "Carga Horária", func.chavePIX "Chave PIX",
	concat("R$ ", format(coalesce(vac.auxCreche, 0), 2, 'de_DE')) "Auxílio Creche", -- 180 por filho menor que 7 anos
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário",
    group_concat(tel.numero separator ', ') "Telefone"
	from funcionario func
	inner join trabalhar trb on trb.Funcionario_CPF = func.CPF
    inner join cargo crg on crg.CBO = trb.Cargo_CBO
    inner join telefone tel on tel.Funcionario_CPF = func.CPF
    left join vauxcreche vac on vac.Funcionario_CPF = func.CPF
		where trb.dataFim is null and
			func.salario >= (select avg(salario) from funcionario)
			group by func.cpf, crg.CBO
				order by func.nome;
                
select dep.nome "Departamento",
	concat("R$ ", format(sum(func.salario), 2, 'de_DE')) "Custo Salarial",
    count(func.cpf) "Quantidade de Funcionário",
    concat("R$ ", format(avg(func.salario), 2, 'de_DE')) "Média Salarial"
	from departamento dep
    left join trabalhar trb on trb.Departamento_idDepartamento = dep.idDepartamento
    inner join funcionario func on func.CPF = trb.Funcionario_CPF
		where trb.dataFim is null
			group by dep.idDepartamento
				order by sum(func.salario) desc;

update funcionario, 
	(select func.cpf from funcionario func
	inner join trabalhar trb on trb.Funcionario_CPF = func.cpf
	inner join cargo crg on crg.CBO = trb.Cargo_CBO
    where crg.nome like "Segurança%" or crg.nome like "Auxiliar%") as crgFunc
	set cargaHoraria = 36
		where funcionario.cpf = crgFunc.cpf;

-- 180 (<25), 280(25>=  and <35), 380 (35>=  and <45), 480 (45>=  and <55) depois 600
select upper(func.nome) "Funcionário",
	replace(replace(func.cpf, '.', ''), '-', '') "CPF",
    func.chavePIX "Chave PIX",
    concat(func.cargaHoraria, 'h') "Carga Horária",
    case func.cargaHoraria when 36 then 22 * 15 * 2
		else 22 * 15
	end "Vale Alimentação",
    case when timestampdiff(year, func.dataNasc, now()) < 25 then 180
		when timestampdiff(year, func.dataNasc, now()) between 24 and 34 then 280
        when timestampdiff(year, func.dataNasc, now()) between 34 and 44 then 380
        when timestampdiff(year, func.dataNasc, now()) between 44 and 54 then 480
        else 600
    end "Auxílio Saúde"
	from funcionario func
		order by func.nome;

select avg(salario), round(avg(salario), 2), truncate(avg(salario), 2),
	format(avg(salario), 2, 'de_DE')
	from funcionario;

select sysdate(), adddate(sysdate(), interval -7 minute);

-- https://www.devmedia.com.br/pl-sql-functions-e-procedures/29882
-- https://dev.mysql.com/doc/refman/8.4/en/create-procedure.html
-- https://dev.mysql.com/doc/refman/8.4/en/if.html
delimiter $$
create function calcValeAlimentacao(ch int)
	returns decimal(5,2) deterministic
    begin
		if (ch = 36)
			then return 22 * 15 * 2;
		else return 22 * 15;
        end if;
    end $$
delimiter ;

delimiter $$
create function calcAuxSaude(dn date)
	returns decimal(5,2) deterministic
    begin
		declare idade int;
        select timestampdiff(year, dn, now()) into idade;
        if (idade < 25) then return 180;
			elseif (idade < 35) then return 280;
            elseif (idade < 45) then return 380;
            elseif (idade < 55) then return 480;
            else return 600;
		end if;
    end $$
delimiter ;

delimiter $$
create function calcValeTransporte(pCPF varchar(14))
	returns decimal(5,2) deterministic
    begin
		declare precoPassagem decimal(4,2) default 4.3;
        declare pCidade varchar(45);
        declare pSalario decimal(7,2);
        declare vt decimal(5,2);
        
        select salario into pSalario
			from funcionario
				where cpf = pCPF;
                
		select cidade into pCidade
			from endereco
				where Funcionario_CPF = pCPF;
		
        if(pCidade = "Recife")
			then set vt = 22 * 2 * precoPassagem;
		else 
			set vt = 22 * 4 * precoPassagem;
		end if;
        
        set vt = vt - 0.06 * pSalario;
        
        if(vt < 0)
			then return 0.0;
		else
			return vt;
		end if;        
    end $$
delimiter ;

SELECT * FROM vauxcreche;

delimiter $$
create function calcINSS(salario decimal(7,2))
	returns decimal(6,2) deterministic
    begin
		if(salario <= 1518)
			then return salario * 0.075;
		elseif(salario > 1518 and salario <= 2793.88)
			then return salario * 0.09;
		elseif(salario > 2793.88 and salario <= 4190.83)
			then return salario * 0.12;
		elseif(salario > 4190.83 and salario <= 8157.41)
			then return salario * 0.14;
		else
			return 8157.41 * 0.14;
		end if;
    end $$
delimiter ;

delimiter $$
create function calcIRRF(salario decimal(7,2))
	returns decimal(6,2) deterministic
    begin
		if(salario <= 2259.20)
			then return 0.0;
		elseif(salario > 2259.20 and salario <= 2826.65)
			then return salario * 0.075;
		elseif(salario > 2826.65 and salario <= 3751.05)
			then return salario * 0.15;
		elseif(salario > 3751.05 and salario <= 4664.68)
			then return salario * 0.225;
		else
			return salario * 0.275;
		end if;
    end $$
delimiter ;

select upper(func.nome) "Funcionário",
	replace(replace(func.cpf, '.', ''), '-', '') "CPF",
    func.chavePIX "Chave PIX",
    concat(func.cargaHoraria, 'h') "Carga Horária",
    concat("R$ ", format(func.salario, 2 , 'de_DE')) "Salário Bruto",
    concat("R$ ", format(calcValeAlimentacao(func.cargaHoraria), 2 , 'de_DE')) 
		"Vale Alimentação",
    concat("R$ ", format(calcAuxSaude(func.dataNasc), 2 , 'de_DE'))
		"Auxílio Saúde",
	concat("R$ ", format(calcValeTransporte(func.cpf), 2 , 'de_DE'))
        "Vale Transporte",
	concat("R$ ", format(coalesce(vac.auxCreche, 0), 2 , 'de_DE'))
        "Auxílio Creche",
	concat("-R$ ", format(calcINSS(func.salario), 2 , 'de_DE'))
        "INSS",
	concat("-R$ ", format(calcIRRF(func.salario), 2 , 'de_DE'))
        "IRRF",
	concat("R$ ", format(func.salario + calcValeAlimentacao(func.cargaHoraria) +
    calcAuxSaude(func.dataNasc) + calcValeTransporte(func.cpf) +
    coalesce(vac.auxCreche, 0) - calcINSS(func.salario) -
    calcIRRF(func.salario), 2 , 'de_DE'))
		"Salário Líquido"
	from funcionario func
		left join vauxcreche vac on vac.Funcionario_CPF = func.cpf
			order by func.nome;

delimiter $$
create procedure cadFuncionario(in pCPF varchar(14),
								in pnome varchar(60),
								in pnomeSocial varchar(45),
								in pdataNasc date,
								in pgenero varchar(25),
								in pestadoCivil varchar(25),
								in pemail varchar(80),
								in pcarteiraTrab varchar(45),
								in pcargaHoraria int,
								in psalario decimal(7,2),
								in pchavePIX varchar(45),
                                in pUF char(2),
								in pcidade varchar(45),
								in pbairro varchar(45),
								in prua varchar(45),
								in pnumero int,
								in pcomp varchar(45),
								in pcep varchar(9),
                                in ptelefone1 varchar(15),
                                in ptelefone2 varchar(15),
                                in ptelefone3 varchar(15))
	begin
		insert into funcionario
			value (pCPF, pnome, pnomeSocial, pdataNasc, pgenero, pestadoCivil, 
            pemail, pcarteiraTrab, pcargaHoraria, psalario, pchavePIX, 
            1, 0.0);
		insert into endereco
			value (pCPF, pUF, pcidade, pbairro, prua, pnumero, pcomp, pcep);
		insert into telefone (numero, Funcionario_CPF)
			value (ptelefone1, pCPF);
		if(ptelefone2 is not null)
			then insert into telefone (numero, Funcionario_CPF)
					value (ptelefone2, pCPF);
		end if;
        if(ptelefone3 is not null)
			then insert into telefone (numero, Funcionario_CPF)
					value (ptelefone3, pCPF);
		end if;
    end $$
delimiter ;

desc endereco;

call cadFuncionario("708.807.780-78", "Laís Nayara", null, '1990-05-15', 
	"Outro", "Casada", "lais.nayara@gmail.com", "890789-00", 36, 3500,
    "708.807.780-78", "PE", "Recife", "Linha do tiro", "Rua da bala", 171, 
    "Casa B", "50171-171", "81988776677", "81977886655", null);

select * from funcionario order by nome;

select * from endereco;

select * from telefone;

delete from funcionario where cpf = "708.807.780-78";










