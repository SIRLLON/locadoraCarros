INSERT INTO Categorias (nome_categoria)
SELECT 'Clássico'
WHERE NOT EXISTS (
    SELECT 1 FROM Categorias WHERE nome_categoria = 'Clássico'
);
