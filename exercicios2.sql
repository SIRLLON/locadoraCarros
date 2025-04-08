CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Alugueis (
    id_aluguel INT PRIMARY KEY,
    id_cliente INT,
    data_aluguel DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Clientes VALUES
(1, 'João'),
(2, 'Maria'),
(3, 'Carlos'),
(4, 'Ana');

INSERT INTO Alugueis VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-02-15'),
(3, 1, '2024-03-01');

SELECT C.nome, A.data_aluguel
FROM Clientes C
INNER JOIN Alugueis A ON C.id_cliente = A.id_cliente;

SELECT C.nome, A.data_aluguel
FROM Clientes C
LEFT JOIN Alugueis A ON C.id_cliente = A.id_cliente;

SELECT C.nome, A.data_aluguel
FROM Clientes C
RIGHT JOIN Alugueis A ON C.id_cliente = A.id_cliente;

SELECT C.nome, A.data_aluguel
FROM Clientes C
LEFT JOIN Alugueis A ON C.id_cliente = A.id_cliente
UNION
SELECT C.nome, A.data_aluguel
FROM Clientes C
RIGHT JOIN Alugueis A ON C.id_cliente = A.id_cliente;

SELECT C.nome, A.data_aluguel
FROM Clientes C
CROSS JOIN Alugueis A;
