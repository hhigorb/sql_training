/* Crie, no seu banco de dados, a tabela abaixo, insira os valores apresentados e em
seguida escreva as consultas solicitadas abaixo.
OBS: Os valores em branco devem ser nulos no banco de dados.
*/

-- Inserts na tabela
INSERT INTO ex."Produto" VALUES(1, 1, 1, 25.00, 10, 5);
INSERT INTO ex."Produto" VALUES(1, 2, 2, 13.50, 3, NULL);
INSERT INTO ex."Produto" VALUES(1, 3, 3, 15.00, 2, NULL);
INSERT INTO ex."Produto" VALUES(1, 4, 4, 10.00, 1, NULL);
INSERT INTO ex."Produto" VALUES(1, 5, 5, 30.00, 1, NULL);
INSERT INTO ex."Produto" VALUES(2, 1, 3, 15.00, 4, NULL);
INSERT INTO ex."Produto" VALUES(2, 2, 4, 10.00, 5, NULL);
INSERT INTO ex."Produto" VALUES(2, 3, 5, 30.00, 7, NULL);
INSERT INTO ex."Produto" VALUES(3, 1, 1, 25.00, 5, NULL);
INSERT INTO ex."Produto" VALUES(3, 2, 4, 10.00, 4, NULL);
INSERT INTO ex."Produto" VALUES(3, 3, 5, 30.00, 5, NULL);
INSERT INTO ex."Produto" VALUES(3, 4, 2, 13.50, 7, NULL);
INSERT INTO ex."Produto" VALUES(4, 1, 5, 30.00, 10, 15);
INSERT INTO ex."Produto" VALUES(4, 2, 4, 10.00, 12, 5);
INSERT INTO ex."Produto" VALUES(4, 3, 1, 25.00, 13, 5);
INSERT INTO ex."Produto" VALUES(4, 4, 2, 13.50, 15, 5);
INSERT INTO ex."Produto" VALUES(5, 1, 3, 15.00, 3, NULL);
INSERT INTO ex."Produto" VALUES(5, 2, 5, 30.00, 6, NULL);
INSERT INTO ex."Produto" VALUES(6, 3, 1, 25.00, 22, 15);
INSERT INTO ex."Produto" VALUES(6, 4, 3, 15.00, 25, 20);
INSERT INTO ex."Produto" VALUES(7, 1, 1, 25.00, 10, 3);
INSERT INTO ex."Produto" VALUES(7, 2, 2, 13.50, 10, 4);
INSERT INTO ex."Produto" VALUES(7, 3, 3, 15.00, 10, 4);ss
INSERT INTO ex."Produto" VALUES(7, 4, 5, 30.00, 10, 1);

-- Exercícios

/* Pesquise os itens que foram vendidos sem desconto. As colunas presentes no
resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.
*/

SELECT "ID_NF", "ID_ITEM", "COD_PROD", "VALOR_UNIT" FROM ex."Produto"
WHERE "DESCONTO" IS NULL;


/* Pesquise os itens que foram vendidos com desconto. As colunas presentes no
resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR
VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT -
(VALOR_UNIT*(DESCONTO/100)). */

SELECT "ID_NF", "ID_ITEM", "COD_PROD", "VALOR_UNIT", ("VALOR_UNIT" - ("VALOR_UNIT") * ("DESCONTO" / 100)) AS "VALOR VENDIDO"
FROM ex."Produto"
WHERE "DESCONTO" IS NOT NULL;

/* Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo */

UPDATE ex."Produto"
SET "DESCONTO (%)" = 0
WHERE "DESCONTO (%)" IS NULL;

SELECT * FROM ex."Produto";

/* Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta
são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO,
VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE *
VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT -
(VALOR_UNIT*(DESCONTO/100)). */

SELECT "ID_NF", "ID_ITEM", "COD_PROD", "VALOR_UNIT", "DESCONTO",
("VALOR_UNIT" - ("VALOR_UNIT"*("DESCONTO"/100))) AS "VALOR_VENDIDO", ("VALOR_UNIT" * "QUANTIDADE") AS "VALOR_TOTAL"
FROM ex."Produto";


/* Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As
colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS: O 
VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o
resultado da consulta por ID_NF. */

SELECT "ID_NF", SUM(("VALOR_UNIT" * "QUANTIDADE")) AS "VALOR_TOTAL" FROM ex."Produto"
GROUP BY "ID_NF"
ORDER BY "VALOR_TOTAL" DESC;


/* Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As
colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS: O
VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O
VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). Agrupe
o resultado da consulta por ID_NF. */


SELECT "ID_NF", SUM(("VALOR_UNIT" - ("VALOR_UNIT"*("DESCONTO"/100)))) AS "VALOR_VENDIDO",
SUM(("QUANTIDADE" * "VALOR_UNIT")) AS "VALOR_TOTAL" FROM ex."Produto"
GROUP BY "ID_NF"
ORDER BY "VALOR_VENDIDO" DESC;


/* Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da
consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por
COD_PROD. */

SELECT "COD_PROD", SUM("QUANTIDADE") AS "QTD VENDAS" FROM ex."Produto"
GROUP BY "COD_PROD"
ORDER BY 2 DESC;


/* Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto.
As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE.
Agrupe o resultado da consulta por ID_NF, COD_PROD. */


SELECT "ID_NF", "COD_PROD", SUM("QUANTIDADE") AS "QTD VENDIDA" FROM ex."Produto"
WHERE "QUANTIDADE" > 10
GROUP BY "ID_NF", "COD_PROD";


/* Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o
resultado do maior valor para o menor. As colunas presentes no resultado da consulta
são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE
* VALOR_UNIT. Agrupe o resultado da consulta por ID_NF. */

SELECT "ID_NF", SUM(("QUANTIDADE" * "VALOR_UNIT")) AS "VALOR_TOTAL" FROM ex."Produto"
GROUP BY "ID_NF"
HAVING SUM("QUANTIDADE" * "VALOR_UNIT") > 500
ORDER BY "VALOR_TOTAL" DESC;


/* Qual o valor médio dos descontos dados por produto. As colunas presentes no
resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por
COD_PROD. */

SELECT "COD_PROD", TRUNC(AVG("DESCONTO"), 2) AS "MÉDIA DE DESCONTO" FROM ex."Produto"
GROUP BY "COD_PROD"


/* Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas
presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe
o resultado da consulta por COD_PROD. */


SELECT "COD_PROD", MIN("DESCONTO"), MAX("DESCONTO"), TRUNC(AVG("DESCONTO"), 2) FROM ex."Produto"
GROUP BY "COD_PROD"


/* Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado
da consulta são: ID_NF, QTD_ITENS. OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE
VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o
resultado da consulta por ID_NF. */


SELECT "ID_NF", SUM("QUANTIDADE") as "QTD_VENDIDA" FROM ex."Produto"
GROUP BY "ID_NF"


