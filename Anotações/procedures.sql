/* STORED PROCEDURES */

-- Mudando o delimitador

DELIMITER $

STATUS

-- Criando a procedure

CREATE PROCEDURE NOME_EMPRESA()
BEGIN 

	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;

END
$


-- Chamando uma procedure

CALL NOME_EMPRESA$

-- Deletando uma procedure

DROP PROCEDURE NOME_EMPRESA;


-- Procedures com parâmetros

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN

	SELECT NUMERO1 + NUMERO2 AS 'CONTA';

END
$

CALL CONTA(100, 50)$