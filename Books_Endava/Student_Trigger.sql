CREATE TRIGGER update_Students
ON Students
AFTER UPDATE
AS
BEGIN
  UPDATE Students
  SET modifiedDate = GETDATE()
  WHERE studentID IN (SELECT studentID FROM inserted)
END;

