.mode	columns

.headers	on

.nullvalue	NULL

-- Interrogation: Client's total transaction
SELECT SUM(RTransaction.Amount) AS TotalAmount,
       Client.Name
  FROM RTransaction,
       Client
 WHERE RTransaction.FiscalNum = Client.FiscalNum
 GROUP BY Client.Name
 ORDER BY TotalAmount DESC;
