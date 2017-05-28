.mode	columns

.headers	on

.nullvalue	NULL


 -- Client's Allergic to 'Espinafres' AND 'Feijão Verde'
 SELECT Client.Name
   FROM	(Allergy JOIN Client ON Allergy.Client = Client.FiscalNum) T1 JOIN Ingredient ON T1.Ingredient = Ingredient.ID
  WHERE Ingredient.Name == 'Feijão Verde'
INTERSECT 
 SELECT Client.Name
   FROM	(Allergy JOIN Client ON Allergy.Client = Client.FiscalNum) T1 JOIN Ingredient ON T1.Ingredient = Ingredient.ID
  WHERE Ingredient.Name == 'Espinafres';  

