.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: Average Restaurant Stay Time
CREATE VIEW [Average Restaurant Stay Time] AS
    SELECT RestaurantName,
           AVG(StayTime) AS AverageStayTime
      FROM (
               SELECT Restaurant.Name AS RestaurantName,
                      (RTransaction.Time - ROrder.Time) AS StayTime
                 FROM Restaurant,
                      ROrder,
                      RTransaction
                WHERE ROrder.RTransaction = RTransaction.ID AND 
                      ROrder.Restaurant = Restaurant.ID
           )
     GROUP BY RestaurantName;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;