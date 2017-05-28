.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = on;


-- Interrogation: Average Restaurant Stay Time, in Minutes
SELECT RestaurantName,
       AVG(StayTime) AS AverageStayTime
  FROM (
           SELECT Restaurant.Name AS RestaurantName,
           		  (julianday(RTransaction.Date, RTransaction.Time) - julianday(ROrder.Date, ROrder.Time)) * 24 * 60 AS StayTime
             FROM Restaurant,
                  ROrder,
                  RTransaction
            WHERE ROrder.RTransaction = RTransaction.ID AND 
                  ROrder.Restaurant = Restaurant.ID
       )
 GROUP BY RestaurantName;
