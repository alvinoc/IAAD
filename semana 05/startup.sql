
begin;
create schema bd_startup; 

use bd_startup;

-- Criando as tabelas
create table startup(
	id_startup INT NOT NULL,
	nome_startup VARCHAR(50) NOT NULL,
	PRIMARY KEY(id_startup)); 
    
create table linguagem_programacao(
	id_linguagem INT  NOT NULL,
    linguagem VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_linguagem));
	
create table programador(
	id_programador INT NOT NULL,
	id_startup INT NOT NULL,
    nome_programador VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_programador));
    
create table programador_linguagem(
	id_programador INT NOT NULL,
	id_linguagem INT  NOT NULL,
	PRIMARY KEY(id_programador,id_linguagem));

	
-- populando/carregando as tabelas do banco de dados
insert into startup values
	(1,'startup 1'),
	(2,'startup 2'),
    (3,'startup 3'),
    (4,'startup 4'),
    (5,'startup 5'),
    (6,'startup 6');
	
 insert into programador values
	(1,1,'joao'),
	(2,2,'paula'),
    (3,3,'renata'),
    (4,4,'felipe'),
    (5,4,'ana'),
    (6,1,'alexandre');
    
insert into linguagem_programacao values
	(1,'python'),
	(2,'php'),
    (3,'java'),
    (4,'swift'),
    (5,'c#'),
    (6,'javascript');
insert into programador_linguagem values
	(1,1),
	(1,2),
    (2,3),
    (3,4),
    (3,5),
    (4,5);



-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table programador	ADD FOREIGN KEY(id_startup) REFERENCES startup(id_startup);
alter table programador_linguagem	ADD FOREIGN KEY(id_programador) REFERENCES programador(id_programador);
alter table programador_linguagem ADD FOREIGN KEY(id_linguagem) REFERENCES linguagem_programacao(id_linguagem);

commit;