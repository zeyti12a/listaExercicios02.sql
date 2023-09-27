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

DELIMITER //
CREATE PROCEDURE sp_LivrosAteAno(IN anoPublicacao INT)
BEGIN
    SELECT Titulo
    FROM Livro
    WHERE Ano_Publicacao <= anoPublicacao;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_TitulosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_AdicionarLivro(IN livroTitulo VARCHAR(255), IN editoraID INT, IN anoPublicacao INT, IN numeroPaginas INT, IN categoriaID INT)
BEGIN
    DECLARE livroExiste INT;

    SELECT COUNT(*) INTO livroExiste
    FROM Livro
    WHERE Titulo = livroTitulo;

    IF livroExiste = 0 THEN
        INSERT INTO Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        VALUES (livroTitulo, editoraID, anoPublicacao, numeroPaginas, categoriaID);
        SELECT 'Livro adicionado com sucesso.' AS Mensagem;
    ELSE
        SELECT 'Erro: O livro com este título já existe.' AS Mensagem;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_AutorMaisAntigo()
BEGIN
    SELECT Nome, Sobrenome
    FROM Autor
    WHERE Data_Nascimento = (SELECT MIN(Data_Nascimento) FROM Autor);
END //
DELIMITER ;

