use biblioteca;
select titulo, nome_autor
from livro, livro_autor
where livro.cod_livro = livro_autor.cod_livro;