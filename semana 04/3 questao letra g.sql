use empresa_claro;
DELETE FROM departamento WHERE departamento.Dnome = "Matriz";
-- Não é possível deletar o departamento matriz, por que existem funcionários sendo referenciando pela chave estrangeira Dnr
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`empresa_claroalvino`.`funcionario`, CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`Dnr`) REFERENCES `departamento` (`Dnumero`))
