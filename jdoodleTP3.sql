-- Criação das tabelas e inserção de dados

CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);

INSERT INTO Clientes (id_cliente, nome) VALUES
(1, 'Fernanda'),
(2, 'Beatriz'),
(3, 'João'),
(4, 'Pedro'),
(5, 'Ana'),
(6, 'Maria'),
(7, 'Rafael'),
(8, 'Carlos'),
(9, 'Luciana'),
(10, 'Tiago');

CREATE TABLE Categorias (
    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_categoria TEXT NOT NULL
);

INSERT INTO Categorias (id_categoria, nome_categoria) VALUES
(1, 'SUV'),
(2, 'Econômico'),
(3, 'Intermediário');

CREATE TABLE Veiculos (
    id_veiculo INTEGER PRIMARY KEY AUTOINCREMENT,
    id_categoria INTEGER NOT NULL,
    fabricante TEXT NOT NULL,
    modelo TEXT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias (id_categoria)
);

INSERT INTO Veiculos (id_veiculo, id_categoria, fabricante, modelo) VALUES
(1, 1, 'Jeep', 'Jeep Compass'),
(2, 1, 'Toyota', 'Toyota RAV4'),
(3, 2, 'Fiat', 'Fiat Mobi'),
(4, 3, 'Chevrolet', 'Chevrolet Cruze'),
(5, 1, 'Ford', 'Ford Edge'),
(6, 2, 'Hyundai', 'Hyundai HB20'),
(7, 3, 'Toyota', 'Toyota Corolla'),
(8, 2, 'Chevrolet', 'Chevrolet Onix'),
(9, 3, 'Honda', 'Honda Civic'),
(10, 2, 'Fiat', 'Fiat Mobi');

CREATE TABLE Alugueis (
    id_aluguel INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    id_veiculo INTEGER NOT NULL,
    dias_alugados INTEGER NOT NULL,
    valor_diaria REAL NOT NULL,
    seguro TEXT NOT NULL,
    valor_seguro REAL,
    custo_manutencao REAL NOT NULL,
    custo_total REAL NOT NULL,
    data_aluguel DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos (id_veiculo)
);

INSERT INTO Alugueis (id_aluguel, id_cliente, id_veiculo, dias_alugados, valor_diaria, seguro, valor_seguro, custo_manutencao, custo_total, data_aluguel) VALUES
(1, 1, 1, 30, 285, 'Não', 0, 977, 9527, '2023-05-15'),
(2, 2, 2, 20, 362, 'Não', 0, 628, 7868, '2023-06-10'),
(3, 3, 3, 11, 224, 'Sim', 50, 387, 2851, '2023-08-20'),
(4, 4, 4, 28, 364, 'Sim', 200, 673, 11065, '2023-07-25'),
(5, 5, 5, 24, 112, 'Não', 0, 57, 2745, '2023-09-01'),
(6, 6, 6, 21, 100, 'Não', 0, 101, 2201, '2023-06-11'),
(7, 7, 7, 7, 382, 'Não', 0, 981, 3655, '2023-10-05'),
(8, 8, 8, 13, 95, 'Sim', 200, 859, 2124, '2022-11-12'),
(9, 9, 9, 16, 93, 'Não', 0, 78, 1566, '2022-09-20'),
(10, 10, 10, 15, 355, 'Sim', 200, 551, 8716, '2023-08-15');


-- 1. Obter a lista de clientes e os veículos que alugaram,
-- mostrando também o nome do fabricante e o modelo do carro.
SELECT c.nome AS nome_cliente, v.fabricante, v.modelo
FROM Clientes c
INNER JOIN Alugueis a ON c.id_cliente = a.id_cliente
INNER JOIN Veiculos v ON a.id_veiculo = v.id_veiculo;

-- 2. Listar todos os veículos e o total de dias alugados para cada um.
SELECT v.modelo, SUM(a.dias_alugados) AS total_dias_alugados
FROM Veiculos v
LEFT JOIN Alugueis a ON v.id_veiculo = a.id_veiculo
GROUP BY v.id_veiculo;

-- 3. Listar todos os veículos disponíveis e, se houver, mostrar quais clientes os alugaram. 
-- Se um veículo não foi alugado por nenhum cliente, será mostrado como NULL.
SELECT v.modelo, c.nome AS nome_cliente
FROM Veiculos v
LEFT JOIN Alugueis a ON v.id_veiculo = a.id_veiculo
LEFT JOIN Clientes c ON a.id_cliente = c.id_cliente;

-- 4. Mostrar o total de receita gerada com o aluguel de veículos
-- (valor diário * dias alugados) e também considerar o valor do seguro e da manutenção.
SELECT v.modelo, 
       SUM(a.dias_alugados * a.valor_diaria + IFNULL(a.valor_seguro, 0) + a.custo_manutencao) AS receita_total
FROM Veiculos v
JOIN Alugueis a ON v.id_veiculo = a.id_veiculo
GROUP BY v.id_veiculo;

-- 5. Exibir os clientes que alugaram veículos do tipo "SUV" e o total gasto por cada um.
SELECT c.nome AS nome_cliente,
       SUM(a.dias_alugados * a.valor_diaria + IFNULL(a.valor_seguro, 0) + a.custo_manutencao) AS total_gasto
FROM Clientes c
JOIN Alugueis a ON c.id_cliente = a.id_cliente
JOIN Veiculos v ON a.id_veiculo = v.id_veiculo
JOIN Categorias cat ON v.id_categoria = cat.id_categoria
WHERE cat.nome_categoria = 'SUV'
GROUP BY c.id_cliente;

-- 6. Calcular a média de dias de aluguel por categoria de veículo.
SELECT cat.nome_categoria, AVG(a.dias_alugados) AS media_dias_alugados
FROM Alugueis a
JOIN Veiculos v ON a.id_veiculo = v.id_veiculo
JOIN Categorias cat ON v.id_categoria = cat.id_categoria
GROUP BY cat.id_categoria;

-- 7. Listar os veículos com o maior e menor custo total de aluguel.
SELECT v.modelo, MIN(a.custo_total) AS menor_custo, MAX(a.custo_total) AS maior_custo
FROM Veiculos v
JOIN Alugueis a ON v.id_veiculo = a.id_veiculo
GROUP BY v.id_veiculo
ORDER BY menor_custo ASC, maior_custo DESC;
