CREATE TRIGGER update_Faculties
ON Faculties
AFTER UPDATE
AS
BEGIN
  UPDATE Faculties
  SET modifiedDate = GETDATE()
  WHERE facultyID IN (SELECT facultyID FROM inserted)
END;