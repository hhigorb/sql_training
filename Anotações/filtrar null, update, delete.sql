/* Filtrando valores nulos */

SELECT * FROM CLIENTE
WHERE CPF IS NULL;

SELECT * FROM CLIENTE
WHERE CPF IS NOT NULL;



/* Utilizando o update para atualizar valores */


SELECT NOME, EMAIL FROM CLIENTE;


UPDATE CLIENTE
SET EMAIL = 'LILIAN@GMAIL.COM'
WHERE NOME = 'LILIAN';


/* Utilizando o delete para deletar valores */


DELETE FROM CLIENTE
WHERE NOME = 'PEDRO';