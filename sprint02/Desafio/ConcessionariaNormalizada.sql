create database Concessionaria;

use Concessionaria;

CREATE TABLE Cliente (
  idCliente      int PRIMARY KEY,
  nomeCliente    varchar(100),
  cidadeCliente  varchar(40),
  estadoCliente  varchar(40),
  paisCliente    varchar(40)
);

CREATE TABLE Carro (
  idCarro      int PRIMARY KEY,
  kmCarro      int,
  classiCarro  varchar(50),
  marcaCarro   varchar(80),
  modeloCarro  varchar(80),
  anoCarro     int
);

CREATE TABLE Combustivel (
  idCombustivel   int PRIMARY KEY,
  tipoCombustivel varchar(20)
);

CREATE TABLE Vendedor (
  idVendedor      int PRIMARY KEY,
  nomeVendedor    varchar(50),
  sexoVendedor    smallint,
  estadoVendedor  varchar(40)
);

CREATE TABLE Locacao (
  idLocacao       int PRIMARY KEY,
  idCliente       int,
  idCarro         int,
  idCombustivel   int,
  dataLocacao     datetime,
  horaLocacao     time,
  qtdDiaria       int,
  vlrDiaria       decimal(18,2),
  dataEntrega     date,
  horaEntrega     time,
  idVendedor      int,
  FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
  FOREIGN KEY (idCarro) REFERENCES Carro(idCarro),
  FOREIGN KEY (idCombustivel) REFERENCES Combustivel(idCombustivel),
  FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor)
);


