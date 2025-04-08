-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS locadora_veiculos;
USE locadora_veiculos;

-- Tabela: Status_Aluguel
CREATE TABLE Status_Aluguel (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Tabela: Oficinas
CREATE TABLE Oficinas (
    id_oficina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255)
) ENGINE=InnoDB;

-- Tabela: Categorias
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- Tabela: Veiculos
CREATE TABLE Veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    modelo VARCHAR(100),
    fabricante VARCHAR(100),
    ano INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;



-- Tabela: Veiculos (apenas como base de referência para FK em Manutencoes)
-- Caso já exista em outro script, remova esta parte.
-- Tabela: Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100)
) ENGINE=InnoDB;

-- Tabela: Alugueis
CREATE TABLE Alugueis (
    id_aluguel INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_veiculo INT,
    dias_alugados INT,
    valor_diaria DECIMAL(10,2),
    seguro ENUM('Sim', 'Não'),
    valor_seguro DECIMAL(10,2),
    custo_manutencao DECIMAL(10,2),
    custo_total DECIMAL(10,2),
    data_aluguel DATE,
    id_status INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_status) REFERENCES Status_Aluguel(id_status)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Tabela: Pagamentos
CREATE TABLE Pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_aluguel INT,
    valor_pago DECIMAL(10,2),
    data_pagamento DATE,
    metodo_pagamento VARCHAR(50),
    status_pagamento VARCHAR(50),
    FOREIGN KEY (id_aluguel) REFERENCES Alugueis(id_aluguel)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Tabela: Manutencoes
CREATE TABLE Manutencoes (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT,
    id_oficina INT,
    data_manutencao DATE,
    descricao VARCHAR(255),
    custo DECIMAL(10,2),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_oficina) REFERENCES Oficinas(id_oficina)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;
