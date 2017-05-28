.mode	columns

.headers	on

.nullvalue	NULL


-- Interrogation: Restaurant's amount expended paying Staff's salaries.
SELECT Restaurant.Name,
       SUM(Staff.Salary) AS Expense
  FROM Restaurant JOIN Staff ON Restaurant.ID = Staff.Restaurant
 GROUP BY Restaurant.Name
 ORDER BY Expense DESC;

