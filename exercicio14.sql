DELIMITER //

CREATE PROCEDURE inserir_aluguel(
    IN p_cliente_id INT,
    IN p_veiculo_id INT,
    IN p_dias_alugados INT,
    IN p_valor_diaria DECIMAL(10,2),
    IN p_seguro ENUM('Sim', 'Não'),
    IN p_valor_seguro DECIMAL(10,2),
    IN p_custo_manutencao DECIMAL(10,2),
    IN p_custo_total DECIMAL(10,2),
    IN p_data_aluguel DATE,
    IN p_id_status INT
)
BEGIN
    INSERT INTO Alugueis (id_cliente, id_veiculo, dias_alugados, valor_diaria, seguro, valor_seguro, custo_manutencao, custo_total, data_aluguel, id_status)
    VALUES (p_cliente_id, p_veiculo_id, p_dias_alugados, p_valor_diaria, p_seguro, p_valor_seguro, p_custo_manutencao, p_custo_total, p_data_aluguel, p_id_status);
END //

DELIMITER ;
