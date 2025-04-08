-- Inserção em Status_Aluguel
INSERT INTO Status_Aluguel (descricao) VALUES
('Em andamento'),
('Concluído'),
('Cancelado');

-- Inserção em Clientes
INSERT INTO Clientes (id_cliente, nome) VALUES
(1, 'João'),
(2, 'Maria'),
(3, 'Carlos'),
(4, 'Ana'),
(5, 'Lucas'),
(6, 'Fernanda'),
(7, 'Rafael'),
(8, 'Juliana'),
(9, 'Bruno'),
(10, 'Patrícia'),
(11, 'Débora'),
(12, 'Renato'),
(13, 'Clara'),
(14, 'Marcos'),
(15, 'Lívia');

-- Inserção em Categorias (supondo que ainda não foram inseridas)
INSERT INTO Categorias (id_categoria, nome_categoria) VALUES
(1, 'Sedan'),
(2, 'SUV'),
(3, 'Hatch');

-- Inserção em Veiculos
INSERT INTO Veiculos (id_veiculo, id_categoria, fabricante, modelo) VALUES
(1, 1, 'Toyota', 'Corolla'),
(2, 2, 'Honda', 'Civic'),
(3, 3, 'Ford', 'Ka'),
(4, 1, 'Chevrolet', 'Cruze'),
(5, 2, 'Volkswagen', 'Jetta'),
(6, 3, 'Fiat', 'Uno'),
(7, 1, 'Hyundai', 'HB20S'),
(8, 2, 'Nissan', 'Sentra'),
(9, 3, 'Peugeot', '208'),
(10, 1, 'Kia', 'Cerato'),
(11, 1, 'Volkswagen', 'Tiguan'),
(12, 3, 'Renault', 'Fluence'),
(13, 2, 'Nissan', 'March'),
(14, 1, 'Chevrolet', 'Tracker'),
(15, 3, 'Hyundai', 'Elantra');

-- Inserção em Alugueis
INSERT INTO Alugueis (id_aluguel, id_cliente, id_veiculo, dias_alugados, valor_diaria, seguro, valor_seguro, custo_manutencao, custo_total, data_aluguel, id_status) VALUES
(1, 1, 1, 10, 300, 'Sim', 150, 400, 9527.00, '2023-05-15', 2),
(2, 2, 2, 8, 320, 'Não', 0, 350, 7868.00, '2023-06-10', 1),
(3, 3, 3, 12, 250, 'Sim', 100, 300, 2851.00, '2023-08-20', 2),
(4, 4, 4, 5, 310, 'Sim', 180, 450, 2180.00, '2023-07-05', 3),
(5, 5, 5, 7, 290, 'Não', 0, 280, 2310.00, '2023-09-01', 1),
(6, 6, 6, 15, 270, 'Sim', 200, 310, 4550.00, '2023-10-10', 2),
(7, 7, 7, 6, 340, 'Não', 0, 150, 2190.00, '2023-11-15', 1),
(8, 8, 8, 9, 300, 'Sim', 180, 300, 3150.00, '2023-12-05', 1),
(9, 9, 9, 4, 280, 'Sim', 150, 200, 1510.00, '2024-01-10', 2),
(10, 10, 10, 3, 350, 'Não', 0, 100, 1150.00, '2024-02-01', 3),
(11, 11, 11, 12, 330, 'Sim', 200, 500, 4660.00, '2024-01-15', 1),
(12, 12, 12, 5, 275, 'Não', 0, 320, 1695.00, '2024-02-01', 2),
(13, 13, 13, 9, 115, 'Sim', 200, 300, 1535.00, '2024-02-20', 1),
(14, 14, 14, 20, 380, 'Não', 0, 420, 8020.00, '2024-03-02', 1),
(15, 15, 15, 7, 295, 'Sim', 150, 280, 2495.00, '2024-03-20', 3);

-- Inserção em Pagamentos
INSERT INTO Pagamentos (id_pagamento, id_aluguel, valor_pago, data_pagamento, metodo_pagamento, status_pagamento) VALUES
(1, 1, 9527.00, '2023-05-16', 'Cartão de Crédito', 'Pago'),
(2, 2, 7868.00, '2023-06-11', 'PIX', 'Pago'),
(3, 3, 2851.00, '2023-08-21', 'Boleto', 'Pago'),
(4, 11, 4660.00, '2024-01-16', 'Cartão de Crédito', 'Pago'),
(5, 12, 1695.00, '2024-02-02', 'PIX', 'Pago'),
(6, 13, 1535.00, '2024-02-21', 'Cartão de Débito', 'Pago'),
(7, 14, 8020.00, '2024-03-03', 'PIX', 'Em processamento'),
(8, 15, 2495.00, '2024-03-21', 'Boleto', 'Cancelado');

-- Inserção em Oficinas
INSERT INTO Oficinas (id_oficina, nome, endereco) VALUES
(1, 'Oficina Mecânica Auto+ Center', 'Av. Brasil, 123 - Rio de Janeiro'),
(2, 'TopCar Manutenção', 'Rua das Flores, 456 - São Paulo'),
(3, 'Serviço Rápido Express', 'Av. Central, 789 - Belo Horizonte');

-- Inserção em Manutencoes
INSERT INTO Manutencoes (id_veiculo, id_oficina, data_manutencao, descricao, custo) VALUES
(1, 1, '2023-05-01', 'Troca de óleo e revisão geral', 450.00),
(3, 2, '2023-08-01', 'Alinhamento e balanceamento', 250.00),
(6, 3, '2023-06-01', 'Substituição de pastilhas de freio', 310.00),
(11, 1, '2024-01-10', 'Revisão de 20.000km', 500.00),
(14, 2, '2024-02-27', 'Troca de amortecedores', 420.00);
