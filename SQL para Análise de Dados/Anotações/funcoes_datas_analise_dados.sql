-- Funções de Datas

-- DATE

SELECT 
  DATE(2020, 06, 12) AS data


SELECT 
  DATE(created_at) AS data
FROM 
  `cobalt-nomad-322417.ecommerce.customers`


 -- DATETIME

SELECT 
  DATETIME(2020, 06, 21, 21, 05, 03) AS date_and_time


SELECT 
  DATETIME(created_at) AS data
FROM 
  `cobalt-nomad-322417.ecommerce.customers`


-- TIMESTAMP

SELECT 
  TIMESTAMP('2008-12-25 15:30:00') AS exemplo
  


-- CURRENT_DATE, CURRENT_DATETIME, CURRENT_TIMESTAMP

SELECT 
  CURRENT_DATE(),
  CURRENT_DATETIME(),
  CURRENT_TIMESTAMP()


SELECT 
  *
FROM 
  `bigquery-public-data.covid19_italy.data_by_region`
WHERE
  DATE(date) < CURRENT_DATE()



-- EXTRACT 

SELECT 
  CURRENT_DATE() AS exemplo1,
  EXTRACT(YEAR FROM CURRENT_DATE()),
  EXTRACT(MONTH FROM CURRENT_DATE()),
  EXTRACT(DAY FROM CURRENT_DATE()),
  EXTRACT(HOUR FROM CURRENT_TIMESTAMP())


SELECT 
  COUNT(id) AS num_pedidos,
  EXTRACT(dayofweek FROM created_at) AS dia_semana,
FROM
  `cobalt-nomad-322417.ecommerce.orders`
GROUP BY 
  dia_semana
ORDER BY 
  num_pedidos DESC


 
 -- DATE_ADD, DATETIME_ADD, TIMESTAMP_ADD


 SELECT 
   CURRENT_DATE AS exemplo1,
   DATE_ADD(CURRENT_DATE, INTERVAL 2 DAY),
   DATE_ADD(CURRENT_DATE, INTERVAL 1 MONTH),
   DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR),
   CURRENT_TIMESTAMP AS exemplo2,
   TIMESTAMP_ADD(CURRENT_TIMESTAMP, INTERVAL 3 HOUR),
   DATETIME_ADD(CURRENT_DATETIME, INTERVAL 3 YEAR)
   


SELECT 
  *
FROM 
  `bigquery-public-data.covid19_italy.data_by_region`
WHERE
  DATE(date) BETWEEN DATE(2020, 07, 01) AND DATE_ADD(DATE(2020, 07, 01), INTERVAL 3 DAY)



 -- DATE_SUB, DATETIME_SUB, TIMESTAMP_SUB


 SELECT 
   CURRENT_DATE AS exemplo1,
   DATE_SUB(CURRENT_DATE, INTERVAL 2 DAY),
   DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH),
   DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR),
   CURRENT_TIMESTAMP AS exemplo2,
   TIMESTAMP_SUB(CURRENT_TIMESTAMP, INTERVAL 3 HOUR),
   DATETIME_SUB(CURRENT_DATETIME, INTERVAL 3 YEAR)
   


SELECT 
  *
FROM 
  `cobalt-nomad-322417.ecommerce.orders`
WHERE DATE(created_at) BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 600 DAY) AND CURRENT_DATE


 -- DATE_DIFF, DATETIME_DIFF, TIMESTAMP_DIFF


SELECT 
  DATE_DIFF('2020-01-01', '2019-01-01', YEAR),
  DATETIME_DIFF('2020-01-01T17:00:00', '2020-01-01T14:00:00', HOUR),
  TIMESTAMP_DIFF('2020-01-01T17:30:00', '2020-01-01T17:00:00', MINUTE)



SELECT 
  c.id AS id_cliente,
  MIN(TIMESTAMP_DIFF(o.created_at, c.created_at, DAY)) AS first_buy_diff
FROM 
  `cobalt-nomad-322417.ecommerce.orders` o 
INNER JOIN 
  `cobalt-nomad-322417.ecommerce.customers` c
ON 
  o.customer_id = c.id
GROUP BY c.id



-- FORMAT_DATE, FORMAT_DATETIME, FORMAT_TIMESTAMP

SELECT 
  CURRENT_DATE(),
  FORMAT_DATE('%d-%m-%Y', CURRENT_DATE()),
  FORMAT_DATE('%b %d', CURRENT_DATE()),
  FORMAT_DATE('%Y-%m', CURRENT_DATE())

-- Checar a documentação para mais formatações