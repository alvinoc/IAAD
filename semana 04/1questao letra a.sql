-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Script do Banco de Dados Empresa 

begin;
create schema biblioteca; -- inclua seu nome
-- O comando 'create database' é semelhante ao comando 'create schema'
use biblioteca;

-- Criando as tabelas
create table Livro(
	cod_livro int NOT NULL,
	titulo VARCHAR(45) NOT NULL,
	nome_editora VARCHAR(45),
	PRIMARY KEY(cod_livro));-- Aplicando a restrição de chave primária (PK)
    
create table LIVRO_AUTOR(
	cod_livro INT NOT NULL,
	nome_autor VARCHAR(45) NOT NULL,
	PRIMARY KEY (cod_livro)
    );
    
create table EDITORA(
	nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(45) NOT NULL,
    telefone VARCHAR(45) NOT NULL,
    PRIMARY KEY (nome)
	);
    
create table LIVRO_COPIAS(
	cod_livro INT NOT NULL,
	cod_unidade INT NOT NULL,
	qt_copia INT NOT NULL,
	PRIMARY KEY(cod_livro,cod_unidade,qt_copia)
    
	);
    
create table LIVRO_EMPRESTIMO(
	cod_livro INT NOT NULL,
	cod_unidade INT NOT NULL,
	num_cartao INT NOT NULL,
	data_emprestimo DATETIME,
	data_devolucao DATETIME,
	PRIMARY KEY(cod_livro, cod_unidade, nr_cartao )
    );
    
create table UNIDADE_BIBLIOTECA(
	cod_unidade INT NOT NULL,
	nome_unidade VARCHAR(45) NOT NULL,
	endereco VARCHAR(45) NOT NULL,
	PRIMARY KEY (cod_unidade)
    );

create table USUARIO(
	num_cartao INT NOT NULL,
	nome VARCHAR(45) NOT NULL,
	endereco VARCHAR(45) NOT NULL,
    telefone VARCHAR(45) NOT NULL,
	PRIMARY KEY (num_cartao)
    );
	
-- populando/carregando as tabelas do banco de dados
insert into LIVRO values
	(1,'livro de bd','pearson'),
	(2,'livro de oo','ufrpe'),
	(3,'livro soft agil','ufrpe')
	;
	
 insert into LIVRO_AUTOR values
	(1,'roberta'),
	(2,'gabriel'),
	(3,'teresa')
    ;		
 insert into EDITORA values
	('pearson','london', '9999999'),
	('ufrpe','recife', '888888'),
	('thompson','recife', '888888')
    ;			
    
insert into LIVRO_COPIAS values
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3)
	;
    
insert into LIVRO_EMPRESTIMO values
	(1,1, 123, '2020-09-19', '2020-09-20'),
	(2,2, 456, '2020-09-19', '2020-09-21'),
	(3,3, 789, '2020-09-19', '2020-09-22')
	;
    
insert into UNIDADE_BIBLIOTECA values
	(1,'nome1', 'biblioteca rural'),
	(2,'nome2', 'biblioteca rural'),
	(3,'nome3', 'biblioteca rural')
	;

insert into USUARIO values
	(123,'claro alvino', 'recife', '991222527'),
	(456,'iago filipe', 'paulista', '123456789'),
	(789,'victor saad', 'recife', '012345678')
	;
-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table LIVRO_AUTOR	ADD FOREIGN KEY(cod_livro) REFERENCES LIVRO(cod_livro);
alter table LIVRO ADD FOREIGN KEY(nome_editora) REFERENCES EDITORA(nome);
alter table LIVRO_COPIAS ADD FOREIGN KEY (cod_livro) REFERENCES LIVRO(cod_livro);
alter table LIVRO_COPIAS ADD FOREIGN KEY (cod_unidade) REFERENCES UNIDADE_BIBLIOTECA(cod_unidade);
alter table LIVRO_EMPRESTIMO ADD FOREIGN KEY (cod_livro) REFERENCES LIVRO(cod_livro);
alter table LIVRO_EMPRESTIMO ADD FOREIGN KEY (cod_unidade) REFERENCES UNIDADE_BIBLIOTECA(cod_unidade);
alter table LIVRO_EMPRESTIMO ADD FOREIGN KEY (num_cartao) REFERENCES USUARIO(num_cartao);


commit;