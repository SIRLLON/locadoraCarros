SELECT C.nome AS cliente, COUNT(A.id_aluguel) AS total_alugueis
FROM Clientes C
INNER JOIN Alugueis A ON C.id_cliente = A.id_cliente
GROUP BY C.nome;

SELECT V.fabricante, COUNT(V.id_veiculo) AS total_modelos
FROM Veiculos V
GROUP BY V.fabricante;

SELECT O.nome AS oficina, SUM(M.custo) AS total_gasto
FROM Oficinas O
INNER JOIN Manutencoes M ON O.id_oficina = M.id_oficina
GROUP BY O.nome;

SELECT S.descricao AS status_aluguel, COUNT(A.id_aluguel) AS quantidade
FROM Status_Aluguel S
INNER JOIN Alugueis A ON S.id_status = A.id_status
GROUP BY S.descricao;

SELECT P.metodo_pagamento, COUNT(P.id_pagamento) AS total_pagamentos
FROM Pagamentos P
GROUP BY P.metodo_pagamento;
