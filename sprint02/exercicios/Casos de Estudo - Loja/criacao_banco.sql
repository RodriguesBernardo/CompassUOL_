CREATE TABLE tbestoqueproduto (
  cdpro int not null,
  qtdpro int default null,
  status varchar(15) default null,
  primary key (cdpro)
);


CREATE TABLE tbvendedor (
  cdvdd int not null,
  nmvdd varchar(20) default null,
  sxvdd int default null,
  perccomissao decimal(19,2) default null,
  primary key (cdvdd)
);




CREATE TABLE tbdependente (
  cddep int not null,
  nmdep varchar(20) default null,
  dtnasc datetime default null,
  sxdep varchar(10) default null,
  cdvdd int default null,
  inepescola varchar(10) default null,
  primary key (cddep), 
  foreign key (cdvdd) references tbvendedor (cdvdd)
);



CREATE TABLE tbvendas (
  cdven int not null,
  dtven datetime default null,
  cdcli int default null,
  nmcli varchar(100) default null,
  cidade varchar(45) default null,
  estado varchar(45) default null,
  pais varchar(45) default null,
  cdpro int default null,
  nmpro varchar(45) default null,
  tppro varchar(5) default null,
  qtd int default null,
  und varchar(5) default null,
  vrunt decimal(19,2) default null,
  cdvdd int default null,
  cdcanalvendas int default null,
  nmcanalvendas varchar(20) default null,
  status varchar(15) default null,
  deletado char(1) default null,
  primary key (cdven),
  constraint fk_vendas_produto_estoque foreign key (cdpro) references tbestoqueproduto (cdpro),
  constraint fk_vendas_vendedor foreign key (cdvdd) references tbvendedor (cdvdd)
);

INSERT INTO tbvendedor VALUES(1,'Vendedor 1',1,1);
INSERT INTO tbvendedor VALUES(2,'Vendedor 2  ',1,1);
INSERT INTO tbvendedor VALUES(3,'Vendedor 3',1,1);
INSERT INTO tbvendedor VALUES(4,'Vendedor 4',1,0.5);
INSERT INTO tbvendedor VALUES(5,'Vendedor 5',0,0.5);
INSERT INTO tbvendedor VALUES(6,'Vendedor 6  ',0,0.5);
INSERT INTO tbvendedor VALUES(7,'Vendedor 7',0,0.5);
INSERT INTO tbvendedor VALUES(8,'Vendedor 8',0,0.5);
INSERT INTO tbvendedor VALUES(9,'Vendedor 9',0,0.5);
INSERT INTO tbvendedor VALUES(10,'Vendedor 10',0,0.5);

INSERT INTO tbestoqueproduto VALUES(1,20000,'Ativo');
INSERT INTO tbestoqueproduto VALUES(2,5000,'Ativo');
INSERT INTO tbestoqueproduto VALUES(3,2000,'Ativo');
INSERT INTO tbestoqueproduto VALUES(4,30000,'Ativo');
INSERT INTO tbestoqueproduto VALUES(5,2000,'Ativo');
INSERT INTO tbestoqueproduto VALUES(6,1000,'MVP - validação');

INSERT INTO tbdependente VALUES(1,'Dependente 1','2010-02-02 00:00:00','Masc',1,'35985740');
INSERT INTO tbdependente VALUES(2,'Dependente 2','2012-04-05 00:00:00','Masc',3,'29464862');
INSERT INTO tbdependente VALUES(3,'Dependente 3','2013-03-04 00:00:00','Fem',3,'29464862');
INSERT INTO tbdependente VALUES(4,'Dependente 4','2010-05-05 00:00:00','Fem',4,'52096602');
INSERT INTO tbdependente VALUES(5,'Dependente 5','2019-07-06 00:00:00','Masc',4,'52096602');
INSERT INTO tbdependente VALUES(6,'Dependente 6','2018-03-02 00:00:00','Fem',9,'42114322');

