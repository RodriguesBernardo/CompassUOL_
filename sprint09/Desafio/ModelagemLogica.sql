CREATE TABLE DimGenero (
    idGenero    int PRIMARY KEY,
    nomeGenero  varchar(45)
);

CREATE TABLE DimDiretor (
    idDiretor           int PRIMARY KEY,
    nomeDiretor         varchar(45),
    dataNascimento      date,
    dataFalecimento     date
);

CREATE TABLE DimAtor (
    idAtor          int PRIMARY KEY,
    nomeAtor        varchar(100),
    dataNascimento  date,
    dataFalecimento date,
    personagem      varchar(45)
);

CREATE TABLE FatosFilme (
    idFatoFilme         int PRIMARY KEY,
    titulo_principal    varchar(100),
    ano_lancamento      year,
    nota_media          float,
    num_votos           int,
    duracao_min         int,
    idGenero            int,
    idDiretor           int,
    idAtor              int,
    FOREIGN KEY (idGenero) REFERENCES DimGenero(idGenero),
    FOREIGN KEY (idDiretor) REFERENCES DimDiretores(idDiretor),
    FOREIGN KEY (idAtor) REFERENCES DimAtor(idAtor)
);
