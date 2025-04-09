UPDATE Pagamentos
SET metodo_pagamento = 'Cartão de Crédito'
WHERE LOWER(metodo_pagamento) = 'cartao';
