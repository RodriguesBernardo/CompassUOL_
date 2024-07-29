-- autor definition

CREATE TABLE autor (
  codautor int NOT NULL,
  nome varchar(90) NOT NULL,
  nascimento date NOT NULL,
  PRIMARY KEY (CodAutor)
);

CREATE UNIQUE INDEX idx_autor on autor(nome,nascimento);


-- endereco definition

CREATE TABLE endereco (
  codendereco int NOT NULL,
  pais varchar(90) DEFAULT NULL,
  estado varchar(90) DEFAULT NULL,
  cidade varchar(90) DEFAULT NULL,
  PRIMARY KEY (codendereco)
);


-- editora definition

CREATE TABLE editora (
  codeditora int NOT NULL,
  nome varchar(90) DEFAULT NULL,
  endereco int DEFAULT NULL,
  PRIMARY KEY (codeditora),
  FOREIGN KEY (endereco) REFERENCES endereco (codendereco)
);


-- livro definition

CREATE TABLE livro (
  cod int NOT NULL,
  titulo varchar(90) NOT NULL,
  autor int NOT NULL,
  editora int NOT NULL,
  valor float DEFAULT NULL,
  publicacao date DEFAULT NULL,
  edicao varchar(20) DEFAULT NULL,
  idioma varchar(20) DEFAULT 'Português',
  primary KEY (cod),
  FOREIGN KEY (Autor) REFERENCES autor (codautor),
  FOREIGN KEY (Editora) REFERENCES editora (codeditora)
);



INSERT INTO autor (codautor,nome,nascimento) VALUES
	 (1,'AENGEL, Yunus A','1964-12-21'),
	 (2,'ÁVILA,  Geraldo','1975-10-08'),
	 (3,'AADNOY, Bernt','1976-04-01'),
	 (4,'ABBASCHIAN,  R','1981-11-23'),
	 (5,'ABE, Jair Minoro','1982-08-12'),
	 (6,'ABRAHAM, Martin A','1983-01-04'),
	 (7,'ABRAMCZUK, André A.','1983-07-27'),
	 (8,'ABRAMOVAY, Ricardo','1984-04-24'),
	 (9,'ABREU, Antônio Suárez','1985-04-17'),
	 (10,'ABUNAHMAN, Sérgio Antonio','1985-06-08');
INSERT INTO autor (codautor,nome,nascimento) VALUES
	 (11,'ACEVEDO MARIN, Rosa Elizabeth','1986-03-03'),
	 (12,'ACEVEDO, Claudia Rosa','1986-03-11'),
	 (13,'AGÊNCIA NACIONAL DE ENERGIA ELÉTRICA BRASIL','1986-11-03'),
	 (14,'AGOSTINHO,  Oswaldo  Luiz','1987-05-30'),
	 (15,'AKABANE, Getulio K.','1988-02-04'),
	 (16,'ALBANO, Ricardo Sonaglio','1988-02-09'),
	 (17,'ALBERGUINI, Leny Borghesan A','1988-02-28'),
	 (18,'ALBERTIN, Alberto Luiz','1989-05-24'),
	 (19,'ALBERTS, Bruce','1990-09-13'),
	 (20,'ALEKSEEV, Vladimir Nikolaevich','1991-04-01');
INSERT INTO autor (codautor,nome,nascimento) VALUES
	 (21,'ALENCAR FILHO, Edgard De','1991-06-06'),
	 (23,'ALEXÉEV, Michael V.','1992-05-14'),
	 (24,'ALEXANDER, Charles K','1992-06-20'),
	 (25,'ALLEN, P. A','1992-07-14'),
	 (26,'ALLINGER, Norman L (et al)','1992-09-29'),
	 (27,'ALMEIDA, Alfredo Wagner Berno De','1992-10-02'),
	 (28,'ALMEIDA, Fernando José De','1993-02-03'),
	 (29,'ALMEIDA, Jalcione','1993-03-29'),
	 (30,'ALMEIDA, Márcio De Souza S. De','1993-04-23'),
	 (31,'ALMEIDA, Rogério Henrique','1993-06-12');
