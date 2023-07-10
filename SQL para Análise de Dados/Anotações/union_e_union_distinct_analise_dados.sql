-- Union All e Union Distinct 

-- Union All une todos os registros das tabelas/consultas que estão entre ele. Em ambos unions, a ordem das colunas devem ser as mesmas, inclusive os tipos de dados das colunas

SELECT 
  id,
  first_name,
  last_name
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
WHERE
  id BETWEEN 1 AND 5
UNION ALL 
SELECT 
  id,
  first_name,
  last_name
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
WHERE
  id BETWEEN 4 AND 5
ORDER BY 
  id

-- Union Distinct faz a mesma coisa do Union All, mas remove os valores duplicados entre as tabelas/consultas

SELECT 
  id,
  first_name,
  last_name
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
WHERE
  id BETWEEN 1 AND 5
UNION DISTINCT 
SELECT 
  id,
  first_name,
  last_name
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
WHERE
  id BETWEEN 4 AND 5
ORDER BY 
  id


