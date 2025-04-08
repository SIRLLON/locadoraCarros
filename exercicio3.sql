SELECT 
    C.nome AS cliente,
    V.modelo AS veiculo,
    A.data_aluguel,
    P.valor_pago,
    P.metodo_pagamento,
    S.descricao AS status_aluguel
FROM Alugueis A
INNER JOIN Clientes C ON A.id_cliente = C.id_cliente
INNER JOIN Veiculos V ON A.id_veiculo = V.id_veiculo
INNER JOIN Pagamentos P ON A.id_aluguel = P.id_aluguel
INNER JOIN Status_Aluguel S ON A.id_status = S.id_status;
