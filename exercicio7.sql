SELECT C.nome AS cliente, V.modelo AS veiculo, A.data_aluguel
FROM Alugueis A
INNER JOIN Clientes C ON A.id_cliente = C.id_cliente
INNER JOIN Veiculos V ON A.id_veiculo = V.id_veiculo
WHERE A.id_aluguel IN (
    SELECT id_aluguel
    FROM Pagamentos
    WHERE status_pagamento = 'Pago'
);
