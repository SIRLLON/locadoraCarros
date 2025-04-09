UPDATE Alugueis
SET valor_seguro = 0.00
WHERE seguro = 'Não' AND valor_seguro > 0;
