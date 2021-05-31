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

-- Ordenando dados

SELECT * FROM funcionarios
ORDER BY nome;

-- Funções de agregação

SELECT COUNT(*),
	   MIN(id),
	   MAX(id),
	   ROUND(AVG(id))
FROM funcionarios;


