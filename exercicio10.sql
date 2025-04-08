SELECT 
    C.nome AS cliente,
    MAX(P.valor_pago) AS valor_maximo_pago,
    MIN(P.valor_pago) AS valor_minimo_pago
FROM Clientes C
JOIN Alugueis A ON C.id_cliente = A.id_cliente
JOIN Pagamentos P ON A.id_aluguel = P.id_aluguel
GROUP BY C.nome;
