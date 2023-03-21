CREATE TRIGGER update_Books
ON Books
AFTER UPDATE
AS
BEGIN
  UPDATE Books
  SET modifiedDate = GETDATE()
  WHERE bookID IN (SELECT bookID FROM inserted)
END;



