.mode	columns

.headers	on

.nullvalue	NULL

DROP VIEW if exists AVERAGE_STAY_TIME;

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: Average Restaurant Stay Time, in Minutes
CREATE VIEW [AVERAGE_STAY_TIME] AS
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

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;