INSERT INTO tbvendas VALUES(1,'2010-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',4000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(3,'2010-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',4200,'KG',0.34,4,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(4,'2010-02-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(5,'2010-02-03 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',4500,'KG',0.34,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(7,'2010-03-05 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(8,'2010-03-06 00:00:00',7,'Cliente DE','João Pessoa','Paraíba','Brasil',1,'Produto A','A',12000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(9,'2010-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',17500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(11,'2011-12-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',7000,'KG',0.34,9,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(12,'2012-12-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',8000,'KG',0.34,9,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(13,'2013-12-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',8000,'KG',0.34,9,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(14,'2014-12-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',9000,'KG',0.34,9,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(15,'2015-12-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',9000,'KG',0.34,9,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(16,'2016-12-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',10000,'KG',0.34,9,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(17,'2017-12-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',10000,'KG',0.34,9,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(18,'2018-12-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',11000,'KG',0.34,9,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(19,'2019-12-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',11000,'KG',0.34,9,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(20,'2020-12-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',12000,'KG',0.34,9,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(21,'2021-01-09 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',5000,'KG',0.34,9,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(22,'2021-03-07 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',5000,'KG',0.34,9,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(23,'2021-08-07 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',20000,'KG',0.34,9,2,'Ecommerce','Em aberto','1');
INSERT INTO tbvendas VALUES(24,'2021-08-08 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',25000,'KG',0.34,9,1,'Matriz','Cancelado','0');
INSERT INTO tbvendas VALUES(25,'2010-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',9000,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(26,'2011-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',9500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(27,'2012-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',9500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(28,'2013-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',9500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(29,'2014-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',9500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(30,'2014-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',9500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(31,'2015-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',10500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(32,'2016-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',11500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(33,'2017-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',12500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(34,'2018-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',13500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(35,'2019-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',14500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(36,'2020-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',15500,'KG',0.34,3,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(37,'2021-04-07 00:00:00',8,'Cliente EE','Natal','Rio Grande do Norte','Brasil',1,'Produto A','A',17500,'KG',0.34,3,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(38,'2021-04-07 00:00:00',2,'Cliente EF','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',10000,'KG',0.34,9,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(39,'2011-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',4000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(40,'2012-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',14000,'KG',0.34,2,1,'Matriz','Em aberto','0');
INSERT INTO tbvendas VALUES(41,'2013-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',24000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(42,'2014-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',34000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(43,'2015-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',44000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(45,'2017-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',4000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(46,'2018-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',4000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(47,'2019-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',4000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(48,'2020-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',4000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(49,'2021-02-01 00:00:00',1,'Cliente AA','Florianópolis','Santa Catarina','Brasil',1,'Produto A','A',14000,'KG',0.34,2,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(50,'2011-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',4200,'KG',0.34,4,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(51,'2012-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',4200,'KG',0.34,4,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(52,'2013-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',4200,'KG',0.34,4,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(53,'2014-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',14200,'KG',0.34,4,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(54,'2015-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',14200,'KG',0.34,4,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(55,'2016-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',24200,'KG',0.34,4,1,'Matriz','Em aberto','1');
INSERT INTO tbvendas VALUES(56,'2017-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',24200,'KG',0.34,4,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(57,'2018-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',24200,'KG',0.34,4,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(58,'2019-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',24200,'KG',0.34,4,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(59,'2020-02-01 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',4200,'KG',0.34,4,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(60,'2021-08-07 00:00:00',5,'Cliente BB','Belo Horizonte','Minas Gerais','Brasil',1,'Produto A','A',4200,'KG',0.34,4,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(61,'2011-02-01 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',4500,'KG',0.34,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(62,'2012-02-03 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',4500,'KG',0.34,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(63,'2013-02-02 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',14500,'KG',0.34,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(64,'2014-02-03 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',14500,'KG',0.34,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(65,'2015-02-03 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',14500,'KG',0.34,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(66,'2016-02-03 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',14500,'KG',0.34,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(67,'2017-04-04 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',14500,'KG',0.34,1,1,'Matriz','Em aberto','1');
INSERT INTO tbvendas VALUES(68,'2018-05-05 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',14500,'KG',0.34,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(69,'2019-06-07 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',14500,'KG',0.34,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(70,'2020-07-07 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',14500,'KG',0.34,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(71,'2021-08-07 00:00:00',4,'Cliente CC','Fortaleza','Ceará','Brasil',1,'Produto A','A',14500,'KG',0.34,1,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(72,'2011-03-05 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(73,'2013-03-05 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(74,'2015-03-05 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(75,'2017-03-05 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(76,'2018-03-05 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(77,'2019-03-05 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(78,'2020-03-05 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(79,'2021-03-05 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(80,'2021-04-05 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(81,'2021-08-07 00:00:00',6,'Cliente DD','Goiânia','Goiás','Brasil',1,'Produto A','A',12500,'KG',0.34,2,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(82,'2012-03-06 00:00:00',7,'Cliente DE','João Pessoa','Paraíba','Brasil',1,'Produto A','A',12000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(83,'2014-03-06 00:00:00',7,'Cliente DE','João Pessoa','Paraíba','Brasil',1,'Produto A','A',12000,'KG',0.34,2,1,'Matriz','Cancelado','0');
INSERT INTO tbvendas VALUES(84,'2016-03-06 00:00:00',7,'Cliente DE','João Pessoa','Paraíba','Brasil',1,'Produto A','A',12000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(85,'2019-03-06 00:00:00',7,'Cliente DE','João Pessoa','Paraíba','Brasil',1,'Produto A','A',12000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(86,'2020-03-06 00:00:00',7,'Cliente DE','João Pessoa','Paraíba','Brasil',1,'Produto A','A',22000,'KG',0.34,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(87,'2021-03-06 00:00:00',7,'Cliente DE','João Pessoa','Paraíba','Brasil',1,'Produto A','A',22000,'KG',0.34,2,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(88,'2021-06-06 00:00:00',7,'Cliente DE','João Pessoa','Paraíba','Brasil',1,'Produto A','A',42000,'KG',0.34,2,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(89,'2021-08-07 00:00:00',7,'Cliente DE','João Pessoa','Paraíba','Brasil',1,'Produto A','A',52000,'KG',0.34,2,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(90,'2011-02-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',11250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(91,'2012-02-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',12250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(92,'2013-02-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',13250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(93,'2014-02-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',14250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(94,'2015-02-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',15250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(95,'2016-02-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',16250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(96,'2017-02-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',17250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(97,'2018-02-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',18250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(98,'2019-02-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',19250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(99,'2020-03-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',19250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(100,'2021-07-02 00:00:00',3,'Cliente BC','Baturité','Ceará','Brasil',2,'Produto C','A',19250,'KG',7,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(101,'2015-02-02 00:00:00',10,'Cliente ABC','São Paulo','São Paulo','Brasil',2,'Produto C','A',15250,'KG',7,10,1,'Matriz','Cancelado','0');
INSERT INTO tbvendas VALUES(102,'2016-02-02 00:00:00',10,'Cliente ABC','São Paulo','São Paulo','Brasil',2,'Produto C','A',15250,'KG',7,10,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(103,'2017-02-02 00:00:00',10,'Cliente ABC','São Paulo','São Paulo','Brasil',2,'Produto C','A',15250,'KG',7,10,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(104,'2018-02-02 00:00:00',10,'Cliente ABC','São Paulo','São Paulo','Brasil',2,'Produto C','A',15250,'KG',7,10,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(105,'2019-02-02 00:00:00',10,'Cliente ABC','São Paulo','São Paulo','Brasil',2,'Produto C','A',15250,'KG',7,10,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(106,'2020-02-02 00:00:00',10,'Cliente ABC','São Paulo','São Paulo','Brasil',2,'Produto C','A',15250,'KG',7,10,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(107,'2021-02-02 00:00:00',10,'Cliente ABC','São Paulo','São Paulo','Brasil',2,'Produto C','A',15250,'KG',7,10,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(108,'2021-07-01 00:00:00',10,'Cliente ABC','São Paulo','São Paulo','Brasil',2,'Produto C','A',15250,'KG',7,10,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(110,'2015-02-02 00:00:00',9,'Cliente BCA','Rio de Janeiro','Rio de Janeiro','Brasil',2,'Produto C','A',25250,'KG',7,8,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(112,'2016-02-02 00:00:00',9,'Cliente BCA','Rio de Janeiro','Rio de Janeiro','Brasil',2,'Produto C','A',25250,'KG',7,8,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(114,'2017-02-02 00:00:00',9,'Cliente BCA','Rio de Janeiro','Rio de Janeiro','Brasil',2,'Produto C','A',25250,'KG',7,8,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(115,'2018-02-02 00:00:00',9,'Cliente BCA','Rio de Janeiro','Rio de Janeiro','Brasil',2,'Produto C','A',25250,'KG',7,8,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(116,'2018-03-02 00:00:00',9,'Cliente BCA','Rio de Janeiro','Rio de Janeiro','Brasil',2,'Produto C','A',25250,'KG',7,8,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(117,'2020-02-02 00:00:00',9,'Cliente BCA','Rio de Janeiro','Rio de Janeiro','Brasil',2,'Produto C','A',25250,'KG',7,8,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(118,'2021-05-15 00:00:00',9,'Cliente BCA','Rio de Janeiro','Rio de Janeiro','Brasil',2,'Produto C','A',25250,'KG',7,8,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(120,'2010-02-13 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',4500,'KG',0.34,6,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(121,'2011-02-03 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',4500,'KG',0.34,6,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(122,'2012-02-03 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',4500,'KG',0.34,6,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(123,'2013-01-03 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',4500,'KG',0.34,6,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(124,'2014-02-03 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',4500,'KG',0.34,6,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(125,'2015-02-03 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',4500,'KG',0.34,6,1,'Matriz','Cancelado','0');
INSERT INTO tbvendas VALUES(126,'2016-02-03 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',4500,'KG',0.34,6,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(127,'2017-06-03 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',14500,'KG',0.34,6,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(128,'2018-08-03 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',14500,'KG',0.34,6,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(129,'2019-05-03 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',14500,'KG',0.34,6,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(130,'2020-01-03 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',34500,'KG',0.34,6,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(131,'2021-08-04 00:00:00',11,'Cliente CCC','Salvador','Bahia','Brasil',1,'Produto A','A',44500,'KG',0.34,6,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(140,'2011-09-06 00:00:00',13,'Cliente MAC','Maceió','Alagoas','Brasil',1,'Produto A','A',4500,'KG',0.34,7,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(141,'2012-09-06 00:00:00',13,'Cliente MAC','Maceió','Alagoas','Brasil',1,'Produto A','A',4500,'KG',0.34,7,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(142,'2013-09-06 00:00:00',13,'Cliente MAC','Maceió','Alagoas','Brasil',1,'Produto A','A',4500,'KG',0.34,7,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(143,'2014-09-06 00:00:00',13,'Cliente MAC','Maceió','Alagoas','Brasil',1,'Produto A','A',4500,'KG',0.34,7,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(144,'2015-09-06 00:00:00',13,'Cliente MAC','Maceió','Alagoas','Brasil',1,'Produto A','A',4500,'KG',0.34,7,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(145,'2016-09-06 00:00:00',13,'Cliente MAC','Maceió','Alagoas','Brasil',1,'Produto A','A',14500,'KG',0.34,7,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(146,'2018-09-06 00:00:00',13,'Cliente MAC','Maceió','Alagoas','Brasil',1,'Produto A','A',34500,'KG',0.34,7,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(147,'2019-09-06 00:00:00',13,'Cliente MAC','Maceió','Alagoas','Brasil',1,'Produto A','A',44500,'KG',0.34,7,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(148,'2020-09-06 00:00:00',13,'Cliente MAC','Maceió','Alagoas','Brasil',1,'Produto A','A',44500,'KG',0.34,7,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(149,'2021-05-15 00:00:00',13,'Cliente MAC','Maceió','Alagoas','Brasil',1,'Produto A','A',44500,'KG',0.34,7,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(150,'2010-03-01 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',730,'KG',2,5,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(151,'2011-03-05 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',1730,'KG',2,5,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(152,'2012-05-01 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',2730,'KG',2,5,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(153,'2013-04-03 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',3730,'KG',2,5,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(154,'2014-07-01 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',4730,'KG',2,5,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(155,'2015-06-02 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',5730,'KG',2,5,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(156,'2016-07-29 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',7730,'KG',2,5,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(157,'2017-03-23 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',19730,'KG',2,5,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(158,'2019-02-17 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',19730,'KG',2,5,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(159,'2020-02-14 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',19730,'KG',2,5,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(160,'2021-07-02 00:00:00',14,'Cliente MGS','Campo Grande','Mato Grosso do Sul','Brasil',3,'Produto E','B',19730,'KG',2,5,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(170,'2010-05-21 00:00:00',18,'Cliente GRM','Gramado','Rio Grande do Sul','Brasil',5,'Produto CH','A',10030,'KG',9,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(171,'2012-12-21 00:00:00',18,'Cliente GRM','Gramado','Rio Grande do Sul','Brasil',5,'Produto CH','A',10030,'KG',9,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(172,'2014-02-01 00:00:00',18,'Cliente GRM','Gramado','Rio Grande do Sul','Brasil',5,'Produto CH','A',10030,'KG',9,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(173,'2016-07-05 00:00:00',18,'Cliente GRM','Gramado','Rio Grande do Sul','Brasil',5,'Produto CH','A',10030,'KG',9,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(174,'2017-08-11 00:00:00',18,'Cliente GRM','Gramado','Rio Grande do Sul','Brasil',5,'Produto CH','A',10030,'KG',9,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(175,'2018-06-25 00:00:00',18,'Cliente GRM','Gramado','Rio Grande do Sul','Brasil',5,'Produto CH','A',10030,'KG',9,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(176,'2019-05-28 00:00:00',18,'Cliente GRM','Gramado','Rio Grande do Sul','Brasil',5,'Produto CH','A',20030,'KG',9,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(177,'2020-03-30 00:00:00',18,'Cliente GRM','Gramado','Rio Grande do Sul','Brasil',5,'Produto CH','A',20030,'KG',9,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(178,'2021-04-01 00:00:00',18,'Cliente GRM','Gramado','Rio Grande do Sul','Brasil',5,'Produto CH','A',20030,'KG',9,2,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(180,'2010-03-15 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',750,'KG',0.5,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(181,'2012-04-30 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',1750,'KG',0.5,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(182,'2013-12-25 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',2750,'KG',0.5,1,1,'Matriz','Cancelado','0');
INSERT INTO tbvendas VALUES(183,'2014-11-21 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',3750,'KG',0.5,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(184,'2015-03-16 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',4750,'KG',0.5,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(185,'2017-03-11 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',6750,'KG',0.5,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(186,'2018-06-05 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',5750,'KG',0.5,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(187,'2019-05-04 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',18750,'KG',0.5,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(188,'2020-07-02 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',19750,'KG',0.5,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(189,'2021-08-01 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',20750,'KG',0.5,1,1,'Matriz','Concluído','0');
INSERT INTO tbvendas VALUES(190,'2021-08-03 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',20750,'KG',0.5,1,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(191,'2021-08-05 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',20750,'KG',0.5,1,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(192,'2021-08-07 00:00:00',16,'Cliente PIR','Piripiri','Piauí','Brasil',4,'Produto SL','A',30750,'KG',0.5,1,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(200,'2021-03-15 00:00:00',17,'Cliente MTG','Palmas','Tocantins','Brasil',6,'Produto TN  ','C',1750,'KG',0.25,5,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(201,'2021-04-05 00:00:00',17,'Cliente MTG','Palmas','Tocantins','Brasil',6,'Produto TN  ','C',11750,'KG',0.25,5,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(202,'2021-05-15 00:00:00',17,'Cliente MTG','Palmas','Tocantins','Brasil',6,'Produto TN  ','C',21750,'KG',0.25,5,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(203,'2021-05-16 00:00:00',17,'Cliente MTG','Palmas','Tocantins','Brasil',6,'Produto TN  ','C',31750,'KG',0.25,5,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(204,'2021-07-01 00:00:00',17,'Cliente MTG','Palmas','Tocantins','Brasil',6,'Produto TN  ','C',41750,'KG',0.25,5,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(205,'2021-07-15 00:00:00',17,'Cliente MTG','Palmas','Tocantins','Brasil',6,'Produto TN  ','C',51750,'KG',0.25,5,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(206,'2021-08-01 00:00:00',17,'Cliente MTG','Palmas','Tocantins','Brasil',6,'Produto TN  ','C',71750,'KG',0.25,5,2,'Ecommerce','Concluído','0');
INSERT INTO tbvendas VALUES(207,'2021-08-07 00:00:00',17,'Cliente MTG','Palmas','Tocantins','Brasil',6,'Produto TN  ','C',91750,'KG',0.25,5,2,'Ecommerce','Cancelado','0');