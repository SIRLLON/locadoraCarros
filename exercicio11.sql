SELECT 
    c.nome AS cliente,
    v.modelo AS veiculo,
    a.data_aluguel,
    a.data_devolucao
FROM 
    Alugueis a
INNER JOIN Clientes c ON a.cliente_id = c.id
INNER JOIN Veiculos v ON a.veiculo_id = v.id
WHERE 
    a.data_aluguel BETWEEN '2023-01-01' AND '2023-12-31';