INSERT INTO Cliente (idCliente, nomeCliente, cidadeCliente, estadoCliente, paisCliente) VALUES
(2, 'Cliente dois', 'São Paulo', 'São Paulo', 'Brasil'),
(3, 'Cliente tres', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil'),
(4, 'Cliente quatro', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil'),
(5, 'Cliente cinco', 'Manaus', 'Amazonas', 'Brasil'),
(6, 'Cliente seis', 'Belo Horizonte', 'Minas Gerais', 'Brasil'),
(10, 'Cliente dez', 'Rio Branco', 'Acre', 'Brasil'),
(20, 'Cliente vinte', 'Macapá', 'Amapá', 'Brasil'),
(22, 'Cliente vinte e dois', 'Porto Alegre', 'Rio Grande do Sul', 'Brasil'),
(23, 'Cliente vinte e três', 'Eusébio', 'Ceará', 'Brasil'),
(26, 'Cliente vinte e seis', 'Campo Grande', 'Mato Grosso do Sul', 'Brasil');


INSERT INTO Carro (idCarro, kmCarro, classiCarro, marcaCarro, modeloCarro, anoCarro) VALUES
(1, 1800, 'AAAKNS8JS76S39', 'Toyota', 'Corolla XEI', 2023),
(2, 10000, 'AKIUNS1JS76S39', 'Nissan', 'Versa', 2019),
(3, 121700, 'DKSHKNS8JS76S39', 'VW', 'Fusca 78', 1978),
(4, 55000, 'LLLUNS1JS76S39', 'Nissan', 'Versa', 2020),
(5, 28000, 'MSLUNS1JS76S39', 'Nissan', 'Frontier', 2022),
(7, 212800, 'SSIUNS8JS76S39', 'Fiat', 'Fiat 147', 1996),
(10, 211800, 'LKIUNS8JS76S39', 'Fiat', 'Fiat 147', 1996),
(98, 25412, 'AKJHKN98JY76539', 'Fiat', 'Fiat Uno', 2000),
(99, 20000, 'IKJHKN98JY76539', 'Fiat', 'Fiat Palio', 2010);


INSERT INTO Combustivel (idCombustivel, tipoCombustivel) VALUES
(1, 'Gasolina'),
(2, 'Etanol'),
(3, 'Flex'),
(4, 'Diesel');


INSERT INTO Vendedor (idVendedor, nomeVendedor, sexoVendedor, estadoVendedor) VALUES
(5, 'Vendedor cinco', 0, 'São Paulo'),
(6, 'Vendedora seis', 1, 'São Paulo'),
(7, 'Vendedora sete', 1, 'Rio de Janeiro'),
(8, 'Vendedora oito', 1, 'Minas Gerais'),
(16, 'Vendedor dezesseis', 0, 'Amazonas'),
(30, 'Vendedor trinta', 0, 'Rio Grande do Sul'),
(31, 'Vendedor trinta e um', 0, 'Ceará'),
(32, 'Vendedora trinta e dois', 1, 'Mato Grosso do Sul');

INSERT INTO Locacao (idLocacao, idCliente, idCarro, idCombustivel, dataLocacao, horaLocacao, qtdDiaria, vlrDiaria, dataEntrega, horaEntrega, idVendedor) VALUES
(1, 2, 98, 1, '2015-01-10', '10:00', 2, 100.00, '2015-01-12', '10:00', 5),
(2, 2, 98, 1, '2015-02-10', '12:00', 2, 100.00, '2015-02-12', '12:00', 5),
(3, 3, 99, 1, '2015-02-13', '12:00', 2, 150.00, '2015-02-15', '12:00', 6),
(4, 4, 99, 1, '2015-02-15', '13:00', 5, 150.00, '2015-02-20', '13:00', 6),
(5, 4, 99, 1, '2015-03-02', '14:00', 5, 150.00, '2015-03-07', '14:00', 7),
(6, 6, 3, 1, '2016-03-02', '14:00', 10, 250.00, '2016-03-12', '14:00', 8),
(7, 6, 3, 1, '2016-08-02', '14:00', 10, 250.00, '2016-08-12', '14:00', 8),
(8, 4, 3, 1, '2017-01-02', '18:00', 10, 250.00, '2017-01-12', '18:00', 6),
(9, 4, 3, 1, '2018-01-02', '18:00', 10, 280.00, '2018-01-12', '18:00', 6),
(10, 10, 10, 1, '2018-03-02', '18:00', 10, 50.00, '2018-03-12', '18:00', 16),
(11, 20, 7, 1, '2018-04-01', '11:00', 10, 50.00, '2018-04-11', '11:00', 16),
(13, 22, 2, 2, '2022-05-01', '08:00', 20, 150.00, '2022-05-21', '18:00', 30),
(14, 22, 2, 2, '2022-06-01', '08:00', 20, 150.00, '2022-06-21', '18:00', 30),
(15, 22, 2, 2, '2022-07-01', '08:00', 20, 150.00, '2022-07-21', '18:00', 30),
(16, 22, 2, 2, '2022-08-01', '08:00', 20, 150.00, '2022-07-21', '18:00', 30),
(17, 23, 4, 2, '2022-09-01', '08:00', 20, 150.00, '2022-09-21', '18:00', 31),
(18, 23, 4, 2, '2022-10-01', '08:00', 20, 150.00, '2022-10-21', '18:00', 31),
(19, 23, 4, 2, '2022-11-01', '08:00', 20, 150.00, '2022-11-21', '18:00', 31),
(20, 5, 1, 3, '2023-01-02', '18:00', 10, 880.00, '2023-01-12', '18:00', 16),
(21, 5, 1, 3, '2023-01-15', '18:00', 10, 880.00, '2023-01-25', '18:00', 16),
(22, 26, 5, 4, '2023-01-25', '08:00', 5, 600.00, '2023-01-30', '18:00', 32),
(23, 26, 5, 4, '2023-01-31', '08:00', 5, 600.00, '2023-02-05', '18:00', 32),
(24, 26, 5, 4, '2023-02-06', '08:00', 5, 600.00, '2023-02-11', '18:00', 32),
(25, 26, 5, 4, '2023-02-12', '08:00', 5, 600.00, '2023-02-17', '18:00', 32);

