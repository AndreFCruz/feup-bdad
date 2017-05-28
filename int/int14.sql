.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

-- Interrogation: Chef ordered by Average Description Size
/*SELECT Staff.Name AS ChefName
FROM Chef,
     Dish,
     Staff
WHERE Chef.FiscalNum = Dish.Author AND
      Chef.FiscalNum = Staff.FiscalNum
GROUP BY  Chef.FiscalNum
ORDER BY  AVG(LENGTH(Dish.Description)) DESC;*/

-- Interrogation: Clients that are Companies or Societies.
SELECT Client.Name AS Names
  FROM Client
 WHERE Client.Name LIKE '%Empresa%' OR Client.Name LIKE '%Sociedade%'
ORDER BY Client.Name;

COMMIT TRANSACTION;