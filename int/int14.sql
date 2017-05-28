.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

-- Interrogation: Chef ordered by Average Description Size
SELECT Staff.Name AS ChefName
FROM Chef,
     Dish,
     Staff
WHERE Chef.FiscalNum = Dish.Author AND
      Chef.FiscalNum = Staff.FiscalNum
GROUP BY  Chef.FiscalNum
ORDER BY  AVG(LENGTH(Dish.Description)) DESC;

COMMIT TRANSACTION;