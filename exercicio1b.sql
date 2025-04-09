UPDATE Veiculos
SET id_categoria = (
    SELECT id_categoria FROM Categorias WHERE nome_categoria = 'Clássico'
)
WHERE ano < 2010 AND id_veiculo IS NOT NULL;
