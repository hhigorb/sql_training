-- Exercícios Funções de Agregação

/* Retorne em uma só consulta os valores de média, máximo, mínimo, contagem e
soma do campo ‘total_price’ da tabela items. */

SELECT 
  AVG(total_price) AS media,
  MAX(total_price) AS valor_maximo,
  MIN(total_price) AS valor_minimo,
  COUNT(total_price) AS contagem,
  SUM(total_price) AS soma
FROM 
  `cobalt-nomad-322417.ecommerce.items`



/* Retorne a quantidade de pedidos de cada status por dia, ordenando pelo dia, de
forma decrescente */

SELECT 
  COUNT(id) AS quantidade_pedidos,
  EXTRACT(DATE FROM created_at) AS data,
  status
FROM 
  `cobalt-nomad-322417.ecommerce.orders`
GROUP BY 
  2, 3
ORDER BY 
  data DESC


 /* Retorne a quantidade total de itens por pedido */

SELECT 
  SUM(quantity) AS soma_itens,
  order_id
FROM 
  `cobalt-nomad-322417.ecommerce.items`
GROUP BY 2


/* Na base de dados ‘covid19_italy’ e tabela ‘data_by_region’ encontre a coluna
‘tests_performed’. Retorne a soma de testes realizados por dia (considerando
todas as regiões). */

SELECT 
  EXTRACT(DATE FROM date) AS data,
  SUM(tests_performed) AS qtd_testes
FROM 
  `bigquery-public-data.covid19_italy.data_by_region`
GROUP BY 
  data


 /* DESAFIO: Retorne a diferença da soma de recuperados (coluna recovered) com
a soma de mortes (coluna deaths) por dia, apenas para a região Toscana. */

SELECT 
  EXTRACT(DATE from date) AS data,
  SUM(recovered) AS recuperados,
  SUM(deaths) AS mortes,
  SUM(recovered) - SUM(deaths) AS diferenca
FROM 
  `bigquery-public-data.covid19_italy.data_by_region`
WHERE 
  region_name = 'Toscana'
GROUP BY 
  data
