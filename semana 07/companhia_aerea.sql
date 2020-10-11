-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Script do Banco de Dados Empresa 

begin;
create schema companhia_area; -- inclua seu nome
-- O comando 'create database' é semelhante ao comando 'create schema'
use companhia_area;

-- Criando as tabelas
create table aeroporto(
	cod_aeroporto int NOT NULL,
	nome VARCHAR(45) NOT NULL,
	cidade VARCHAR(45),
    estado VARCHAR(45),
	PRIMARY KEY(cod_aeroporto));-- Aplicando a restrição de chave primária (PK)
    
create table voo(
	num_voo INT NOT NULL,
	companhia_area VARCHAR(45) NOT NULL,
    dias_semana VARCHAR(45) NOT NULL,
	PRIMARY KEY (num_voo)
    );
    
create table trecho_voo(
	num_voo INT NOT NULL,
    num_trecho INT,
    cod_aeroporto_partida INT NOT NULL,
    horario_partida_previsto TIME,
    cod_aeroporto_chegada int NOT NULL,
    horario_chegada_previsto TIME,
    PRIMARY KEY (num_trecho)
	);
    
create table instancia_trecho(
	num_voo INT NOT NULL,
	num_trecho INT ,
    datas DATE,
	num_assento_disponivel INT NOT NULL,
    cod_aeronove INT NOT NULL,
    cod_aeroporto_partida INT NOT NULL,
    horario_partida TIME,
     cod_aeroporto_chegada int NOT NULL,
     horario_chegada TIME,
	PRIMARY KEY(datas)
    
	);
    
create table tarifa(
	num_voo INT NOT NULL,
	cod_tarifa INT NOT NULL,
	quantidade INT NOT NULL,
	restricoes VARCHAR(50),
	PRIMARY KEY(cod_tarifa)
    );
    
create table tipo_aeronave(
	nome_tipo_aeronave INT NOT NULL,
	qtd_max_assentos INT NOT NULL,
	companhia VARCHAR(45) NOT NULL,
	PRIMARY KEY (nome_tipo_aeronave)
    );

create table pode_pousar(
	nome_tipo_aeronave INT NOT NULL,
	cod_aeroporto int NOT NULL,
	PRIMARY KEY (nome_tipo_aeronave)
    );
	
    create table aeronave(
	cod_aeronave INT NOT NULL,
	num_total_assentos int NOT NULL,
    tipo_aeronave VARCHAR(50),
	PRIMARY KEY (cod_aeronave)
    );
    
    create table reserva_assento(
	num_voo INT NOT NULL,
	num_trecho int NOT NULL,
    datas DATE,
    num_assento INT NOT NULL,
    nome_cliente VARCHAR(50),
    telefone_cliente VARCHAR(50),
	PRIMARY KEY (num_assento)
    );
    

-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table trecho_voo	ADD FOREIGN KEY(num_voo) REFERENCES voo(num_voo);
alter table instancia_trecho ADD FOREIGN KEY(num_voo) REFERENCES voo(num_voo);
alter table instancia_trecho ADD FOREIGN KEY (num_trecho) REFERENCES trecho_voo(num_trecho);
alter table tarifa ADD FOREIGN KEY (num_voo) REFERENCES voo(num_voo);
alter table pode_pousar ADD FOREIGN KEY (nome_tipo_aeronave) REFERENCES tipo_aeronave(nome_tipo_aeronave);
alter table pode_pousar ADD FOREIGN KEY (cod_aeroporto) REFERENCES aeroporto(cod_aeroporto);
alter table reserva_assento ADD FOREIGN KEY (num_voo) REFERENCES  voo(num_voo);
alter table reserva_assento ADD FOREIGN KEY (num_trecho) REFERENCES  trecho_voo(num_trecho);
alter table reserva_assento ADD FOREIGN KEY (datas) REFERENCES  instancia_trecho(datas);


commit;