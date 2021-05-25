/* VIEW */

CREATE VIEW V_RELATORIO AS 
SELECT 	C.NOME,
 		C.SEXO,
  		C.EMAIL,
   		T.TIPO,
    	T.NUMERO,
     	E.BAIRRO,
      	E.CIDADE,
       	E.ESTADO 
FROM CLIENTE C
INNER JOIN TELEFONE T  
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE;


SELECT * FROM V_RELATORIO;


/* Apagando uma VIEW */

DROP VIEW RELATORIO;


/* Select em views */

SELECT NOME, NUMERO, EMAIL FROM V_RELATORIO;

/* Where em views */

SELECT NOME, NUMERO, EMAIL FROM V_RELATORIO
WHERE SEXO = 'F';

/* Não é possível fazer inserts e deletes em views com Join, somente em views sem Join.
OBS: Updates são permitidos.
*/