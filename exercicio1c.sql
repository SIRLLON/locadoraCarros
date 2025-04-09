DELETE FROM Veiculos
WHERE id_veiculo NOT IN (
    SELECT DISTINCT id_veiculo FROM Alugueis
);
