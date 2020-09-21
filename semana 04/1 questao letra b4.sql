select livro.titulo
 from livro
	inner join livro_emprestimo on (livro.cod_livro = livro_emprestimo.cod_livro and livro_emprestimo.data_emprestimo between '2020-08-01' and '2020-09-01');
