PRAGMA foreign_keys = on;

DROP TRIGGER if exists UpdateOrderTransaction;

CREATE TRIGGER UpdateOrderTransaction
after update on ROrder
For each row
When
	(New.Time > (SELECT RTransaction.Time FROM RTransaction WHERE New.RTransaction = RTransaction.ID) AND
		New.Date = (SELECT RTransaction.Date FROM RTransaction WHERE New.RTransaction = RTransaction.ID)) OR
	(New.Date > (SELECT RTransaction.Date FROM RTransaction WHERE New.RTransaction = RTransaction.ID))
BEGIN
	SELECT raise(rollback, 'RTransaction must occur after ROrder');
END;
