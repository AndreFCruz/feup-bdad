.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: Restaurant Expense
CREATE VIEW [Restaurant Expense] AS
    SELECT Restaurant.Name,
           SUM(Staff.Salary) AS Expense
      FROM Restaurant,
           Staff
     WHERE Restaurant.ID = Staff.Restaurant
     GROUP BY Restaurant.Name
     ORDER BY Expense DESC;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;