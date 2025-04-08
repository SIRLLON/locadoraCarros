SELECT C.nome AS cliente, COUNT(A.id_aluguel) AS total_alugueis
FROM Clientes C
INNER JOIN Alugueis A ON C.id_cliente = A.id_cliente
GROUP BY C.nome
HAVING COUNT(A.id_aluguel) >= 2;

SELECT O.nome AS oficina, SUM(M.custo) AS total_gasto
FROM Oficinas O
INNER JOIN Manutencoes M ON O.id_oficina = M.id_oficina
GROUP BY O.nome
HAVING SUM(M.custo) > 400;

SELECT S.descricao AS status_aluguel, COUNT(A.id_aluguel) AS quantidade
FROM Status_Aluguel S
INNER JOIN Alugueis A ON S.id_status = A.id_status
GROUP BY S.descricao
HAVING COUNT(A.id_aluguel) > 1;

SELECT P.metodo_pagamento, COUNT(P.id_pagamento) AS total_pagamentos
FROM Pagamentos P
GROUP BY P.metodo_pagamento
HAVING COUNT(P.id_pagamento) >= 2;
