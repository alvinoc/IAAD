use loja;
-- INSERT INTO Cliente values (1, 'Cliente 1', 'cliente1@gmail.com', '123456789');
-- INSERT INTO Cliente values (2, 'Cliente 2', 'cliente2@gmail.com', '123456789');
-- INSERT INTO Cliente values (3, 'Cliente 3', 'cliente3@gmail.com', '123456789');
-- INSERT INTO Cliente values (4, 'Cliente 4', 'cliente4@gmail.com', '123456789');
-- INSERT INTO Cliente values (5, 'Cliente 5', 'cliente5@gmail.com', '123456789');

-- INSERT INTO Produto values (1, 'Produto 1');
-- INSERT INTO Produto values (2, 'Produto 2');
-- INSERT INTO Produto values (3, 'Produto 3');
-- INSERT INTO Produto values (4, 'Produto 4');
-- INSERT INTO Produto values (5, 'Produto 5');

-- INSERT INTO Pedido values(1, 1, NOW());
-- INSERT INTO Pedido values(2, 2, NOW());
-- INSERT INTO Pedido values(3, 3, NOW());
-- INSERT INTO Pedido values(4, 4, NOW());
-- INSERT INTO Pedido values(5, 5, NOW());

-- INSERT INTO item_pedido values(1, 1, 1, 2, 10.0);
-- INSERT INTO item_pedido values(2, 2, 2, 2, 5.0);

-- DELETE from produto WHERE produto.cod_produto = 1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`loja`.`item_pedido`, CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`) ON UPDATE CASCADE)

-- DELETE from produto WHERE produto.cod_produto = 2;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`loja`.`item_pedido`, CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`) ON UPDATE CASCADE)
 --  as duas acoes acima nao irao funcionar pois o ON DELETE NO ACTION restringe a remoção de uma tupla pai (produto) referenciada por uma tupla filha (itempedido).
 
UPDATE produto set produto.cod_produto = 1 WHERE produto.cod_produto = 6;
-- funciona tudo ok 