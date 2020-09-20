-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Script do Banco de Dados Empresa 

begin;
create schema loja; -- inclua seu nome
-- O comando 'create database' é semelhante ao comando 'create schema'
use loja;

-- Criando as tabelas
create table CLIENTE(
	cod_cli int NOT NULL,
	nome VARCHAR(45),
    email VARCHAR(45) NOT NULL,
    telefone VARCHAR(45) NOT NULL,
	PRIMARY KEY(cod_cli));-- Aplicando a restrição de chave primária (PK)
    
create table PRODUTO(
	cod_produto INT NOT NULL,
	descricao VARCHAR(45) NOT NULL,
	PRIMARY KEY (cod_produto)
    );
    
create table PEDIDO(
	num_pedido INT NOT NULL,
	cod_cli int NOT NULL,
    data DATE,
    PRIMARY KEY (num_pedido)
	);
    
create table ITEM_PEDIDO(
	num_pedido INT NOT NULL,
	num_item INT NOT NULL,
	cod_produto INT NOT NULL,
    qntde INT NOT NULL,
    prec_uni INT NOT NULL,
	PRIMARY KEY(num_pedido,num_item)
    
	);
    

-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table PEDIDO ADD FOREIGN KEY(cod_cli) REFERENCES CLIENTE(cod_cli);

alter table ITEM_PEDIDO ADD FOREIGN KEY(num_pedido) REFERENCES PEDIDO(num_pedido) ON DELETE CASCADE;

alter table ITEM_PEDIDO ADD FOREIGN KEY (cod_produto) REFERENCES PRODUTO(cod_produto) ON UPDATE CASCADE ON DELETE NO ACTION;

commit;