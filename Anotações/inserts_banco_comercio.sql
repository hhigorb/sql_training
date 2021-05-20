/* Inserindo valores na tabela CLIENTE */


SHOW DATABASES;

USE COMERCIO;

DESC CLIENTE;

INSERT INTO CLIENTE VALUES (
	NULL, 'JOAO', 'M', 'JOAO@GMAIL.COM', '342323232'
);

INSERT INTO CLIENTE VALUES (
	NULL, 'MARIA', 'F', 'MARIA@GMAIL.COM', '546745455'
);

INSERT INTO CLIENTE VALUES (
	NULL, 'ANA', 'F', 'ANA@GMAIL.COM', '56343342'
);

INSERT INTO CLIENTE VALUES (
	NULL, 'MARIO', 'M', 'MARIO@GMAIL.COM', '453232323'
);

INSERT INTO CLIENTE VALUES (
	NULL, 'PIMENTO', 'M', 'PIMENTO@GMAIL.COM', '5464453'
);

INSERT INTO CLIENTE VALUES (
	NULL, 'PIETRA', 'F', 'PIETRA@GMAIL.COM', '343256675'



SELECT * FROM CLIENTE;


/* Inserindo valores na tabela ENDEREÇO */

INSERT INTO ENDERECO VALUES(
	NULL, 'RUA ANTONIO SA', 'CENTRO', 'BELO HORIZONTE', 'MG', 1
);

INSERT INTO ENDERECO VALUES(
	NULL, 'GILBERTO MORAES', 'SÃO CAETANO', 'SÃO PAULO', 'SP', 2
);


INSERT INTO ENDERECO VALUES(
	NULL, 'RUA CACHORRO QUENTE', 'CENTRO', 'SÃO PAULO', 'SP', 3
);


INSERT INTO ENDERECO VALUES(
	NULL, 'RUA PÃO DE QUEIJO', 'BAIRRO JARDIM PEREIRA', 'SÃO PAULO', 'SP', 4
);


INSERT INTO ENDERECO VALUES(
	NULL, 'RUA MISTO QUENTE', 'CENTRO', 'RIO DE JANEIRO', 'RJ', 5
);


INSERT INTO ENDERECO VALUES(
	NULL, 'RUA MESTRADO', 'Lapa', 'RIO DE JANEIRO', 'RJ', 11
);


/* Inserindo valores na tabela TELEFONE */


INSERT INTO TELEFONE VALUES (
	NULL, 'CELULAR', '234323232', 5
);

INSERT INTO TELEFONE VALUES (
	NULL, 'RESIDENCIAL', '234323232', 5
);

INSERT INTO TELEFONE VALUES (
	NULL, 'RESIDENCIAL', '234323232', 1
);

INSERT INTO TELEFONE VALUES (
	NULL, 'COMERCIAL', '234323232', 5
);

INSERT INTO TELEFONE VALUES (
	NULL, 'COMERCIAL', '234323232', 3
);

INSERT INTO TELEFONE VALUES (
	NULL, 'CELULAR', '234323232', 11
);


SELECT * FROM TELEFONE;