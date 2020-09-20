use empresa_claro;
SELECT Pnome FROM funcionario  WHERE Sexo IN (SELECT Sexo FROM dependente WHERE Fcpf = Cpf);