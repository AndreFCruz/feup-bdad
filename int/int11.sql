.mode	columns

.headers	on

.nullvalue	NULL

-- Interrogation: Client and the Chef who authors the highest number of dishes the client is allergic to.
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
