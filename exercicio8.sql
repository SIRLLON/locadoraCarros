START TRANSACTION;
UPDATE Clientes
SET nome = CONCAT('[ATIVO] ', nome)
WHERE cpf LIKE '00000000%' AND nome NOT LIKE '[ATIVO]%'
LIMIT 100;
COMMIT;

START TRANSACTION;
UPDATE Clientes
SET nome = CONCAT('[ATIVO] ', nome)
WHERE cpf LIKE '00000000%' AND nome NOT LIKE '[ATIVO]%'
LIMIT 100;
COMMIT;

START TRANSACTION;
UPDATE Clientes
SET nome = CONCAT('[ATIVO] ', nome)
WHERE cpf LIKE '00000000%' AND nome NOT LIKE '[ATIVO]%'
LIMIT 100;
COMMIT;

START TRANSACTION;
UPDATE Clientes
SET nome = CONCAT('[ATIVO] ', nome)
WHERE cpf LIKE '00000000%' AND nome NOT LIKE '[ATIVO]%'
LIMIT 100;
COMMIT;

START TRANSACTION;
UPDATE Clientes
SET nome = CONCAT('[ATIVO] ', nome)
WHERE cpf LIKE '00000000%' AND nome NOT LIKE '[ATIVO]%'
LIMIT 100;
COMMIT;
