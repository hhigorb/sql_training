
-- WITH

-- Esse comando funciona igual uma subquery, mas com ele a query fica mais legível e fácil de realizar manutenções

WITH tabela1 AS (
  SELECT 
    COUNT(DISTINCT customer_id) AS qtd_compradores,
    DATE(created_at) AS data_compra
  FROM 
    `cobalt-nomad-322417.ecommerce.orders`
  GROUP BY 
    2
),

tabela2 AS (
  SELECT 
    COUNT(DISTINCT id) AS compras,
    DATE(created_at) AS data_compra
  FROM 
    `cobalt-nomad-322417.ecommerce.orders`
  GROUP BY 
    2
)

SELECT 
  qtd_compradores,
  compras,
  tabela1.data_compra
FROM 
  tabela1
JOIN
  tabela2
ON 
  tabela1.data_compra = tabela2.data_compra
WHERE 
  tabela1.data_compra BETWEEN '2020-01-01' AND '2020-01-31'
ORDER BY 
  3 ASC
