-- SQL: DDL (Alter - Drop)

drop table funcionario;
drop table endereco;
drop table dependente;
drop table trabalhar;
drop table departamento;
drop table telefone;

drop schema pousadaalambique;

desc uh;

alter table uh
	add column valor decimal(6,2) unsigned zerofill not null;

alter table uh
	change column valor valorDiaria decimal(5,2) unsigned 
		not null;

alter table uh
	drop column valorDiaria;


alter table uh
	add column valor decimal(6,2) unsigned 
		not null after nome;



