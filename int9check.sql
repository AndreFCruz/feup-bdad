.mode	columns

.headers	on

.nullvalue	NULL

DROP VIEW if exists 'Restaurant TransactionTotal';

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: Restaurant TransactionTotal
CREATE VIEW [Restaurant TransactionTotal] AS
    SELECT Restaurant.Name,
           SUM(RTransaction.Amount) AS TransactionsTotal
      FROM Restaurant,
           RTransaction,
           ROrder,
           RTable
     WHERE RTransaction.ID = ROrder.RTransaction AND 
           ROrder.TableID = RTable.ID AND 
           RTable.Restaurant = Restaurant.ID
     GROUP BY Restaurant.Name
     ORDER BY TransactionsTotal DESC;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;