CREATE TRIGGER update_Authors
ON Authors
AFTER UPDATE
AS
BEGIN
  UPDATE Authors
  SET modifiedDate = GETDATE()
  WHERE authorID IN (SELECT authorID FROM inserted)
END;