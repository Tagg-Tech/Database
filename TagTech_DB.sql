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
  qtdTotalMemoria BIGINT,
  qtdTotalDisco BIGINT, 
  qtdNucleosCPU INT, 
  qtdNucleosVirtuaisCPU INT, 
  fkEmpresa INT NOT NULL,
  FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE registros (
idRegistro INT PRIMARY KEY AUTO_INCREMENT, 
percentualMemoria DECIMAL(6,2), 
qtdUtilizadaDisco BIGINT, 
percentualDisco DECIMAL(6,2), 
percentualCPU DECIMAL (6,2), 
frequenciaCPU DECIMAL (6,2),  
dataHora DATETIME DEFAULT now()
);

SELECT * FROM registros;

CREATE TABLE usuarioResponsavelMaquina (
  fkUsuario INT NOT NULL,
  fkMaquina INT NOT NULL,
  PRIMARY KEY (fkUsuario, fkMaquina),
  FOREIGN KEY (fkUsuario) REFERENCES usuario (idUsuario),
  FOREIGN KEY (fkMaquina) REFERENCES maquina (idMaquina)
);
