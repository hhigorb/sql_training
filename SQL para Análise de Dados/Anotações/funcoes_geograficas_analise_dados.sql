-- Funções geográficas

--ST_GEOGPOINT, ST_DISTANCE, ST_x, ST_y

SELECT  
  unique_key,
  latitude,
  location,
  ST_GEOGPOINT(longitude, latitude) AS ponto_espaco,
  ST_GEOGPOINT(-97.7714119, 30.2576125) AS ponto_parque,
  ST_DISTANCE(ST_GEOGPOINT(longitude, latitude), ST_GEOGPOINT(-97.7714119, 30.2576125)) AS distancia_solicitacao_e_parque,
  ST_x(ST_GEOGPOINT(-97.7714119, 30.2576125)),
  ST_y(ST_GEOGPOINT(-97.7714119, 30.2576125))
FROM
  `bigquery-public-data.austin_311.311_service_requests`
WHERE 
  location IS NOT NULL
LIMIT 100
