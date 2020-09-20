use empresa_claro;
UPDATE funcionario SET Cpf = "94377554355" WHERE funcionario.Cpf = "99988777767";
-- TRABALHA_EM referencia funcionário através da chave estrangeira Fcpf
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`empresa_claroalvino`.`trabalha_em`, CONSTRAINT `trabalha_em_ibfk_1` FOREIGN KEY (`Fcpf`) REFERENCES `funcionario` (`Cpf`))