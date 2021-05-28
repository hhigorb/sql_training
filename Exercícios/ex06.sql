/*
SQL – Lista de Exercícios

Instruções:

Enviar o relatório com as consultas efetuadas (pode ser individual ou em dupla) até o dia 12 de julho de 2010.
Suponha a existência do banco de dados relacional “Mundo” que tem as seguintes tabelas:
Pais(Nome: varchar(35), Continente: varchar(35), Pop: real, PIB: real, Expec_vida: real)
Cidade(Nome: varchar(35), Pais: varchar(35), Pop: real, Capital: varchar(1))
Rio(Nome: varchar(35), Origem: varchar(35), Comprimento: integer) */

CREATE DATABASE MUNDO;
USE MUNDO;

CREATE TABLE PAIS(
	ID_PAIS INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) UNIQUE,
	CONTINENTE VARCHAR(30),
	POP_EM_MILHOES FLOAT(10, 2),
	PIB_BILHOES FLOAT(10, 2),
	EXPEC_VIDA FLOAT(10, 2)
);


 CREATE TABLE CIDADE(
 	ID_CIDADE INT PRIMARY KEY AUTO_INCREMENT,
 	NOME VARCHAR(30),
 	FK_PAIS VARCHAR(30),
 	POP_EM_MILHOES FLOAT (10, 2),
 	CAPITAL ENUM('S', 'N'),
 	FOREIGN KEY (FK_PAIS)
 	REFERENCES PAIS(NOME)
 );


 CREATE TABLE RIO(
 	ID_RIO INT PRIMARY KEY AUTO_INCREMENT,
 	NOME VARCHAR(30),
 	NASCENTE VARCHAR(10),
 	FK_PAIS VARCHAR(30),
 	COMPRIMENTO FLOAT(10, 2),
 	FOREIGN KEY (FK_PAIS)
 	REFERENCES PAIS(NOME)
 );


 -- INSERTS


INSERT INTO PAIS VALUES(NULL, 'CANADÁ', "AM. NORTE", 30.1, 658, 77.08);
INSERT INTO PAIS VALUES(NULL, 'MÉXICO', "AM. NORTE", 107.5, 694, 69.1);
INSERT INTO PAIS VALUES(NULL, 'BRASIL', "AM. SUL", 183.3, 10004, 62.2);
INSERT INTO PAIS VALUES(NULL, 'USA', "AM. NORTE", 270.0, 8003, 75.5);


INSERT INTO CIDADE VALUES(NULL, 'WASHINGTON', 'USA', 3.3, 'S');
INSERT INTO CIDADE VALUES(NULL, 'MONTERREY', 'MÉXICO', 2.0, 'N');
INSERT INTO CIDADE VALUES(NULL, 'BRASILIA', 'BRASIL', 1.5, 'S');
INSERT INTO CIDADE VALUES(NULL, 'SÃO PAULO', 'BRASIL', 15.0, 'N');
INSERT INTO CIDADE VALUES(NULL, 'OTTAWA', 'CANADÁ', 0.8, 'S');
INSERT INTO CIDADE VALUES(NULL, 'CID. MÉXICO', 'MÉXICO', 14.1, 'S');


INSERT INTO RIO VALUES(NULL, 'ST. LAWRENCE', 'USA', 'USA', 3.3);
INSERT INTO RIO VALUES(NULL, 'GRANDE', 'USA', 'MÉXICO', 2.0);
INSERT INTO RIO VALUES(NULL, 'PARANA', 'BRASIL', 'BRASIL', 1.5);
INSERT INTO RIO VALUES(NULL, 'MISSISSIPI', 'USA', 'USA', 15.0);


-- Exercícios

-- Liste todas as cidades e os países aos quais pertencem.

SELECT NOME, FK_PAIS FROM CIDADE;

-- Liste todas as cidades que são capitais. 

SELECT NOME, FK_PAIS FROM CIDADE 
WHERE CAPITAL = 'S';

-- Liste todos os atributos dos países onde a expectativa de vida é menor que 70 anos. 

SELECT * FROM PAIS
WHERE EXPEC_VIDA > 70;

-- 4. Liste todas as capitais e as populações dos países cujos PIB é maior que 1 trilhão de dólares. 

SELECT NOME, CONTINENTE, POP_EM_MILHOES FROM PAIS 
WHERE PIB_BILHOES > 10000;

-- Quais é o nome e a população da capital do país onde o rio St. Lawrence tem sua nascente. 

SELECT P.NOME, P.POP_EM_MILHOES, C.NOME, R.NOME FROM PAIS P
INNER JOIN CIDADE C
ON P.NOME = C.FK_PAIS
INNER JOIN RIO R
ON P.NOME = R.FK_PAIS
WHERE R.NOME = "St. Lawrence";


-- Qual é a média da população das cidades que não são capitais. 

SELECT AVG(POP_EM_MILHOES) AS "MÉDIA DE POPULAÇÃO" FROM CIDADE
WHERE CAPITAL = 'N';

-- Para cada continente retorne o PIB médio de seus países.

SELECT CONTINENTE, TRUNCATE(AVG(PIB_BILHOES), 2) FROM PAIS 
GROUP BY CONTINENTE;

-- Liste os países cujo PIB é maior que o PIB do Canada

SELECT NOME, PIB_BILHOES FROM PAIS 
WHERE PIB_BILHOES > (SELECT PIB_BILHOES FROM PAIS WHERE NOME = "CANADÁ");