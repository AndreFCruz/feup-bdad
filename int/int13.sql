.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

-- View: Client Average Amount Spent
SELECT ClientName,
       RestaurantName,
       AVG(Amount) as AverageAmount
  FROM (
           SELECT Client.Name AS ClientName,
                  Restaurant.Name AS RestaurantName,
                  RTransaction.Amount AS Amount
             FROM Client,
                  Restaurant,
                  ROrder,
                  RTransaction
            WHERE ROrder.Restaurant = Restaurant.ID AND
                  ROrder.RTransaction = RTransaction.ID AND
                  RTransaction.FiscalNum = Client.FiscalNum
            ORDER BY  ClientName,
                      RestaurantName
       )
 GROUP BY ClientName,
          RestaurantName;

COMMIT TRANSACTION;
