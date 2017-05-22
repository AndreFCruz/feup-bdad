.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: Beverage  most ordered by restaurant
CREATE VIEW [Beverage  most ordered by restaurant] AS
    SELECT RestaurantName,
           BeverageName,
           MAX(cnt) AS MaxBought
      FROM (
               SELECT Restaurant.Name AS RestaurantName,
                      Beverage.Name AS BeverageName,
                      Count( * ) AS cnt
                 FROM Restaurant,
                      Beverage,
                      OrderBeverage,
                      ROrder
                WHERE OrderBeverage.Beverage = Beverage.ID AND 
                      OrderBeverage.ROrder = ROrder.ID AND 
                      ROrder.Restaurant = Restaurant.ID
                GROUP BY Restaurant.Name,
                         Beverage.Name
           )
     GROUP BY RestaurantName;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;