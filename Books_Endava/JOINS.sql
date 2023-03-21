SELECT *
FROM Books
INNER JOIN Borrows
ON Books.bookID = Borrows.bookID
WHERE Borrows.bookID = 329

SELECT Borrows.borrowID
FROM Books
LEFT OUTER JOIN Borrows
ON Books.bookID = Borrows.bookID

SELECT Borrows.borrowID
FROM Books
RIGHT OUTER JOIN Borrows
ON Books.bookID = Borrows.bookID
WHERE Borrows.bookID = 329

SELECT Borrows.borrowID
FROM Books
FULL OUTER JOIN Borrows
ON Books.bookID = Borrows.bookID
WHERE Borrows.bookID = 329