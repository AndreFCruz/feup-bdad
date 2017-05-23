PRAGMA foreign_keys = on;

DROP TRIGGER InsertOrderDish

BEGIN TRANSACTION;

CREATE TRIGGER InsertOrderDish
Before insert on ROrder
For each row
When exists ()
BEGIN
	

COMMIT TRANSACTION;
