-- Funções de Agregação

-- COUNT

SELECT 
  COUNT(*) AS numero_linhas
FROM 
  `cobalt-nomad-322417.ecommerce.customers`


SELECT 
  COUNT(DISTINCT status) AS status_distintos
FROM `cobalt-nomad-322417.ecommerce.orders`


SELECT 
  COUNT(id) AS numero_pedidos,
  FORMAT_TIMESTAMP('%Y/%m', created_at) AS mes
FROM 
  `cobalt-nomad-322417.ecommerce.orders`
GROUP BY 
  2
ORDER BY 
  2


SELECT 
  COUNT(id) AS numero_cadastrados,
  FORMAT_TIMESTAMP('%Y', created_at) AS ano
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
GROUP BY 
  2
ORDER BY 
  2


SELECT 
  COUNT(CASE WHEN state = 'Acre' THEN id END) AS numero_cadastrados_acre,
  FORMAT_TIMESTAMP('%Y', created_at) AS ano
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
GROUP BY 
  2
ORDER BY 
  2


-- MAX

SELECT 
  MAX(price) AS preco_maximo
FROM
  `cobalt-nomad-322417.ecommerce.products`


SELECT 
  MAX(p.price) AS preco_maximo,
  c.name
FROM
  `cobalt-nomad-322417.ecommerce.products` AS p
INNER JOIN 
  `cobalt-nomad-322417.ecommerce.categories` AS c
ON 
  c.id = p.category_id
GROUP BY 
  2


SELECT 
  MAX(created_at) AS ultima_compra_em,
  customer_id
FROM 
  `cobalt-nomad-322417.ecommerce.orders`
GROUP BY 
  customer_id


-- MIN

SELECT 
  MIN(price) AS preco_minimo
FROM
  `cobalt-nomad-322417.ecommerce.products`


SELECT 
  MIN(p.price) AS preco_minimo,
  c.name
FROM
  `cobalt-nomad-322417.ecommerce.products` AS p
INNER JOIN 
  `cobalt-nomad-322417.ecommerce.categories` AS c
ON 
  c.id = p.category_id
GROUP BY 
  2


-- SUM

SELECT 
  SUM(total_price) AS venda_total
FROM 
  `cobalt-nomad-322417.ecommerce.items`


SELECT 
  SUM(i.total_price) AS venda_total,
  EXTRACT(DATE FROM o.created_at) AS dia_compra
FROM 
  `cobalt-nomad-322417.ecommerce.items` i
INNER JOIN 
  `cobalt-nomad-322417.ecommerce.orders` o
ON 
  o.id = i.order_id
GROUP BY 
  dia_compra
ORDER BY 
  dia_compra


-- AVG

SELECT 
  AVG(total_confirmed_cases) AS casos_confirmados
FROM 
  `bigquery-public-data.covid19_italy.data_by_region`


SELECT
  region_name,
  ROUND(AVG(total_confirmed_cases), 2) AS casos_confirmados
FROM 
  `bigquery-public-data.covid19_italy.data_by_region`
GROUP BY 
  region_name
ORDER BY 
  casos_confirmados DESC
