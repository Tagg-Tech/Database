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

CREATE TABLE registros (
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
nomeMaquina VARCHAR(45), 
sistemaOperacional VARCHAR(7), 
qtdTotalMemoria BIGINT, 
percentualMemoria DECIMAL(6,2), 
qtdTotalDisco BIGINT, 
qtdUtilizadaDisco BIGINT, 
percentualDisco DECIMAL(6,2), 
qtdNucleosCPU INT, 
qtdNucleosVirtuaisCPU INT, 
percentualCPU DECIMAL (6,2), 
frequenciaCPU DECIMAL (6,2), 
nomeUsuario VARCHAR(45), 
dataHora DATETIME DEFAULT now()
);

CREATE TABLE processos (
idProcessos INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
);

SELECT * FROM registros;

SELECT * FROM processos;
SELECT COUNT(*) as qtdNomes, nome FROM processos GROUP BY nome ORDER BY qtdNomes DESC;
TRUNCATE TABLE processos;

CREATE TABLE usuarioResponsavelMaquina (
  fkUsuario INT NOT NULL,
  fkMaquina INT NOT NULL,
  PRIMARY KEY (fkUsuario, fkMaquina),
  FOREIGN KEY (fkUsuario) REFERENCES usuario (idUsuario),
  FOREIGN KEY (fkMaquina) REFERENCES maquina (idMaquina)
);
