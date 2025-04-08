SELECT C.nome AS cliente, COUNT(A.id_aluguel) AS total_alugueis, SUM(P.valor_pago) AS total_pago
FROM Clientes C
INNER JOIN Alugueis A ON C.id_cliente = A.id_cliente
INNER JOIN Pagamentos P ON A.id_aluguel = P.id_aluguel
GROUP BY C.nome;