INSERT INTO autor (codautor,nome,nascimento) VALUES
	 (32,'ALMEIDA, Salvador Luiz De','1993-06-24'),
	 (33,'ALONSO,  Marcelo','1993-08-23'),
	 (34,'ALRO, Helle','1993-09-08'),
	 (35,'ALTMANN, Wolfgang','1994-03-18'),
	 (36,'ALVARENGA, Beatriz Gonçalves De','1994-03-28'),
	 (37,'ALVES, Adilson Francelino','1994-04-02'),
	 (38,'ALVES, José Jerônimo De Alencar','1994-08-09'),
	 (39,'ALVES, Rubem','1994-09-04'),
	 (40,'ALVES, William Pereira','1994-10-26'),
	 (41,'AMABIS, José Mariano','1994-10-31');
INSERT INTO autor (codautor,nome,nascimento) VALUES
	 (42,'AMADO, Nélia','1994-11-02'),
	 (43,'AMALDI, U','1994-11-24'),
	 (44,'AMARAL FILHO, Jair Do','1994-12-07'),
	 (45,'AMARAL, Adriano Benayon Do','1994-12-31'),
	 (46,'AMARAL, Luciano Do','1995-02-09'),
	 (47,'ASTOLFI,  Jean-pierre','1995-02-21'),
	 (48,'ATKINS,  P.  W','1995-03-02'),
	 (49,'AZEVEDO, Gustavo H. W. De','1995-04-22'),
	 (51,'BABBITT, Harold E','1995-05-16'),
	 (52,'BACCAN, Nivaldo','1995-08-17');
INSERT INTO autor (codautor,nome,nascimento) VALUES
	 (53,'BACHELARD, Gaston','1995-10-02'),
	 (54,'BALBO, José Tadeu','1995-10-02'),
	 (55,'BALTAR, Carlos Adolpho Magalhães','1995-10-20'),
	 (56,'BARANENKOV, G. S','1995-10-22'),
	 (57,'BARATA, Ronaldo','1995-11-01'),
	 (58,'BARBALHO, Jader','1995-11-05'),
	 (59,'BARBETTA, Pedro Alberto','1995-11-18'),
	 (60,'BARBOSA,  Ruy  Madsen','1995-12-11'),
	 (61,'BARBOSA, Addson Lourenço','1995-12-17'),
	 (62,'BARBOSA, Estêvão José Da Silva','1995-12-22');
INSERT INTO autor (codautor,nome,nascimento) VALUES
	 (63,'BARBOSA, João Lucas Marques','1995-12-30'),
	 (64,'BARCELOS NETO, João','1996-01-02'),
	 (65,'BARDÁLEZ  HOYOS,  Juan  L','1996-01-13'),
	 (66,'BARISON, Thiago','1996-01-20'),
	 (67,'BARP, Wilson José','1996-02-14'),
	 (68,'BARROS NETO, Benício De','1996-02-15'),
	 (69,'BARROS, Benjamim Ferreira De','1996-02-28'),
	 (70,'BARROS, Carlos','1996-04-02'),
	 (71,'BARROS, Maria Vitória Martins','1996-04-03'),
	 (72,'BARROS, Regina Mambeli','1996-06-07');
INSERT INTO autor (codautor,nome,nascimento) VALUES
	 (73,'BARROSO, Leônidas Conceição.','1996-06-09'),
	 (74,'BARSANO, Paulo Roberto','1996-06-09');

INSERT INTO endereco (codendereco,pais,estado,cidade) VALUES
	 (3657,'Brasil','PARANÁ','Guaratuba'),
	 (4890,'Brasil','SÃO PAULO','São Paulo'),
	 (4964,'Brasil','RIO DE JANEIRO','Rio de Janeiro'),
	 (4983,'Brasil','DISTRITO FEDERAL','Brasília'),
	 (5028,'Brasil','MINAS GERAIS','Belo Horizonte'),
	 (5030,'Brasil','RIO GRANDE DO SUL','Porto Alegre'),
	 (5173,'Brasil','RIO GRANDE DO SUL','São Leopoldo'),
	 (5567,'USA','',''),
	 (5570,'Inglaterra','',NULL);
	 
INSERT INTO editora (codeditora,nome,endereco) VALUES
	 (1,' Ática',4890),
	 (2,' AB Ed.',4890),
	 (3,' ABM',4890),
	 (4,' Addison-Wesley',5570),
	 (5,' Artmed',4890),
	 (6,' Associação Brasileira de Metalurgia e Materiais',4890),
	 (7,' Atlas',4890),
	 (8,' Beca',4890),
	 (9,' Blucher',4890),
	 (10,' Blucher',4890);
