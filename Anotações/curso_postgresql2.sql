/* Curso PostgreSQL pt.2 */

-- Criando as tabelas do banco2

CREATE TABLE aluno(
	id SERIAL,
	nome VARCHAR(255) NOT NULL,
	PRIMARY KEY(id)
);


CREATE TABLE aluno_curso(
	aluno_id SERIAL,
	curso_id SERIAL,
	PRIMARY KEY(aluno_id, curso_id),
	FOREIGN KEY(aluno_id) REFERENCES aluno(id),
	FOREIGN KEY(curso_id) REFERENCES curso(id)
);


CREATE TABLE curso(
	id SERIAL,
	nome VARCHAR(255),
	categoria_id INTEGER NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(categoria_id) REFERENCES categoria(id)
);


CREATE TABLE categoria (
	id SERIAL,
	nome VARCHAR(255) NOT NULL,
	PRIMARY KEY(id)
);

-- Selects pré-prontos

SELECT * FROM aluno;
SELECT * FROM curso;
SELECT * FROM aluno_curso;
SELECT * FROM categoria;

-- Realizando os inserts nas tabelas

INSERT INTO aluno(nome) VALUES('Higor');
INSERT INTO aluno(nome) VALUES('Pedro');
INSERT INTO aluno(nome) VALUES('Maria');
INSERT INTO aluno(nome) VALUES('Clara');
INSERT INTO aluno(nome) VALUES('Bianca');

INSERT INTO categoria(nome) VALUES('Front-End');
INSERT INTO categoria(nome) VALUES('Back-End');
INSERT INTO categoria(nome) VALUES('Data Analytics');

INSERT INTO curso(nome, categoria_id) VALUES('HTML', 1);
INSERT INTO curso(nome, categoria_id) VALUES('CSS', 1);
INSERT INTO curso(nome, categoria_id) VALUES('JavaScript', 1);
INSERT INTO curso(nome, categoria_id) VALUES('Python', 2);
INSERT INTO curso(nome, categoria_id) VALUES('PostgreSQL', 2);
INSERT INTO curso(nome, categoria_id) VALUES('Java', 2);
INSERT INTO curso(nome, categoria_id) VALUES('AWS', 2);
INSERT INTO curso(nome, categoria_id) VALUES('Power BI', 3);

INSERT INTO aluno_curso VALUES(1, 2);
INSERT INTO aluno_curso VALUES(2, 3);
INSERT INTO aluno_curso VALUES(3, 5);
INSERT INTO aluno_curso VALUES(4, 2);
INSERT INTO aluno_curso VALUES(5, 9);
INSERT INTO aluno_curso VALUES(1, 7);


-- Alguns exercícios 

-- 1

SELECT a.nome AS "Nome do Aluno",
	   c.nome AS "Nome do Curso",
	   categ.nome AS "Categoria do Curso" FROM aluno AS "a"
INNER JOIN aluno_curso AS "ac"
ON a.id = ac.aluno_id
INNER JOIN curso AS "c"
ON c.id = ac.curso_id
INNER JOIN categoria AS "categ"
ON c.categoria_id = categ.id

-- 2

SELECT a.nome, 
	   COUNT(c.id) AS "Qtd de Cursos matriculado" 
	   FROM aluno AS "a"
INNER JOIN aluno_curso AS "ac"
ON a.id = ac.aluno_id
INNER JOIN curso AS "c"
ON c.id = ac.curso_id
GROUP BY 1
ORDER BY "Qtd de Cursos matriculado" DESC;


-- 3

SELECT nome, COUNT(ac.curso_id) AS "qtd" FROM aluno AS "a"
INNER JOIN aluno_curso AS "ac"
ON a.id = ac.aluno_id
GROUP BY 1
ORDER BY "qtd" DESC;

-- 4

SELECT c.nome, 
	   COUNT(ac.aluno_id) AS "Qtd de alunos"
FROM curso AS "c"
INNER JOIN aluno_curso AS "ac"
ON c.id = ac.curso_id
GROUP BY c.nome
ORDER BY 2 DESC;

-- 5

SELECT c.nome, COUNT(ac.aluno_id) 
FROM categoria AS "c"
INNER JOIN aluno_curso as "ac"
ON c.id = ac.curso_id
GROUP BY c.nome
ORDER BY 2 DESC;


-- Clausula IN

SELECT * FROM curso
WHERE categoria_id IN (1, 3)

-- Subqueries

SELECT id FROM categoria 
WHERE nome NOT LIKE '% %';

SELECT * FROM curso
WHERE categoria_id IN (SELECT id FROM categoria WHERE nome NOT LIKE '% %');


SELECT categoria, numero_cursos FROM(
	SELECT c.nome AS categoria, COUNT(curso.id) AS numero_cursos FROM categoria AS "c"
	INNER JOIN curso
	ON c.id = curso.categoria_id
	GROUP BY c.nome) AS "categoria_cursos"
WHERE numero_cursos > 3;


/* Funções do PostgreSQL
A melhor forma de conhecer as funções é consultar a documentação do pg
*/

CREATE TABLE teste(
	nome VARCHAR(255),
	nascimento DATE
);

INSERT INTO teste VALUES('Higor', '2000-07-21');
INSERT INTO teste VALUES('Marta', '2003-03-01');
INSERT INTO teste VALUES('Marcia', '1987-02-23');
INSERT INTO teste VALUES('Pedro', '2010-07-17');
INSERT INTO teste VALUES('Carol', '2013-07-10');
INSERT INTO teste VALUES('Iago', '1950-07-11');
INSERT INTO teste VALUES('Larissa', '2015-12-29');
INSERT INTO teste VALUES('Vitor', '2000-03-30');

SELECT * FROM teste;

SELECT nome, EXTRACT(YEAR FROM(AGE(nascimento))) FROM teste;


-- Conversão de tipos

SELECT NOW()::DATE

SELECT TO_CHAR(NOW(), 'DD/MM/YYYY')


-- Views

CREATE VIEW view_teste AS
SELECT nome, EXTRACT(YEAR FROM(AGE(nascimento))) FROM teste;

SELECT * FROM view_teste;

SELECT * FROM view_teste
WHERE nome = 'Higor';