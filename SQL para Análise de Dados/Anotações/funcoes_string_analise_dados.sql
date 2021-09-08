-- Funções de String

-- CONCAT

SELECT 
  CONCAT(first_name, ' ', last_name) AS nome_completo
FROM `cobalt-nomad-322417.ecommerce.customers`


-- STARTS_WITH

SELECT
  STARTS_WITH('Metallica', 'Met')


SELECT 
  id,
  first_name
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
WHERE STARTS_WITH(first_name, 'Ma') IS TRUE


-- LOWER

SELECT 
  COUNT(*)
FROM 
  `cobalt-nomad-322417.ecommerce.exemplo_estados`
WHERE
  LOWER(estado) = 'são paulo'


-- UPPER

SELECT 
  UPPER(estado)
FROM 
  `cobalt-nomad-322417.ecommerce.exemplo_estados`


SELECT 
  *
FROM 
  `cobalt-nomad-322417.ecommerce.exemplo_estados`
WHERE 
  UPPER(estado) = 'SÃO PAULO'


-- SPLIT

SELECT 
  SPLIT('TESTANDO O SPLIT', ' ')


SELECT 
  SPLIT('TESTANDO O SPLIT', ' ')[ORDINAL(1)],
  SPLIT('TESTANDO O SPLIT', ' ')[ORDINAL(2)],
  SPLIT('TESTANDO O SPLIT', ' ')[ORDINAL(3)]


SELECT 
  email,
  SPLIT(email, '@')[ORDINAL(2)]
FROM 
  `cobalt-nomad-322417.ecommerce.customers`


-- TRIM

SELECT 
  TRIM('CPF: 123.456.789-00', 'CPF: '),
  TRIM('***(19) 992321232***', '*'),
  TRIM('   SÃO PAULO   ')


-- REPLACE

SELECT 
  *,
  REPLACE(name, ' e ', ' & ')
FROM 
  `cobalt-nomad-322417.ecommerce.categories`


-- CHAR_LENGTH

SELECT 
  DISTINCT status,
  CHAR_LENGTH(status)
FROM 
  `cobalt-nomad-322417.ecommerce.orders`
