SELECT 
    C.nome AS cliente,
    COUNT(A.id_aluguel) AS total_alugueis,
    SUM(A.custo_total) AS total_gasto,
    CASE 
        WHEN SUM(A.custo_total) >= 2000 THEN 'Cliente Ouro'
        WHEN SUM(A.custo_total) >= 1000 THEN 'Cliente Prata'
        ELSE 'Cliente Bronze'
    END AS categoria
FROM 
    Clientes C
JOIN 
    Alugueis A ON C.id_cliente = A.id_cliente
GROUP BY 
    C.id_cliente, C.nome;