INSERT INTO editora (codeditora,nome,endereco) VALUES
	 (11,' Bookman',4890),
	 (12,' Brasiliense',4983),
	 (13,' CBMM',3657),
	 (14,' Ciência Moderna',5028),
	 (15,' Companhia das Letras',5028),
	 (16,' CONAB',5028),
	 (17,' Contexto',4983),
	 (18,' Contraponto',4983),
	 (19,' Cortez',5028),
	 (20,' Cultrix',5028);
INSERT INTO editora (codeditora,nome,endereco) VALUES
	 (21,' Distribel',5028),
	 (22,' Ed.  Nacional',4983),
	 (23,' Ed. da UFRGS',5030),
	 (24,' Ed. da UNESP',4890),
	 (25,' Ed. FIOCRUZ',4983),
	 (26,' Ed. UEPG',4983),
	 (27,' Ed. UFLA',4983),
	 (28,' Ed. UFMG',5028),
	 (29,' Ed. UFRGS',5030),
	 (30,' Ed. UNESP',4890);
INSERT INTO editora (codeditora,nome,endereco) VALUES
	 (31,' EDUFSCAR',4983),
	 (32,' EdUSP',5028),
	 (33,' Edusp EPU',4983),
	 (34,' Elsevier',5567),
	 (35,' EPUSP',4890),
	 (36,' Escola  Federal  de Engenharia',4983),
	 (37,' Expressão Popular',4983),
	 (38,' Gaia',4983),
	 (39,' Garamond',5570),
	 (40,' Harbra',4983);
INSERT INTO editora (codeditora,nome,endereco) VALUES
	 (41,' Hemus',4983),
	 (42,' IBGE',4964),
	 (43,' IDESP',4890),
	 (44,' IMPA',4983),
	 (45,' Imperial College Press',5567),
	 (46,' Infobook',5570),
	 (47,' Interciência',4983),
	 (48,' J.  Zahar',4983),
	 (49,' John  Wiley',5570),
	 (50,' Lamparina',5028);
INSERT INTO editora (codeditora,nome,endereco) VALUES
	 (51,' Loyola',4890),
	 (52,' LTC',4890),
	 (53,' MacGraw-Hill do Brasil',4890),
	 (54,' Makron Books do Brasil',4890),
	 (55,' Manole',4890),
	 (56,' McGraw-Hill',5567),
	 (57,' Mir',4890),
	 (58,' Moderna',4890),
	 (59,' Novatec',4890),
	 (60,' Oficina de Textos',4890);
INSERT INTO editora (codeditora,nome,endereco) VALUES
	 (61,' Pearson',5570),
	 (62,' Pearson  Prentice  Hall',5567),
	 (63,' Pearson Education',5567),
	 (64,' Pearson Education do Brasil',4890),
	 (65,' PETROBRAS ABEDA',4964),
	 (66,' PETROBRAS Sociedade Brasileira de Geofísica',4964),
	 (67,' Pini',4890),
	 (68,' Prentice Hall Pearson',5567),
	 (69,' UFPA',5030),
	 (70,' Saraiva',5030);
INSERT INTO editora (codeditora,nome,endereco) VALUES
	 (71,' Unisinos',5173),
	 (72,' WMF Martins Fontes',5030),
	 (73,' Zahar',5567),
	 (74,'Addison-Wesley',5567);


INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (3,'A floresta e a conservaçào do solo, sua importância cultural e econômica',2,13,172.45,'2007-10-15','5','portugues'),
	 (4,'Administraçào da produçào',63,13,242.41,'2003-08-24','4','portugues'),
	 (5,'Notas avulsas',46,13,149.79,'2007-10-29','1','portugues'),
	 (6,'O ABC da empresa de serviços',34,13,85.0,'2010-05-07','4','portugues'),
	 (7,'Enxertia do cacaueiro',31,13,413.46,'2004-07-21','2','portugues'),
	 (8,'Artesào de saberes',47,13,512.22,'2017-08-23','2','portugues'),
	 (9,'Fundamentos de eletrônica',46,13,515.04,'2016-09-05','3','portugues'),
	 (10,'O verào feliz da senhora Forbes',48,13,229.72,'2013-09-27','1','portugues'),
	 (11,'Instrumentaçào industrial',23,13,224.95,'2013-10-13','1','portugues'),
	 (12,'Simpísio sobre Terraceamento Agâicola',29,13,423.83,'2001-04-16','1','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (1,'Principles of engineering geology',1,13,297.92,'2003-01-30','3','portugues'),
	 (13,'Princâpios de fisiologia animal',8,13,515.64,'2006-06-05','2','portugues'),
	 (14,'Vegetaçào arborea e arbustea nos altiplanos das chapadas do Piaui Central',38,13,328.01,'2006-06-19','2','portugues'),
	 (15,'Estudios de estilâstica',66,13,157.92,'2002-03-20','3','portugues'),
	 (16,'Métodos e técnicas de pesquisa em comunicaçào',53,13,90.09,'2005-03-13','1','portugues'),
	 (17,'Introduction to trawling',17,13,465.08,'2003-07-31','2','portugues'),
	 (18,'Favela',20,13,156.62,'2005-02-05','4','portugues'),
	 (19,'Machinapolis e a caosmologia do ser',31,13,479.9,'2011-09-20','1','portugues'),
	 (20,'Armance',31,13,372.67,'2011-11-29','4','portugues'),
	 (24,'The Dance of Death',14,13,0.16,'2010-02-15','2','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (23,'Como produzir doces em barra',44,13,137.21,'2008-05-18','5','portugues'),
	 (25,'Odontogeriatria',9,13,357.35,'2017-02-24','2','portugues'),
	 (26,'Biblioteca escolar',49,13,74.72,'2004-11-05','2','portugues'),
	 (27,'Excursões para a terceira idade',6,13,315.66,'2003-06-13','2','portugues'),
	 (28,'Limitaciones y usos del derecho de construir',55,13,496.59,'2007-08-27','1','portugues'),
	 (29,'Berlim',47,13,479.58,'2005-03-07','5','portugues'),
	 (30,'Engenharia econômica e finanças',73,13,229.48,'2014-01-25','5','portugues'),
	 (31,'Les assertions bergsoniennes',69,13,423.42,'2013-02-04','1','portugues'),
	 (32,'Guia autodidactica par la alimentacion de ganado y aves de corral',34,13,8.86,'2004-09-08','4','portugues'),
	 (33,'Dicionário inglês português, português inglês',13,13,402.25,'2011-07-19','4','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (34,'Duailibi das citações',64,13,236.15,'2005-03-15','2','portugues'),
	 (35,'Resistência dos materiais',74,13,151.56,'2009-12-13','3','portugues'),
	 (36,'Pregnancy childbirth-referenced test for classroom instruction',70,13,161.21,'2005-03-10','4','portugues'),
	 (37,'Contabilidade pública na gestào municipal',14,13,460.07,'2001-10-15','5','portugues'),
	 (38,'Autos-de-fé como espetáculos de massa',36,13,463.27,'2018-05-31','3','portugues'),
	 (39,'Recuperaçào de físforo por cristalizaçào de estruvita',11,13,189.74,'2011-01-09','5','portugues'),
	 (40,'Recomendações técnicas para agricultura de vazantes',45,13,50.07,'2005-11-24','1','portugues'),
	 (41,'Firmin',43,13,248.84,'2005-10-23','5','portugues'),
	 (42,'Trajetos no labirinto',69,13,331.75,'2010-12-13','1','portugues'),
	 (43,'Enciclopédia Disney. -',44,13,212.65,'2013-02-08','2','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (44,'Tratado de pediatria',39,13,396.7,'2014-03-07','5','portugues'),
	 (45,'O texto estranho',72,13,511.84,'2017-12-24','2','portugues'),
	 (46,'Citaçào e modernidade em Alvares de Azevedo',18,13,185.16,'2017-06-18','2','portugues'),
	 (47,'Tribunal Penal Internacional:',21,13,252.92,'2007-05-21','3','portugues'),
	 (48,'Antenas de microfita com patch supercondutor a 212 K',74,13,132.49,'2012-11-17','5','portugues'),
	 (49,'Marx e a liberdade',8,13,45.62,'2016-05-31','2','portugues'),
	 (51,'A arte da guerra',3,13,379.27,'2008-02-02','4','portugues'),
	 (52,'De l''acte',39,13,348.59,'2003-10-07','5','portugues'),
	 (53,'Game physics',31,13,94.8,'2006-01-03','5','portugues'),
	 (54,'Intervalo entre partos em bufálas no tropico úmido brasileiro',12,13,127.95,'2004-01-23','1','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (55,'Discursos',34,13,397.65,'2009-08-03','1','portugues'),
	 (56,'A teoria da probabilidade',19,13,432.25,'2011-02-25','3','portugues'),
	 (57,'Emulsões de íleo de copaâba',33,13,316.4,'2005-02-03','4','portugues'),
	 (58,'Reflexões de um economista',60,13,332.04,'2004-01-05','5','portugues'),
	 (59,'Doenças de peixes',45,13,30.87,'2009-10-07','2','portugues'),
	 (60,'Consultoria e diagnístico empresarial',48,13,302.03,'2000-06-05','1','portugues'),
	 (61,'A nova obscuridade',47,13,411.06,'2017-02-09','1','portugues'),
	 (62,'Curso de cunicultura.-',12,13,272.59,'2015-12-08','1','portugues'),
	 (63,'Duas décadas de atuaçào governamental no controle dos problemas fitossanitários da lavoura',39,13,0.04,'2010-05-16','2','portugues'),
	 (64,'A evoluçào do processo de tomada de decisào na Uniào Europeia e sua repercussào para o Bra',63,13,249.97,'2001-11-14','1','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (65,'Método de pesquisa',34,13,101.44,'2007-04-14','3','portugues'),
	 (66,'La legende des siécles',36,13,13.44,'2005-11-30','2','portugues'),
	 (67,'Direito do petríleo',46,13,26.01,'2010-10-15','5','portugues'),
	 (68,'O ensino da biblioteconomia no contexto brasileiro: século XX',45,13,47.84,'2006-07-16','5','portugues'),
	 (69,'A revoluçào do amor',67,13,290.22,'2016-08-14','5','portugues'),
	 (70,'Ninguém gosta de mim?',16,13,175.25,'2018-02-08','1','portugues'),
	 (71,'àtomo e natureza',61,13,273.76,'2015-05-23','2','portugues'),
	 (72,'Imaginário radical e educaçào fâsica',9,13,297.51,'2008-12-03','5','portugues'),
	 (73,'Ensinar histíria no século XXI',68,13,464.09,'2005-03-17','5','portugues'),
	 (74,'Artes marciais mistas',30,13,144.72,'2015-05-06','1','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (75,'Impactos sociais da automaçào',67,13,111.61,'2011-08-05','2','portugues'),
	 (76,'Dignidade humana e moralidade democrática',15,13,91.56,'2013-04-27','5','portugues'),
	 (77,'Por que os gêmeos sào tào iguais?',58,13,46.75,'2016-07-23','2','portugues'),
	 (78,'Ensayos filosofico-juridicos',24,13,313.92,'2017-11-07','3','portugues'),
	 (79,'Aprendendo a viver',8,13,88.54,'2008-09-16','1','portugues'),
	 (80,'Epidemiologia das helmintoses de bovinos de corte no planalto catarinense',15,13,271.93,'2018-07-28','3','portugues'),
	 (81,'Rainforest cities',36,13,465.83,'2018-02-19','3','portugues'),
	 (82,'Atlas histírico do Rio Grande do Norte',29,13,218.24,'2000-10-23','3','portugues'),
	 (83,'Pensée implicite et perception visuelle',45,13,276.53,'2002-06-30','4','portugues'),
	 (84,'Fragmentos de um discurso amoroso',72,13,359.69,'2008-01-04','4','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (85,'Diálogo (bio)polâtico',14,13,287.57,'2014-05-16','3','portugues'),
	 (86,'Umberto Eco and the open text',67,13,476.3,'2001-10-10','4','portugues'),
	 (87,'Bombas',2,13,465.53,'2011-03-01','2','portugues'),
	 (88,'Classical mathematical logic',35,13,168.66,'2014-08-14','1','portugues'),
	 (89,'Problemas de genética',4,13,419.97,'2001-09-27','1','portugues'),
	 (90,'Desenvolvimento de um protítipo para alimentaçào de pís para aspersào térmica em tocha de',52,13,119.74,'2017-07-03','4','portugues'),
	 (91,'Ericksonian approaches to hypnosis and psychotherapy',9,13,307.69,'2007-04-24','2','portugues'),
	 (92,'Organizaçào e projeto de computadores',37,13,343.5,'2002-12-07','2','portugues'),
	 (93,'O verào das rosas',39,13,514.7,'2011-06-20','5','portugues'),
	 (94,'Minha cidade, Natal, e eu',52,13,285.79,'2006-02-02','4','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (95,'Marco de referência de educaçào alimentar e nutricional para as polâticas públicas. -',40,13,284.1,'2016-05-30','1','portugues'),
	 (96,'Data mining with neural networks',47,13,80.31,'2002-04-12','5','portugues'),
	 (97,'A psicologia dos psicílogos',66,13,381.36,'2018-09-02','5','portugues'),
	 (98,'In soft garments',16,13,259.32,'2002-04-19','5','portugues'),
	 (99,'Bom dia América de 500 anos',52,13,448.63,'2014-01-20','4','portugues'),
	 (100,'Minidicionário prático',46,13,11.75,'2013-06-02','2','portugues'),
	 (101,'Nightfall',72,13,387.98,'2003-01-31','5','portugues'),
	 (102,'Visào perpétua',5,13,300.27,'2005-06-14','4','portugues'),
	 (103,'O fim do misterio',64,13,461.55,'2002-02-03','4','portugues'),
	 (104,'A embriaguez na conquista da América',7,13,89.41,'2007-03-08','3','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (105,'Flow visualization and image analysis',70,13,28.36,'2010-08-03','1','portugues'),
	 (106,'Cost control in the hospitality industry',57,13,410.42,'2006-06-19','5','portugues'),
	 (162,'Agente penitenciário',5,1,489.27,'2008-10-05','5','portugues'),
	 (163,'Inglês-Português dicionário técnico pormenorizado de aeronáutica, automobilismo, estradas',42,1,161.67,'2002-04-04','3','portugues'),
	 (164,'Gramática reflexiva',42,1,252.48,'2004-07-09','2','portugues'),
	 (165,'Molecular markers, natural history, and evolution',24,1,324.77,'2015-05-12','1','portugues'),
	 (167,'Espécies nativas para piscicultura no Brasil',59,1,412.98,'2007-03-07','4','portugues'),
	 (168,'Direito social na Uniào Européia e Mercosul',45,1,480.8,'2002-12-24','3','portugues'),
	 (169,'Projeto de aberturas em almas de vigas de aço e vigas mistas de aço e concreto.',38,1,156.7,'2018-10-11','1','portugues'),
	 (170,'Modelo de gerenciamento de estoques de peças de reposiçào para empresas de transporte urba',43,1,271.84,'2001-11-30','5','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (171,'Morfologia vegetal',58,1,104.15,'2005-12-08','5','portugues'),
	 (172,'Problemas de estética',72,1,210.01,'2016-03-21','3','portugues'),
	 (173,'Recopilacion, organizacion e interpretacion de datos',74,1,279.81,'2005-07-09','5','portugues'),
	 (174,'Numerical methods in biomedical engineering',28,1,76.32,'2006-10-09','4','portugues'),
	 (175,'Memírias de leitura',60,1,399.31,'2010-04-25','5','portugues'),
	 (158,'Planejamento de bibliotecas',67,1,477.19,'2001-06-29','5','portugues'),
	 (159,'Cronica',25,1,94.57,'2001-01-21','1','portugues'),
	 (160,'Ninoca vai à escola',66,1,11.63,'2010-05-22','1','portugues'),
	 (161,'O casamento da Bruxa Onilda',36,1,480.81,'2015-06-14','1','portugues'),
	 (156,'Esculpir o tempo',47,1,443.89,'2011-02-14','3','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (157,'As bases do processo classificatírio em arquivâstica',11,1,148.58,'2018-09-15','1','portugues'),
	 (154,'"Biologia alimentar e morfohistologia do tubo digestírio do Mussum, Synbranchus marmoratus',4,1,37.62,'2014-12-09','5','portugues'),
	 (155,'Traité de caractérologie',35,1,448.98,'2001-01-28','1','portugues'),
	 (151,'Jean-Jacques Rousseau',46,1,144.7,'2008-07-25','5','portugues'),
	 (152,'Electrodynamics',56,1,60.98,'2012-05-16','2','portugues'),
	 (153,'A ética protestante e o espârito do capitalismo',57,1,371.61,'2013-01-01','2','portugues'),
	 (144,'O mundo na cozinha',69,13,457.39,'2006-09-12','3','portugues'),
	 (145,'Medidas cautelares',65,1,357.39,'2003-03-20','1','portugues'),
	 (146,'Uso de modelos i* para enriquecer requisitos em métodos ágeis',59,1,419.86,'2006-04-01','5','portugues'),
	 (147,'Os temas de movimento de Rudolf Laban',36,1,363.6,'2017-06-20','2','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (148,'Jogos, conjuntos e matemática',9,1,399.12,'2009-04-24','2','portugues'),
	 (149,'Desvendando a fâsica do corpo humano',40,1,14.25,'2008-06-24','4','portugues'),
	 (150,'Pets',46,1,67.34,'2003-09-13','4','portugues'),
	 (141,'Shakespeare',8,13,257.53,'2015-10-29','2','portugues'),
	 (142,'Data quality and record linkage techniques',6,13,241.45,'2017-04-02','1','portugues'),
	 (143,'Bibliografia de e sobre Tercio Rosado Maia, no Boletim Bibliográfico e na Coleçào Mossoroe',67,13,196.05,'2014-11-27','5','portugues'),
	 (134,'Anais do II Simpísio Avançado de Solos e Nutriçào de Plantas',31,13,69.13,'2010-10-06','4','portugues'),
	 (135,'Constelações organizacionais',29,13,380.22,'2009-04-19','2','portugues'),
	 (136,'Drums',7,13,253.94,'2015-07-06','3','portugues'),
	 (137,'Um tigre, dois tigres, três tigres',41,13,253.28,'2003-09-04','3','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (138,'Macroeconomia',21,13,391.91,'2000-08-08','3','portugues'),
	 (139,'Neurobiology of Huntington''s disease',61,13,250.04,'2000-11-21','2','portugues'),
	 (140,'Francisco José de Lacerda e Almeida',44,13,43.15,'2006-06-21','1','portugues'),
	 (133,'àcaros e insetos associados a algumas culturas irrigadas do sub-médio Sào Francisco',65,13,102.24,'2011-08-23','2','portugues'),
	 (128,'O milho',6,13,459.11,'2015-04-07','2','portugues'),
	 (129,'Fundamentos do projeto de componentes de máquinas',67,13,332.1,'2009-08-27','3','portugues'),
	 (130,'Os bichos. -',6,13,430.22,'2001-01-09','2','portugues'),
	 (131,'Manual de sanidad avicola',17,13,257.18,'2003-07-25','3','portugues'),
	 (122,'Cosmos and psyche',69,13,142.99,'2007-01-29','2','portugues'),
	 (123,'De volta para os braços da rainha dos céus',39,13,393.47,'2014-04-26','5','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (124,'Projeto de pesquisa',67,13,374.78,'2001-06-24','3','portugues'),
	 (125,'Bibliografia sobre doenças do milho',23,13,144.21,'2009-08-21','3','portugues'),
	 (126,'Oncologia molecular',39,13,423.88,'2008-12-17','1','portugues'),
	 (127,'Crâtica cultural materialista',17,13,325.38,'2009-10-25','3','portugues'),
	 (113,'Populismo penal midiático:',38,13,412.01,'2010-04-15','5','portugues'),
	 (114,'Os gestos',3,13,267.95,'2009-07-01','5','portugues'),
	 (115,'A doutrina secreta',8,13,404.58,'2007-11-13','3','portugues'),
	 (116,'Histíria em revista. -',4,13,291.73,'2006-02-11','4','portugues'),
	 (117,'Linux programming by example',25,13,342.63,'2013-03-04','3','portugues'),
	 (118,'L''instauration philosophique',52,13,470.53,'2010-03-15','3','portugues');
INSERT INTO livro (cod,titulo,autor,editora,valor,publicacao,edicao,idioma) VALUES
	 (119,'Organizaçào de eventos',33,13,255.68,'2015-11-10','2','portugues'),
	 (120,'Alavanque seu potencial',8,13,280.75,'2010-12-31','3','portugues'),
	 (121,'Parceria e risco na agricultura do Nordeste',74,13,331.51,'2014-12-25','1','portugues'),
	 (110,'A técnica e a prática da psicanálise',24,13,390.26,'2003-06-07','5','portugues'),
	 (111,'Introduçào à educaçào fâsica adaptada para pessoas com deficiência',44,13,286.99,'2000-03-19','2','portugues'),
	 (112,'Materials science for engineers',23,13,395.81,'2001-08-22','2','portugues'),
	 (107,'O meio ambiente para pequenas empresas de construçào civil e suas práticas de gestào ambie',37,13,423.5,'2007-09-24','3','portugues'),
	 (108,'San Agustân',49,13,431.35,'2015-04-21','3','portugues');

