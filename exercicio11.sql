SELECT 
    C1.nome AS cliente_1,
    C2.nome AS cliente_2
FROM 
    Clientes C1
JOIN 
    Clientes C2 
    ON LEFT(C1.nome, 1) = LEFT(C2.nome, 1)
    AND C1.id_cliente < C2.id_cliente;
