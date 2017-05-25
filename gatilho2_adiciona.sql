PRAGMA foreign_keys = on;

DROP TRIGGER InsertTransactionTime;

BEGIN TRANSACTION;

CREATE TRIGGER InsertTransactionTime
Before update on RTransaction
For each row
When (New.Date < ROrder.Date OR (New.Date == ROrder.Date AND New.Time < ROrder.Time)) 
					(SELECT ROrder.Time, ROrder.Date, RTransaction.Date, RTransaction.Time FROM ROrder, RTransaction WHERE 
					ROrder.RTransaction = RTransaction.ID)
BEGIN
	SELECT raise(rollback, 'RTransaction must ocorre after ROrder');
END;

COMMIT TRANSACTION;

-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

CREATE TRIGGER InsertTransactionTime
Before update on Payment
For each row
When (New.Date < ROrder.Date OR (New.Date == ROrder.Date AND New.Time < ROrder.Time)) 
					(SELEC ROrder.Time, ROrder.Date, RTransaction.Date, RTransaction.Time FROM Payment, ROrder, RTransaction WHERE 
					Payment.ROrder == ROrder.ID AND
					Payment.RTransaction = RTransaction.ID)
BEGIN
	SELECT raise(rollback, 'RTransaction must ocorre after ROrder');
END;

COMMIT TRANSACTION;
