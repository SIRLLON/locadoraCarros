UPDATE Alugueis
SET id_status = (SELECT id_status FROM Status_Aluguel WHERE descricao = 'Finalizado')
WHERE data_aluguel < '2024-01-01';
