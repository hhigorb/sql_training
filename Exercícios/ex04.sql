/* Crie uma instrução SQL que retorne a média de idade, número de filhos e grau de instrução dos funcionários cujo salário hora estiver acima da
média de todos os funcionários.

Retorne os dados somente dos funcionários da capital e estado civil casado, com ordem decrescente da média de idade. */

SELECT * FROM curso."TB_FUNCIONARIO";

SELECT ROUND(AVG("IDADE")), "NUMERO_FILHOS", "GRAU_INSTRUCAO" from curso."TB_FUNCIONARIO"
WHERE "REG_PROCEDENCIA" = 'capital' AND "ESTADO_CIVIL" = 'casado'
AND "SALARIO_HORA" > (SELECT AVG("SALARIO_HORA") FROM curso."TB_FUNCIONARIO")
GROUP BY "NUMERO_FILHOS", "GRAU_INSTRUCAO"
ORDER BY ROUND(AVG("IDADE")) DESC