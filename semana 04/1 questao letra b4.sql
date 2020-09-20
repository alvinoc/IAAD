use biblioteca;
select titulo
from livro
where cod_livro = (select cod_livro from livro_emprestimo where data_emprestimo between '2020-08-01' AND '2020-09-01');