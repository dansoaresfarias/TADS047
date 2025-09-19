-- SQL: DML (insert, update, delete)

insert into funcionario (cpf, nome, dataNasc, genero, 
	estadoCivil, email, carteiraTrab, cargaHoraria, salario,
    chavePix, `status`)
    value ("345.543.44-55", "Danielle Barbosa", '1994-04-22',
    "Feminino", "Casada", "danibarbosa@gmail.com", "321456",
    40, 2800, "danibarbosa@gmail.com", 1);
    
insert into funcionario (cpf, nome, dataNasc, genero, 
	estadoCivil, email, carteiraTrab, cargaHoraria, salario,
    chavePix, `status`)
    values ("123.543.44-22", "Anderson Alexandre", '1991-11-22',
    "Masculino", "Casado", "andersonAle@gmail.com", "3216578",
    40, 2300, "andersonAle@gmail.com", 1),
    
    ("070.543.44-00", "Marcelo Barbosa", '1982-12-17',
    "Masculino", "Solteiro", "celobarbosa@gmail.com", "3434356",
    40, 1800, "070.543.44-00", 1),
    
    ("125.543.44-22", "Laís Nayara", '1999-08-10',
    "Feminino", "Casada", "laisnayara@gmail.com", "787654",
    40, 2000, "laisnayara@gmail.com", 1);
    
 insert into endereco
	values ("345.543.44-55", "PE", "Paulista", 
		"Nossa Senhora da Conceição", "Rua direita", 326, 
        "Ap 201", "53429-321"),
        ("123.543.44-22", "PE", "Recife", 
		"Madalena", "Rua benfica", 1234, 
        "Ap 1203", "50899-321"),
        ("070.543.44-00", "PE", "Paulista", 
		"Janga", "Rua da ponte", 34, 
        null, "50080-321"),
        ("125.543.44-22", "PE", "Olinda", 
		"Passarinho", "Rua engenheiro José Freitas", 45, 
        null, "50080-080");
    
update funcionario
	set salario = 3000
		where cpf = "070.543.44-00";
    
update funcionario
	set salario = 5000, cargaHoraria = 44, fg = 1200
		where cpf = "125.543.44-22";    
    
update funcionario
	set salario = salario * 1.1
		where genero = "Feminino";
    
update funcionario
	set salario = salario * 1.05;

update funcionario
	set fg = 200
		where salario >= 1500 and salario <= 2500;

update funcionario
	set fg = 300
		where salario between 1500 and 2500;

update funcionario
	set fg = 500
		where nome like "%Barbosa" or nome like "%Silva%";
        
update funcionario
	set fg = 1000
		where genero = "Feminino" and salario < 3000;
        
update funcionario
	set fg = null
		where genero = "Feminino";

update funcionario
	set genero = "";

delete from funcionario
	where cpf = "033.741.852-96";

delete from funcionario
	where salario >= 4000;

-- DTL    
start transaction;
delete from funcionario;
commit;
rollback;
