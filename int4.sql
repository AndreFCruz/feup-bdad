.mode	columns

.headers	on

.nullvalue	NULL

DROP VIEW if exists 'Clients total transaction';

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: Clients total transaction
CREATE VIEW [Clients total transaction] AS
    SELECT SUM(RTransaction.Amount) AS TotalAmount,
           Client.Name
      FROM RTransaction,
           Client
     WHERE RTransaction.FiscalNum = Client.FiscalNum
     GROUP BY Client.Name
     ORDER BY TotalAmount DESC;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;