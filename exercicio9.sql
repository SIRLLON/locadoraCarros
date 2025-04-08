SELECT V.modelo, COUNT(M.id_manutencao) AS total_manutencoes
FROM Veiculos V
LEFT JOIN Manutencoes M ON V.id_veiculo = M.id_veiculo
GROUP BY V.modelo;
