CREATE DATABASE IF NOT EXISTS TagTech;
USE TagTech ;

CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  razaoSocial VARCHAR(80),
  nomeFantasia VARCHAR(80),
  cnpj CHAR(14),
  cep CHAR(8)
);

CREATE TABLE usuario (
  idUsuario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  email VARCHAR(45),
  senha VARCHAR(45),
  cargo VARCHAR(45),
  telefone VARCHAR(45),
  cpf CHAR(11),
  fkEmpresa INT NOT NULL,
  FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE maquina (
  idMaquina INT PRIMARY KEY AUTO_INCREMENT,
  nomeMaquina VARCHAR(45),
  sistemaOperacional VARCHAR(45),
  fkEmpresa INT NOT NULL,
  FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE historico (
  idHistorico INT PRIMARY KEY AUTO_INCREMENT,
  momento DATETIME, 
  percentualCPU DECIMAL (6,1),
  usoCPU DECIMAL (5,2),
  usoMemoria DECIMAL (5,2),
  usoDisco DECIMAL (5,2),
  fkMaquina INT NOT NULL,
  FOREIGN KEY (fkMaquina) REFERENCES maquina (idMaquina)
);

CREATE TABLE usuarioResponsavelMaquina (
  fkUsuario INT NOT NULL,
  fkMaquina INT NOT NULL,
  PRIMARY KEY (fkUsuario, fkMaquina),
  FOREIGN KEY (fkUsuario) REFERENCES usuario (idUsuario),
  FOREIGN KEY (fkMaquina) REFERENCES maquina (idMaquina)
);
