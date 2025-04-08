SELECT nome AS entidade, 'Cliente' AS tipo
FROM Clientes
UNION
SELECT nome AS entidade, 'Oficina' AS tipo
FROM Oficinas;

SELECT nome AS entidade, 'Cliente' AS tipo
FROM Clientes
UNION ALL
SELECT nome AS entidade, 'Oficina' AS tipo
FROM Oficinas;
