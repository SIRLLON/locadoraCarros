DELIMITER //

CREATE PROCEDURE popula_clientes()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 1000 DO
    INSERT INTO Clientes (nome, email, telefone, cpf)
    VALUES (
      CONCAT('Cliente ', i),
      CONCAT('cliente', i, '@email.com'),
      CONCAT('2190000', LPAD(i, 4, '0')),
      LPAD(i, 11, '0')
    );
    SET i = i + 1;
  END WHILE;
END //

DELIMITER ;
