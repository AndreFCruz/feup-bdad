.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

-- Interrogation: Client allergic to dishes
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
       Dish.ID = Contains.Dish AND
       Ingredient.ID = Allergy.Ingredient
ORDER BY  Client.Name;

COMMIT TRANSACTION;