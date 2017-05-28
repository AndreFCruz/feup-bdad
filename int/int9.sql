.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

-- Interrogation: Restaurant's total amount transactioned.
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