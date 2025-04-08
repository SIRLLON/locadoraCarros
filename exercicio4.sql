SELECT C.nome AS cliente, COUNT(A.id_aluguel) AS total_alugueis
FROM Clientes C
INNER JOIN Alugueis A ON C.id_cliente = A.id_cliente
GROUP BY C.nome;

SELECT V.modelo AS veiculo, SUM(P.valor_pago) AS total_recebido
FROM Veiculos V
INNER JOIN Alugueis A ON V.id_veiculo = A.id_veiculo
INNER JOIN Pagamentos P ON A.id_aluguel = P.id_aluguel
GROUP BY V.modelo;

SELECT O.nome AS oficina, AVG(M.custo) AS custo_medio_manutencao
FROM Oficinas O
INNER JOIN Manutencoes M ON O.id_oficina = M.id_oficina
GROUP BY O.nome;

SELECT S.descricao AS status, COUNT(A.id_aluguel) AS quantidade
FROM Status_Aluguel S
INNER JOIN Alugueis A ON S.id_status = A.id_status
GROUP BY S.descricao;

SELECT C.nome AS cliente, MAX(P.valor_pago) AS maior_pagamento
FROM Clientes C
INNER JOIN Alugueis A ON C.id_cliente = A.id_cliente
INNER JOIN Pagamentos P ON A.id_aluguel = P.id_aluguel
GROUP BY C.nome;
