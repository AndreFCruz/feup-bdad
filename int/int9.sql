.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

/*-- Interrogation: Restaurant's total amount transactioned.
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
 ORDER BY TransactionsTotal DESC;*/

 -- Client's Allergic to 'Espinafres' and 'Feijão Verde'
 SELECT Client.Name
   FROM	(Allergy JOIN Client ON Allergy.Client = Client.FiscalNum) T1 JOIN Ingredient ON T1.Ingredient = Ingredient.ID
  WHERE Ingredient.Name == 'Feijão Verde'
INTERSECT 
 SELECT Client.Name
   FROM	(Allergy JOIN Client ON Allergy.Client = Client.FiscalNum) T1 JOIN Ingredient ON T1.Ingredient = Ingredient.ID
  WHERE Ingredient.Name == 'Espinafres';  

COMMIT TRANSACTION;