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
    
    
    