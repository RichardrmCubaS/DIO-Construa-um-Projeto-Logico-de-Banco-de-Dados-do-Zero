CREATE DATABASE IF NOT EXISTS OrdemServiço;
USE OrdemServiço;

-- ORDEM SERVIÇO
CREATE TABLE OrdemServiço(
	IdOrdemServiço INT auto_increment PRIMARY KEY,
	TipoServiço VARCHAR(20),
    DataEmissão DATE,
	DataEntrega DATE,
    Veiculo VARCHAR(90),
	Status VARCHAR(20),
	CustoTotal FLOAT
    );

DESC Ordem Serviço;

-- REVISÂO MANUTENÇÂO
CREATE TABLE REVISÂO(
    IdRevisão INT auto_increment PRIMARY KEY,
	OrdemServiço_IdOrdemServiço INT,
	HoraTrabalho FLOAT,
	CustoHoras FLOAT,
    CONSTRAINT fk_OrdemServiço_IdOrdemServiço FOREIGN KEY (OrdemServiço_IdOrdemServiço) REFERENCES OrdemServiço(IdOrdemServiço)
    );

DESC Revisão Manutenção;

-- CONSERTO Veicular
CREATE TABLE Conserto(
    IdConserto INT auto_increment PRIMARY KEY,
	OrdemServiço_IdOrdemServiço INT,
	CustoTrabalho FLOAT,
	PreçoPecas FLOAT,	
	CONSTRAINT fk_OrdemServiço_IdOrdemServiço FOREIGN KEY (OrdemServiço_IdOrdemServiço) REFERENCES OrdemServiço(IdOrdemServiço)    
    );

DESC Conserto de Veiculo;

-- PEÇAS
CREATE TABLE Pecas(
	IdPecas INT auto_increment PRIMARY KEY,
	Conserto_IdConserto INT,
	QuantidadePecas FLOAT,
	CustoPecas FLOAT,	
    CONSTRAINT fk_Conserto_IdConserto FOREIGN KEY (Conserto_IdConserto) REFERENCES Conserto(IdConserto)
);

DESC Pecas;

-- Funcionario
CREATE TABLE Funcionario (
   IdFuncionario INT auto_increment PRIMARY KEY,
   Nome VARCHAR(45),
   Especialidade VARCHAR(25),
   Endereco VARCHAR(90),
   Equipe_IdEquipe INT,
   CONSTRAINT Equipe_IdEquipe FOREIGN KEY (Equipe_IdEquipe) REFERENCES Equipe(IdEquipe)
); 

DESC Funcionario;

-- EQUIPE MECANICO
CREATE TABLE Equipe(
	IdEquipe INT auto_increment PRIMARY KEY,
	OrdemServiço_IdOrdemServiço INT,
    CONSTRAINT fk_POrdemServiço_IdOrdemServiço FOREIGN KEY (OrdemServiço_IdOrdemServiço) REFERENCES OrdemServiço(IdOrdemServiço)   
);

DESC Equipe Mecanico;

-- TRIAGEM DE SERVIÇO
CREATE TABLE Triagem(
    IdTriagem INT auto_increment PRIMARY KEY,
	Equipe_IdEquipe INT,
	OrdemServiço_IdOrdemServiço INT,
	Cliente_IdCliente INT,
	Descriçao VARCHAR(90),
    Autorização VARCHAR(20),
	DataTriagem DATE,
	CONSTRAINT fk_Equipe_IdEquipe FOREIGN KEY (Equipe_IdEquipe) REFERENCES Equipe(IdEquipe),
    CONSTRAINT fk_OrdemServiço_IdOrdemServiço FOREIGN KEY (OrdemServiço_IdOrdemServiço) REFERENCES OrdemServiço(IdOrdemServiço),
	CONSTRAINT fk_Cliente_IdCliente FOREIGN KEY (Cliente_IdCliente) REFERENCES Cliente(IdCliente),
);

DESC Triagem de Serviço;

-- Cliente 
CREATE TABLE Cliente(
	IdCliente INT auto_increment PRIMARY KEY,
	Identificação VARCHAR(20),
    Nome VARCHAR(45),
	CPF CHAR (11) NOT NULL,
	CNPJ VARCHAR(18) NOT NULL,
	Endereço VARCHAR(90),
	Telefone VARCHAR(20)
);

DESC Cliente;


-- PAGO DE ORDEM DE SERVIÇO
CREATE TABLE Pago(
	IdPago INT auto_increment PRIMARY KEY,
	DataPago DATE,
    TipoPago VARCHAR(20),
	Cliente_IdCliente INT,
	OrdemServiço_IdOrdemServiço INT,
   	Valor FLOAT,
	CONSTRAINT fk_OrdemServiço_IdOrdemServiço FOREIGN KEY (OrdemServiço_IdOrdemServiço) REFERENCES OrdemServiço(IdOrdemServiço),
	CONSTRAINT fk_Cliente_IdCliente FOREIGN KEY (Cliente_IdCliente) REFERENCES Cliente(IdCliente)	
);

DESC Pago Ordem de Serviço;