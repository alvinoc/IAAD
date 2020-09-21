use biblioteca;
select usuario.nome, livro.titulo, unidade_biblioteca.nome_unidade
from livro_emprestimo
inner join usuario
on usuario.num_cartao = livro_emprestimo.num_cartao
inner join livro
on livro.cod_livro = livro_emprestimo.cod_livro
inner join unidade_biblioteca
on livro_emprestimo.cod_livro = unidade_biblioteca.cod_unidade
where usuario.nome like "a%";