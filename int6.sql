.mode	columns

.headers	on

.nullvalue	NULL

DROP VIEW if exists 'Dish most ordered by Restaurant';

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: Dish most ordered by Restaurant
CREATE VIEW [Dish most ordered by Restaurant] AS
    SELECT RestaurantName,
           DishName,
           MAX(cnt1) AS Max
      FROM (
               SELECT Restaurant.Name AS RestaurantName,
                      Dish.Name AS DishName,
                      Count( * ) AS cnt1
                 FROM Restaurant,
                      Dish,
                      OrderDish,
                      ROrder
                WHERE OrderDish.Dish = Dish.ID AND 
                      OrderDish.ROrder = ROrder.ID AND 
                      ROrder.Restaurant = Restaurant.ID
                GROUP BY Restaurant.Name,
                         Dish.Name
           )
     GROUP BY RestaurantName;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;