/* Exercício 3 - Relatório geral de todos os clientes */


/* Relatório Geral */


DESC CLIENTE;
DESC ENDERECO;
DESC TELEFONE;

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

/* Relatório de homens */


SELECT C.NOME, C.SEXO, C.EMAIL, E.RUA, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'M';



/* Relatório de mulheres */


SELECT C.NOME, C.SEXO, C.EMAIL, E.RUA, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO FROM CLIENTE C 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';


/* Quantidade de homens e mulheres */


SELECT SEXO, COUNT(*) AS 'Quantidade de Registros' FROM CLIENTE 
GROUP BY SEXO;


/* IDS e email das mulheres que morem no centro do RJ e não tenham celular */

SELECT C.IDCLIENTE, C.SEXO, C.EMAIL, E.BAIRRO, E.CIDADE, T.TIPO FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' AND E.BAIRRO = 'CENTRO' AND E.CIDADE LIKE 'RIO%' AND T.TIPO != 'CELULAR'; 


/* Para uma campanha de marketing, o setor solicitou um relatório com o nome, email, e telefone celular dos clientes que moram no estado
 do Rio de Janeiro. Você terá que passar a query para gerar o relatório para o programador */


SELECT C.NOME, C.EMAIL, T.TIPO, T.NUMERO, E.ESTADO FROM CLIENTE C
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE T.TIPO = 'CELULAR' AND E.ESTADO = 'RJ';


 /* Para uma campanha de produtos de bekeza, o comercial solicitou um relatório com o nome, email, e telefone celular das mulheres que moram no estado
 de São Paulo. Você terá que passar a query para gerar o relatório para o programador*/ 


SELECT C.NOME, C.EMAIL, T.TIPO, T.NUMERO, E.ESTADO FROM CLIENTE C
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE C.SEXO = 'F' AND T.TIPO = 'CELULAR' AND E.ESTADO = 'SP';
