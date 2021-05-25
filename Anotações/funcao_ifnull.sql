SELECT NOME,
	SEXO,
	IFNULL(EMAIL, 'Valor não informado.') AS "EMAIL", 
	CPF, 
	IFNULL(TELEFONE, 'Valor não informado') AS "TELEFONE"
FROM CLIENTE;