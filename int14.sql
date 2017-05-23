.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;

DROP VIEW if exists 'Chef Average Description Size';

BEGIN TRANSACTION;

-- View: Chef Average Description Size
CREATE VIEW [Chef Average Description Size] AS
     SELECT Staff.Name AS ChefName
       FROM Chef,
            Dish,
            Staff
      WHERE Chef.FiscalNum = Dish.Author AND
            Chef.FiscalNum = Staff.FiscalNum
      GROUP BY  Chef.FiscalNum
      ORDER BY  AVG(LENGTH(Dish.Description)) DESC;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;