use biblioteca;
select qt_copia
from livro_copias
where cod_unidade = (select cod_unidade from unidade_biblioteca where nome_unidade = 'sede_ufrpe') and cod_livro = (select cod_livro from livro where titulo = 'sistema de banco de dados');