.mode	columns

.headers	on

.nullvalue	NULL

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

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;