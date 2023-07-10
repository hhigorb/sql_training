-- Window Functions

'''
FIRST_VALUE: A função FIRST_VALUE retorna o valor da primeira linha em um conjunto de resultados, de acordo com uma ordenação especificada.
Por exemplo, você pode usar essa função para obter o primeiro valor de uma coluna em um conjunto de resultados ordenado.
'''

SELECT 
  user_id,
  order_id,
  created_at,
  FIRST_VALUE(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS data_primeiro_pedido
FROM 
  `bigquery-public-data.thelook_ecommerce.orders`
ORDER BY 
  user_id,
  created_at
  
'''
LAST_VALUE: A função LAST_VALUE retorna o valor da última linha em um conjunto de resultados, de acordo com uma ordenação especificada.
Ela é semelhante à função FIRST_VALUE, mas retorna o último valor em vez do primeiro.
'''

SELECT 
  user_id,
  order_id,
  created_at,
  LAST_VALUE(created_at) OVER(PARTITION BY user_id ORDER BY created_at ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS data_ultimo_pedido
FROM 
  `bigquery-public-data.thelook_ecommerce.orders`
ORDER BY 
  user_id,
  created_at

'''
LEAD: A função LEAD retorna o valor de uma coluna da próxima linha em relação à linha atual em um conjunto de resultados.
Você pode especificar o número de linhas a serem avançadas para buscar o valor. Essa função é útil para acessar valores de linhas subsequentes em uma consulta.
'''

SELECT 
  user_id,
  order_id,
  created_at,
  LEAD(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS data_proximo_pedido,
FROM 
  `bigquery-public-data.thelook_ecommerce.orders`
ORDER BY 
  user_id,
  created_at

'''
LAG: A função LAG retorna o valor de uma coluna da linha anterior em relação à linha atual em um conjunto de resultados.
Assim como a função LEAD, você pode especificar o número de linhas a serem recuadas para buscar o valor.
Essa função é útil para acessar valores de linhas anteriores em uma consulta.
'''

SELECT 
  user_id,
  order_id,
  created_at,
  LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS data_ultimo_pedido,
  TIMESTAMP_DIFF(created_at, LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at), day) AS data_desde_ultimo_pedido
FROM 
  `bigquery-public-data.thelook_ecommerce.orders`
ORDER BY 
  user_id,
  created_at

'''
RANK: A função RANK atribui um valor de classificação a cada linha de um conjunto de resultados, com base em uma ordenação especificada.
Ela atribui o mesmo valor de classificação para linhas com valores iguais e, em seguida, pula para a próxima classificação disponível.
Por exemplo, se duas linhas tiverem o mesmo valor e receberem uma classificação de 1, a próxima linha receberá uma classificação
de 3 (pulando a classificação 2).

ROW_NUMBER(): A função ROW_NUMBER() é uma função analítica que atribui um número sequencial a cada linha em um conjunto
de resultados, geralmente usado para criar identificadores únicos para cada linha.
'''

SELECT 
  distribution_center_id,
  RANK() OVER(ORDER BY distribution_center_id) AS rank,
  ROW_NUMBER() OVER(ORDER BY distribution_center_id) AS numero_linha
FROM 
  `bigquery-public-data.thelook_ecommerce.products`
ORDER BY 
  1,
  3

-- Utilizando com funções de agregação

SELECT 
  user_id,
  order_id,
  created_at,
  MIN(created_at) OVER(PARTITION BY user_id) AS data_primeira_compra,
  MAX(created_at) OVER(PARTITION BY user_id) AS data_ultima_compra,
  COUNT(created_at) OVER(PARTITION BY user_id) AS qtd_compras
FROM
  `bigquery-public-data.thelook_ecommerce.orders`
ORDER BY 
  user_id,
  created_at
