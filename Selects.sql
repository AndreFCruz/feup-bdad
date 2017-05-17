--
-- File generated with SQLiteStudio v3.1.1 on qua mai 17 11:44:45 2017
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

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


-- View: Most commom table for client
CREATE VIEW [Most commom table for client] AS
    SELECT Client.Name,
           ROrder.TableID AS numTable
      FROM ROrder,
           RTable,
           Client
     WHERE ROrder.TableID = RTable.ID AND 
           ROrder.Client = Client.FiscalNum
     ORDER BY numTable DESC;


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


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
