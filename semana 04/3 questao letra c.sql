use empresa_claro;
SELECT Pnome FROM funcionario  WHERE Cpf_supervisor IN (SELECT Cpf FROM funcionario WHERE Pnome = 'Jennifer' AND Unome = 'Souza');