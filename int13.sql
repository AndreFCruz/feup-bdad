.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;

DROP VIEW if exists 'Client Average Amount Spent';

BEGIN TRANSACTION;

-- View: Client Average Amount Spent
CREATE VIEW [Client Average Amount Spent] AS
    SELECT ClientName,
           RestaurantName,
           AVG(Amount) as AverageAmount
      FROM (
               SELECT Client.Name AS ClientName,
                      Restaurant.Name AS RestaurantName,
                      RTransaction.Amount AS Amount
                 FROM Client,
                      ROrder,
                      Restaurant,
                      RTransaction
                WHERE Client.FiscalNum = ROrder.Client AND
                      ROrder.Restaurant = Restaurant.ID AND
                      ROrder.RTransaction = RTransaction.ID
                ORDER BY  ClientName,
                          RestaurantName
           )
     GROUP BY ClientName,
              RestaurantName;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;