-- EXERCÍCIOS SQL BÁSICO

/* Quero como resultado uma tabela que contenha o id, país e estado de todos os
nossos clientes. */

SELECT 
  id,
  country,
  state
FROM 
  `cobalt-nomad-322417.ecommerce.customers`


/* Selecione os preços distintos de nossos produtos, mas ordenados de forma
decrescente, utilizando o DISTINCT e ORDER BY. */

SELECT 
  DISTINCT price  
FROM 
  `cobalt-nomad-322417.ecommerce.products`
ORDER BY 1 DESC

/* Retorne a data (naquele formato ANO-MÊS-DIA) de criação dos primeiros 5
registros da tabela customers. */

SELECT 
  EXTRACT(DATE FROM created_at)
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
LIMIT 
  5


/* O time de marketing deseja fazer uma campanha em um estado específico. Para
isso, eles te pedem os e-mails de todos os clientes que moram no Piauí */

SELECT
  email,
  state
FROM 
  `cobalt-nomad-322417.ecommerce.customers`
WHERE state = 'Piauí'


/* Vá até a tabela items e retorne o campo ‘total_price’ de forma distinta, mas
utilizando o GROUP BY. */

SELECT 
  total_price
FROM 
  `cobalt-nomad-322417.ecommerce.items`
GROUP BY 1


/* Selecione todos os pedidos em que o status é cancelado OU entrega_pendente.
Retorne também o mesmo resultado, mas utilizando o operador IN. */

SELECT 
  *
FROM
  `cobalt-nomad-322417.ecommerce.orders`
WHERE status IN ('cancelado', 'entrega_pendente')


/* Retorne todos os registros em que o campo ‘additionals’ é nulo na tabela
customers */


SELECT 
  *
FROM
  `cobalt-nomad-322417.ecommerce.customers`
WHERE additionals IS NULL


/* Utilize o join para trazer a informação de status do pedido juntamente das
informações (colunas) da tabela de itens.  */

SELECT 
  i.id,
  i.quantity,
  i.total_price,
  o.status
FROM 
  `cobalt-nomad-322417.ecommerce.items` AS i
INNER JOIN 
  `cobalt-nomad-322417.ecommerce.orders` AS o
ON i.order_id = o.id


/* Na tabela de pedidos, além das colunas existentes, quero também informações
de nome do cliente e seu telefone. */

SELECT 
  o.*,
  CONCAT(c.first_name, " ", c.last_name) AS nome_completo,
  c.cell_phone
FROM 
  `cobalt-nomad-322417.ecommerce.orders` AS o
INNER JOIN 
  `cobalt-nomad-322417.ecommerce.customers` AS c
ON o.customer_id = c.id
  

/* DESAFIO: Pesquise sobre o comando like e retorne os nomes dos produtos que
tenham somente 4 caracteres. */


SELECT 
  *
FROM 
  `cobalt-nomad-322417.ecommerce.products`
WHERE name LIKE '____'





