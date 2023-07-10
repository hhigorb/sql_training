-- Subquery

-- Subquery como coluna

SELECT 
  id, 
  user_name,
  (
    SELECT 
      COUNT(compras.id)
    FROM 
      `cobalt-nomad-322417.banco_teste.compras` AS compras
    WHERE 
      compras.user_id = usuarios.id
  ) AS qtd_compras
FROM 
  `cobalt-nomad-322417.banco_teste.usuarios` AS usuarios

-- Subquery como tabela

SELECT 
  AVG(qtd_acessos)
FROM (
  SELECT 
    COUNT(acessos.id) AS qtd_acessos,
    usuarios.id
  FROM 
    `cobalt-nomad-322417.banco_teste.usuarios` AS usuarios
  LEFT JOIN  
    `cobalt-nomad-322417.banco_teste.acessos` AS acessos
  ON 
    usuarios.id = acessos.user_id
  GROUP BY 
    2
  )

-- Subquery como filtro

SELECT 
  id, 
  user_name,
  (
    SELECT 
      COUNT(compras.id)
    FROM 
      `cobalt-nomad-322417.banco_teste.compras` AS compras
    WHERE 
      compras.user_id = usuarios.id
  ) AS qtd_compras
FROM 
  `cobalt-nomad-322417.banco_teste.usuarios` AS usuarios
WHERE 
  (
    SELECT 
      COUNT(compras.id)
    FROM 
      `cobalt-nomad-322417.banco_teste.compras` AS compras
    WHERE 
      compras.user_id = usuarios.id
  ) > 0

-- Utilizando as 3 formas

SELECT 
  id, 
  user_name,
  (
    SELECT 
      COUNT(compras.id)
    FROM 
      `cobalt-nomad-322417.banco_teste.compras` AS compras
    WHERE 
      compras.user_id = usuarios.id
  ) AS qtd_compras
FROM 
  `cobalt-nomad-322417.banco_teste.usuarios` AS usuarios
LEFT JOIN 
  (
    SELECT 
      COUNT(acessos.id) AS qtd_acessos,
      user_id
    FROM
      `cobalt-nomad-322417.banco_teste.acessos` AS acessos
    GROUP BY 
      2
  ) AS subquery
  ON 
    subquery.user_id = usuarios.id
WHERE 
  (
    SELECT 
      COUNT(compras.id)
    FROM 
      `cobalt-nomad-322417.banco_teste.compras` AS compras
    WHERE 
      compras.user_id = usuarios.id
  ) > 0
