.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

-- Interrogation: Restaurant most ordered Beverage and Dish
SELECT beverage.RestaurantName AS Restaurant,
       DishName,
       FrequencyD,
       BeverageName,
       FrequencyB
  FROM (
            (SELECT RestaurantName,
                   BeverageName,
                   MAX(BeverageCount) AS FrequencyB
              FROM (
                       SELECT Restaurant.Name AS RestaurantName,
                              Beverage.Name AS BeverageName,
                              Count( * ) AS BeverageCount
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
             GROUP BY RestaurantName ) beverage

        JOIN 

            (SELECT RestaurantName,
                   DishName,
                   MAX(DishCount) AS FrequencyD
              FROM (
                       SELECT Restaurant.Name AS RestaurantName,
                              Dish.Name AS DishName,
                              Count( * ) AS DishCount
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
             GROUP BY RestaurantName) dish

      ON dish.RestaurantName = beverage.RestaurantName);

COMMIT TRANSACTION;