/* Curso PostgreSQL pt.1 */

-- Criando tabelas

CREATE TABLE aluno(
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10, 2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE, 
	hora_aula TIME,
	matriculado_em TIMESTAMP
);

-- Utilizando o SELECT

SELECT * FROM aluno;
SELECT nome FROM aluno;
SELECT nome, idade FROM aluno;
SELECT nome AS "Nome do Aluno", idade AS "Idade do Aluno" FROM aluno;

-- Inserindo valores na tabela

INSERT INTO aluno(
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
)
VALUES('Higor', '1212121212', 'lorem ipsum', 20, 1500.00, 1.85, True, '2000-07-21', '07:00:00', '2021-06-01 20:00:00')


-- Utilizando o UPDATE

SELECT * FROM aluno
WHERE id = 1;

UPDATE aluno
SET dinheiro = 5000.00
WHERE id = 1;

-- Utilizando o DELETE

SELECT * from ALUNO
WHERE nome = 'Higor';

DELETE FROM aluno
WHERE nome = 'Higor';

-- Utilizando filtros WHERE e LIKE

INSERT INTO aluno(nome) VALUES('Pedro');
INSERT INTO aluno(nome) VALUES('Marcos');
INSERT INTO aluno(nome) VALUES('Marcia');

SELECT * FROM aluno
WHERE nome = 'Higor';

SELECT * FROM aluno
WHERE nome != 'Higor';

SELECT * FROM aluno
WHERE nome LIKE '%i%';

SELECT * FROM aluno
WHERE nome LIKE '_i%';

SELECT * FROM aluno
WHERE nome LIKE 'M%';


-- Filtrando valores NULL

SELECT * FROM aluno
WHERE cpf IS NULL;

-- Operadores AND/OR

SELECT * FROM aluno
WHERE nome = 'Higor' OR nome = 'Marcos';

SELECT * FROM aluno
WHERE nome = 'Marcia' AND cpf IS NULL;


-- Chave primária (chaves primárias identificam cada valor de uma tabela. Ela deve ser única e não pode ser nula)

CREATE TABLE curso(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255)
);

INSERT INTO curso VALUES(1, 'HTML');
INSERT INTO curso VALUES(2, 'JavaScript');

-- Chave estrangeira (Os valores da coluna devem corresponder aos valores de alguma coluna de outra tabela)

DROP TABLE aluno;

CREATE TABLE aluno(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO aluno(nome) VALUES('Higor');
INSERT INTO aluno(nome) VALUES('Pedro');

SELECT * FROM aluno;
SELECT * FROM curso;


CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY(aluno_id, curso_id),
	FOREIGN KEY(aluno_id) REFERENCES aluno(id),
	FOREIGN KEY(curso_id) REFERENCES curso(id)
);

INSERT INTO aluno_curso VALUES(1, 1);
INSERT INTO aluno_curso VALUES(1, 2);
INSERT INTO aluno_curso VALUES(2, 2);


INSERT INTO aluno_curso VALUES(1, 1);
INSERT INTO aluno_curso VALUES(2, 2);
INSERT INTO aluno_curso VALUES(3, 3);

SELECT * FROM aluno_curso;


-- INNER JOIN (Juntar tabelas onde a chave estrangeira e a chave primária das tabelas estejam relacionadas)


SELECT a.nome, c.nome FROM aluno AS "a"
INNER JOIN aluno_curso AS "ac"
ON a.id = ac.aluno_id
INNER JOIN curso AS "c"
ON c.id = ac.curso_id;

-- LEFT JOIN (Prioriza os dados da tabela da esquerda, antes do FROM)

INSERT INTO aluno(nome) VALUES('Marta');

SELECT a.nome, c.nome FROM aluno AS "a"
LEFT JOIN aluno_curso AS "ac"
ON a.id = ac.aluno_id
LEFT JOIN curso AS "c"
ON c.id = ac.curso_id;

-- RIGHT JOIN (Prioriza os dados da tabela da direita, depois do FROM)

INSERT INTO curso VALUES(3, 'Python');

SELECT a.nome, c.nome FROM aluno AS "a"
RIGHT JOIN aluno_curso AS "ac"
ON a.id = ac.aluno_id
RIGHT JOIN curso AS "c"
ON c.id = ac.curso_id;


-- FULL JOIN (Irá trazer todos os dados, independente se houver null em alguma tabela)

SELECT a.nome, c.nome FROM aluno AS "a"
FULL JOIN aluno_curso AS "ac"
ON a.id = ac.aluno_id
FULL JOIN curso AS "c"
ON c.id = ac.curso_id;


-- CROSS JOIN (Multiplica todos os valores da tabela de origem e estrangeira)

SELECT a.nome, c.nome FROM aluno AS "a"
CROSS JOIN curso as "c";


/* DELETE CASCADE (caso queira deletar a tabela e ela tiver relacionada com outras, não será possível. Então na criação da
tabela, utiliza-se o DELETE CASCADE) */

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY(aluno_id, curso_id),
	FOREIGN KEY(aluno_id) REFERENCES aluno(id) 
	ON DELETE CASCADE,
	FOREIGN KEY(curso_id) REFERENCES curso(id)
);

DELETE FROM aluno
WHERE id = 1;


-- UPDATE CASCADE (funciona da mesma forma do DELETE CASCADE)

UPDATE aluno
SET id = 10
WHERE id = 2;

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY(aluno_id, curso_id),
	FOREIGN KEY(aluno_id) REFERENCES aluno(id) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
	FOREIGN KEY(curso_id) REFERENCES curso(id)
);

SELECT * FROM aluno;


-- Ordenação dos dados

CREATE TABLE funcionarios(
	id SERIAL PRIMARY KEY,
	matricula VARCHAR(10),
	nome VARCHAR(255),
	sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M001', 'Higor', 'Henrique');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M002', 'Maria', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M003', 'Pedro', 'Freitas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M004', 'Carla', 'Maria');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M005', 'Bianca', 'Teixeira');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M006', 'Marcio', 'Pierro');

-- Ordenando dados (ORDER BY)

SELECT * FROM funcionarios
ORDER BY nome;

-- Funções de agregação

SELECT COUNT(*),
	   MIN(id),
	   MAX(id),
	   ROUND(AVG(id))
FROM funcionarios;


-- Agrupando consultas (GROUP BY)


CREATE TABLE torcedores(
	id SERIAL,
	nome VARCHAR(255),
	time VARCHAR(255),
	PRIMARY KEY(id)
);

INSERT INTO torcedores(nome, time) VALUES('Higor', 'São Paulo');
INSERT INTO torcedores(nome, time) VALUES('Maria', 'São Paulo');
INSERT INTO torcedores(nome, time) VALUES('Carla', 'São Paulo');
INSERT INTO torcedores(nome, time) VALUES('Pietra', 'Corinthians');
INSERT INTO torcedores(nome, time) VALUES('Rogério', 'Corinthians');
INSERT INTO torcedores(nome, time) VALUES('Marcos', 'Palmeiras');
INSERT INTO torcedores(nome, time) VALUES('Ana', 'Botafogo');

SELECT * FROM torcedores;

SELECT COUNT(nome), time FROM torcedores
GROUP BY time;

-- Filtrando agrupamentos (HAVING)

SELECT curso.nome, SUM(aluno.id) FROM curso
RIGHT JOIN aluno_curso
ON curso.id = aluno_curso.aluno_id
RIGHT JOIN aluno
ON aluno_curso.aluno_id = aluno.id
GROUP BY curso.nome
HAVING COUNT(aluno.id) > 10;

SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;


