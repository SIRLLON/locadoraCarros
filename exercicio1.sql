-- 1. Obter a lista de clientes e os veículos que alugaram,
-- mostrando também o nome do fabricante e o modelo do carro.
SELECT 
    c.nome AS nome_cliente, 
    v.fabricante, 
    v.modelo
FROM 
    Clientes c
INNER JOIN 
    Alugueis a ON c.id_cliente = a.id_cliente
INNER JOIN 
    Veiculos v ON a.id_veiculo = v.id_veiculo;

-- 2. Listar todos os veículos e o total de dias alugados para cada um.
SELECT 
    v.modelo, 
    SUM(a.dias_alugados) AS total_dias_alugados
FROM 
    Veiculos v
LEFT JOIN 
    Alugueis a ON v.id_veiculo = a.id_veiculo
GROUP BY 
    v.id_veiculo, v.modelo;

-- 3. Listar todos os veículos disponíveis e, se houver, mostrar quais clientes os alugaram. 
-- Se um veículo não foi alugado por nenhum cliente, será mostrado como NULL.
SELECT 
    v.modelo, 
    c.nome AS nome_cliente
FROM 
    Veiculos v
LEFT JOIN 
    Alugueis a ON v.id_veiculo = a.id_veiculo
LEFT JOIN 
    Clientes c ON a.id_cliente = c.id_cliente;
