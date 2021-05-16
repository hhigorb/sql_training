/* EXERCÍCIO 1 */


/* Criando a Tabela */

CREATE TABLE LIVROS (
	Nome_do_Livro VARCHAR(50),
	Nome_do_Autor VARCHAR(50),
	Sexo_do_Autor CHAR(1),
	Número_de_Páginas INT(4),
	Nome_da_Editora VARCHAR(50),
	Valor_do_Livro FLOAT(5),
	Estado_da_Editora CHAR(2),
	Ano_de_Publicação CHAR(4)
);


/* Inserindo os valores */

INSERT INTO LIVROS VALUES (
	'Cavaleiro Real', 'Ana Claudia', 'F', 465, 'Atlas', 49.9, 'RJ', 2009
);


INSERT INTO LIVROS VALUES (
'SQL para Leigos', 'João Nunes', 'M', 450, 'Addison', 98, 'SP', 2018
);

INSERT INTO LIVROS VALUES (
'Receitas Caseiras', 'Celia Tavares', 'F', 210, 'Atlas', 45, 'RJ', 2008
);

INSERT INTO LIVROS VALUES (
'Pessoas Efetivas', 'Eduardo Santos', 'M', 390, 'Beta', 78.99, 'RJ', 2018
);

INSERT INTO LIVROS VALUES (
'Hábitos Saudáveis', 'Eduardo Santos', 'M', 630, 'Beta', 150.98, 'RJ', 2019
);

INSERT INTO LIVROS VALUES (
'A Casa Marrom', 'Hermes Macedo', 'M', 250, 'Bubba', 60, 'MG', 2016
);

INSERT INTO LIVROS VALUES (
'Estacio Querido', 'Geraldo Francisco', 'M', 310, 'Insignia', 100, 'ES', 2015
);

INSERT INTO LIVROS VALUES (
'Pra sempre amigas', 'Leda Silva', 'F', 510, 'Insignia', 78.98, 'ES', 2011
);


INSERT INTO LIVROS VALUES (
'Copas Inesquecíveis', 'Marco Alcantara', 'M', 200, 'Larson', 130.98, 'RS', 2018
);

INSERT INTO LIVROS VALUES (
'O poder da mente', 'Clara Mafra', 'F', 120, 'Continental', 756.58, 'SP', 2017
);


/* Trazer todos os dados */

SELECT * FROM LIVROS;

/* Trazer o nome do livro e o nome da editora */

SELECT NOME_DO_LIVRO, NOME_DA_EDITORA FROM LIVROS;

/* Trazer o nome do livro e a uf dos livros publicados por autores do sexo masculino */

SELECT NOME_DO_LIVRO, ESTADO_DA_EDITORA FROM LIVROS
WHERE SEXO_DO_AUTOR = 'M';

/* Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino*/

SELECT NOME_DO_LIVRO, NÚMERO_DE_PÁGINAS FROM LIVROS
WHERE SEXO_DO_AUTOR = 'F';

/* Trazer os valores dos livros das editoras de são paulo */

SELECT VALOR_DO_LIVRO FROM LIVROS
WHERE ESTADO_DA_EDITORA = 'SP';

/* Trazer os dados dos autores do sexo masculino que tiveram os livros publicados por São Paulo ou Rio de Janeiro */

SELECT * FROM LIVROS 
WHERE SEXO_DO_AUTOR = 'M' AND (ESTADO_DA_EDITORA = 'SP' OR ESTADO_DA_EDITORA = 'RJ');
