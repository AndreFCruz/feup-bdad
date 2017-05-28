.mode	columns

.headers	on

.nullvalue	NULL


SELECT S1.ClientName,
       S1.Category,
       S2.RestaurantName
  FROM ( 
         (SELECT ClientName,
                 Category,
                 Max(cnt)
            FROM (
                    SELECT DISTINCT Client.Name AS ClientName,
                           Category.Name AS Category,
                           COUNT(*) AS cnt
                      FROM (((Client JOIN ROrder ON Client.FiscalNum = ROrder.Client) R1 JOIN OrderDish ON R1.ID = OrderDish.ROrder) R2
                            JOIN Dish ON R2.Dish = Dish.ID) R3 JOIN Category ON R3.Category = Category.ID
                      GROUP BY ClientName,
                               Category
                 )
            GROUP BY ClientName ) S1
     JOIN
         (SELECT Category,
                 RestaurantName,
                 MAX(cnt)
            FROM (
                    SELECT Category.Name AS Category,
                           Restaurant.Name AS RestaurantName,                          
                           COUNT (*) AS cnt
                      FROM (((Category JOIN Dish ON Category.ID = Dish.Category) T1 JOIN Chef ON T1.Author = Chef.FiscalNum) T2 
                            JOIN Staff ON Staff.FiscalNum = T2.FiscalNum) T3 JOIN Restaurant ON T3.Restaurant = Restaurant.ID
                    GROUP BY Restaurant.Name,
                             Category.Name
                 )
          GROUP BY Category) S2
    ON S1.Category = S2.Category);
