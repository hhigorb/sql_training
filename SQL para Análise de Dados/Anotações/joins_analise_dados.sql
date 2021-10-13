-- JOINS

-- Join ou Inner Join

SELECT 
  DISTINCT
  a.user_id AS user_id_tabela_a,
  c.user_id AS user_id_tabela_c,
  a.user_name
FROM
  `cobalt-nomad-322417.banco_teste.compras` c
INNER JOIN 
  `cobalt-nomad-322417.banco_teste.acessos` a
ON 
  c.user_id = a.user_id


-- LEFT JOIN 

SELECT 
  a.user_id,
  c.user_id,
  a.user_name,
  c.price
FROM 
  `cobalt-nomad-322417.banco_teste.acessos` a
LEFT JOIN 
  `cobalt-nomad-322417.banco_teste.compras` c
ON 
  a.user_id = c.user_id


-- RIGHT JOIN 


SELECT 
  a.user_id AS user_id_tabela_a,
  c.user_id AS user_id_tabela_b,
  a.user_name,
  c.price,
  a.type
FROM 
  `cobalt-nomad-322417.banco_teste.acessos` a 
RIGHT JOIN 
  `cobalt-nomad-322417.banco_teste.compras` c
ON
  a.user_id = c.user_id
  

-- FULL JOIN


SELECT 
  a.user_id AS user_id_tabela_a,
  c.user_id AS user_id_tabela_b,
  a.user_name AS user_name_tabela_a,
  c.user_name AS user_name_tabela_b,
  c.price,
  a.type
FROM 
  `cobalt-nomad-322417.banco_teste.acessos` a 
FULL JOIN 
  `cobalt-nomad-322417.banco_teste.compras` c
ON
  a.user_id = c.user_id