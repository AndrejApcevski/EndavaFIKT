CREATE TRIGGER Borrows_Students
ON Borrows
AFTER UPDATE
AS
BEGIN
  UPDATE Borrows
  SET modifiedDate = GETDATE()
  WHERE borrowID IN (SELECT borrowID FROM inserted)
END;

