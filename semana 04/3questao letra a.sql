use empresa_claro;
SELECT Pnome FROM funcionario  WHERE Cpf IN (SELECT Fcpf FROM trabalha_em WHERE Pnr = 10 AND T.Horas > 15);