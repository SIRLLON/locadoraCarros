SELECT 
    C.nome AS nome_cliente,
    AVG(P.valor_pago) AS media_pagamento
FROM Pagamentos P
JOIN Alugueis A ON P.id_aluguel = A.id_aluguel
JOIN Clientes C ON A.id_cliente = C.id_cliente
GROUP BY C.nome;