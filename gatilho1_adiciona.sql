PRAGMA foreign_keys = on;

DROP TRIGGER InsertCook

BEGIN TRANSACTION;

CREATE TRIGGER InsertCook
Before insert on Cook
For each row
BEGIN
	Insert into Staff values ()

COMMIT TRANSACTION;