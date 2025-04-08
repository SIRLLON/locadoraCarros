SELECT 
    C.nome AS cliente,
    SUM(A.custo_total) AS total_gasto
FROM 
    Clientes C
JOIN 
    Alugueis A ON C.id_cliente = A.id_cliente
GROUP BY 
    C.id_cliente, C.nome
ORDER BY 
    total_gasto DESC
LIMIT 5;
