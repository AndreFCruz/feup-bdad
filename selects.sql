--
-- File generated with SQLiteStudio v3.1.1 on qua mai 17 20:22:47 2017
--
-- Text encoding used: UTF-8
--
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


-- View: Client allergic to dishes
CREATE VIEW [Client allergic to dishes] AS
    SELECT DISTINCT Client.FiscalNum,
                    Client.Name,
                    Dish.Name AS allergicToDish
      FROM Allergy,
           Client,
           Ingredient,
           Contains,
           Dish
     WHERE Allergy.Client = Client.FiscalNum AND 
           Ingredient.ID = Contains.Ingredient AND 
           Ingredient.ID = Allergy.Ingredient;


-- View: Clients total transaction
CREATE VIEW [Clients total transaction] AS
    SELECT SUM(RTransaction.Amount) AS TotalAmount,
           Client.Name
      FROM RTransaction,
           Client
     WHERE RTransaction.FiscalNum = Client.FiscalNum
     GROUP BY Client.Name
     ORDER BY TotalAmount DESC;


-- View: Cook's specialties
CREATE VIEW [Cook's specialties] AS
    SELECT DISTINCT Staff.Name AS StaffName,
                    Dish.Name AS DishName
      FROM Specialty,
           Category,
           Staff,
           Dish
     WHERE Specialty.Category = Category.ID AND 
           Specialty.Cook = Staff.FiscalNum AND 
           Dish.Category = Specialty.Category
     ORDER BY Staff.Name;


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


-- View: Most commom table for client
CREATE VIEW [Most commom table for client] AS
    SELECT Client.Name,
           ROrder.TableID,
           ROrder.Restaurant,
           MAX(cnt) AS Frequency
      FROM (
               SELECT Client.Name,
                      ROrder.TableID,
                      ROrder.Restaurant,
                      COUNT( * ) AS cnt
                 FROM ROrder,
                      RTable,
                      Client
                WHERE ROrder.TableID = RTable.ID AND 
                      ROrder.Restaurant = RTable.Restaurant AND 
                      ROrder.Client = Client.FiscalNum
                GROUP BY Client.Name,
                         ROrder.TableID
           )
     GROUP BY Name;


-- View: Restaurant Expense
CREATE VIEW [Restaurant Expense] AS
    SELECT Restaurant.Name,
           SUM(Staff.Salary) AS Expense
      FROM Restaurant,
           Staff
     WHERE Restaurant.ID = Staff.Restaurant
     GROUP BY Restaurant.Name
     ORDER BY Expense DESC;


-- View: Restaurant TransactionTotal
CREATE VIEW [Restaurant TransactionTotal] AS
    SELECT Restaurant.Name,
           SUM(RTransaction.Amount) AS TransactionsTotal
      FROM Restaurant,
           RTransaction,
           ROrder,
           RTable
     WHERE RTransaction.ID = ROrder.RTransaction AND 
           ROrder.TableID = RTable.ID AND 
           RTable.Restaurant = Restaurant.ID
     GROUP BY Restaurant.Name
     ORDER BY TransactionsTotal DESC;


-- View: Servers tips rank
CREATE VIEW [Servers tips rank] AS
    SELECT Staff.FiscalNum,
           Staff.Name,
           Server.Tips,
           Restaurant.Name AS Restaurant
      FROM Staff,
           Server,
           Restaurant
     WHERE Staff.FiscalNum = Server.FiscalNum AND 
           Restaurant.ID = Staff.Restaurant
     ORDER BY Server.Tips DESC;


-- View: Chef with most allergic cooks, for client
CREATE VIEW [Clients Allergenic Chef] AS
    SELECT ClientName,
           MAX(StaffName) as Chef
      FROM (
               SELECT Client.Name AS ClientName,
                      Staff.Name AS StaffName,
                      COUNT(*)
                 FROM Client,
                      Allergy,
                      Contains,
                      Dish,
                      Chef,
                      Staff
                WHERE Client.FiscalNum = Allergy.Client AND 
                      Allergy.Ingredient = Contains.Ingredient AND
                      Contains.Dish = Dish.ID AND
                      Dish.Author = Chef.FiscalNum AND
                      Chef.FiscalNum = Staff.FiscalNum
                GROUP BY  Client.Name,
                          Staff.Name
           )
     GROUP BY ClientName;


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
