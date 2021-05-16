/* Operadores Lógicos */

/*
OR -> Verdadeiro se uma condição for TRUE
AND -> Verdadeiro se ambas as condições forem TRUE
*/

/* OR */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'F' OR ENDERECO LIKE '%JANEIRO';

/* AND */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'M' AND ENDERECO LIKE '%JANEIRO';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'F' AND ENDERECO LIKE '%RJ';


/* COUNT(*), GROUP BY */

/* Contando os registros de uma tabela */

SELECT COUNT(*) AS 'Quantidade de Registros' FROM CLIENTE;

SELECT SEXO, COUNT(*) AS 'Quantidade de Registros' FROM CLIENTE
GROUP BY SEXO;