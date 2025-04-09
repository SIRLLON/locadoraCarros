-- Índice simples para acelerar buscas por CPF
CREATE INDEX idx_clientes_cpf ON Clientes(cpf);

-- Índice composto para acelerar filtros por nome e e-mail juntos
CREATE INDEX idx_clientes_nome_email ON Clientes(nome, email);

-- Índice em tabela com muitos registros para acelerar WHERE em datas
CREATE INDEX idx_alugueis_data_aluguel ON Alugueis(data_aluguel);
