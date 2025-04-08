/*SELECT 
    C.nome AS nome_cliente,
    V.modelo AS modelo_veiculo,
    A.data_aluguel,
    P.valor_pago
FROM Alugueis A
JOIN Clientes C ON A.id_cliente = C.id_cliente
JOIN Veiculos V ON A.id_veiculo = V.id_veiculo
JOIN Pagamentos P ON A.id_aluguel = P.id_aluguel;*/

CREATE INDEX idx_cliente_id ON Alugueis(id_cliente);
CREATE INDEX idx_veiculo_id ON Alugueis(id_veiculo);
CREATE INDEX idx_aluguel_id_pagamentos ON Pagamentos(id_aluguel);
CREATE INDEX idx_id_cliente ON Clientes(id_cliente);
CREATE INDEX idx_id_veiculo ON Veiculos(id_veiculo);