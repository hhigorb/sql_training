/* 
Anotações SQL

Chave primária: Identificador único da tabela.
Chave estrangeira: é a chave primária de outra tabela (usada para relacionar tabelas).
*/


-- COMANDO SELECT

SELECT 
  id, 
  created_at 
FROM 
  `cobalt-nomad-322417.ecommerce.customers`;

-- DISTINCT

SELECT
  DISTINCT status 
FROM 
  `cobalt-nomad-322417.ecommerce.orders`;

SELECT 
  DISTINCT state,
FROM 
  `cobalt-nomad-322417.ecommerce.customers`;


SELECT 
  DISTINCT EXTRACT(year FROM created_at) AS ano
FROM `cobalt-nomad-322417.ecommerce.orders`;

-- OPERADORES

-- ARITMÉTICOS

SELECT
  1 + 1 as soma,
  10 - 5 as subtracao,
  10 * 3 as multiplicacao,
  10 / 2 as divisao;


-- COMPARACAO

SELECT 
  1 = 1,
  3 > 4,
  5 < 6,
  7 <= 7;


-- BETWEEN

SELECT 
2 BETWEEN 0 AND 10,
15 BETWEEN 0 AND 10;

SELECT
  *
FROM 
  `cobalt-nomad-322417.ecommerce.products`
WHERE price BETWEEN 50 AND 110;


-- LIKE

SELECT 
  * 
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
WHERE first_name LIKE 'M%';


SELECT
  *
FROM
  `cobalt-nomad-322417.ecommerce.customers`
WHERE state LIKE '%o'


-- IN

SELECT
  *
FROM
  `cobalt-nomad-322417.ecommerce.customers`
WHERE state in ('Rio de Janeiro', 'Pernambuco')


SELECT 
  *
FROM 
  `cobalt-nomad-322417.ecommerce.products`
WHERE price in (11, 15, 70)


-- IS

SELECT 
  *
FROM
  `cobalt-nomad-322417.ecommerce.customers`
WHERE email IS NULL


SELECT 
  *
FROM
  `cobalt-nomad-322417.ecommerce.customers`
WHERE email IS NOT NULL


SELECT 
  *
FROM 
  `bigquery-public-data.chicago_crime.crime`
WHERE arrest IS true

-- APELIDOS (AS)

SELECT 
  id,
  name AS nome_categoria
FROM 
  `cobalt-nomad-322417.ecommerce.categories`


SELECT
  t.id,
  t.order_id, 
  t.product_id 
FROM 
  `cobalt-nomad-322417.ecommerce.items` AS t


-- WHERE 

SELECT 
  * 
FROM
  `cobalt-nomad-322417.ecommerce.items`
WHERE quantity BETWEEN 2 AND 4


SELECT
  *
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
WHERE state = 'Acre' AND email IS NOT NULL


SELECT
  *
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
WHERE (state = 'Acre' or state = 'São Paulo') AND street IS NOT NULL



SELECT 
  * 
FROM 
  `cobalt-nomad-322417.ecommerce.orders`
WHERE status IN ('entrega_pendente', 'cancelado')


-- CASE

SELECT 
  id, 
  name, 
  CASE 
    WHEN name = 'Moda e Acessórios' THEN 'Sim, é Moda e Acessórios'
  END AS caso1
FROM 
  `cobalt-nomad-322417.ecommerce.categories`


SELECT 
  id, 
  name, 
  CASE
    WHEN name = 'Moda e Acessórios' THEN 'Sim, é Moda e Acessórios'
    WHEN name != 'Moda e Acessórios' THEN 'Não, não é Moda e Acessórios'
    ELSE 'Não encontrado'
  END AS caso1
FROM 
  `cobalt-nomad-322417.ecommerce.categories`


SELECT 
  DISTINCT state,
  CASE 
    WHEN state in ('São Paulo', 'Rio de Janeiro', 'Espírito Santo', 'Minas Gerai') THEN 'Região Sudeste'
    ELSE 'Demais regiões'
  END AS Teste
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
WHERE state IS NOT NULL


-- IF

SELECT 
  id, 
  name, 
  IF(name = 'Moda e Acessórios', 'Sim, é moda e acessórios', 'Não, não é moda e acessórios')
FROM 
  `cobalt-nomad-322417.ecommerce.categories`



-- COALESCE (Retorna o valor da primeira expressão não nula)

SELECT COALESCE(NULL, 'B', 'C') as result

+--------+
| result |
+--------+
| B      |
+--------+


-- GROUP BY


SELECT 
  EXTRACT(DATE FROM created_at) AS data,
  COUNT(id) AS qtd_pedidos
FROM 
  `cobalt-nomad-322417.ecommerce.orders`
GROUP BY 
  data


SELECT
  order_id AS pedido,
  COUNT(product_id) as qtd_produtos
FROM 
  `cobalt-nomad-322417.ecommerce.items`
GROUP BY order_id


-- ORDER BY 

SELECT 
  * 
FROM 
  `cobalt-nomad-322417.ecommerce.categories`
ORDER BY 
  id


SELECT 
  * 
FROM 
  `cobalt-nomad-322417.ecommerce.categories`
ORDER BY 
  id DESC  -- DESC: Decrescente / ASC: Crescente


SELECT 
  * 
FROM 
  `cobalt-nomad-322417.ecommerce.orders`
ORDER BY 
  customer_id ASC,
  status DESC


-- JOIN

SELECT 
  cat.name AS nome_categoria,
  prod.name AS nome_produto,
  prod.price
FROM 
  `cobalt-nomad-322417.ecommerce.categories` AS cat 
INNER JOIN `cobalt-nomad-322417.ecommerce.products` AS prod
ON cat.id = prod.category_id


SELECT
  items.order_id,
  prod.name,
  prod.price AS preco,
  SUM(items.quantity) AS quantidade,
  SUM(items.total_price) AS total
FROM
  `cobalt-nomad-322417.ecommerce.products` prod
INNER JOIN
  `cobalt-nomad-322417.ecommerce.items` items
ON
  prod.id = items.product_id
GROUP BY 
  1, 2, 3