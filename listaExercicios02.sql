DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN
    SELECT * FROM Autor;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    SELECT COUNT(Livro.Titulo) AS TotalLivros
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    DECLARE contador INT;

    SELECT COUNT(*) INTO contador
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;

    IF contador > 0 THEN
        SELECT 'Existem livros nesta categoria.' AS Mensagem;
    ELSE
        SELECT 'Não existem livros nesta categoria.' AS Mensagem;
    END IF;
END //
DELIMITER ;
