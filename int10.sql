.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: Servers tips rank
CREATE VIEW [Servers tips rank] AS
    SELECT Staff.FiscalNum,
           Staff.Name,
           Server.Tips,
           Restaurant.Name AS Restaurant
      FROM Staff,
           Server,
           Restaurant
     WHERE Staff.FiscalNum = Server.FiscalNum AND 
           Restaurant.ID = Staff.Restaurant
     ORDER BY Server.Tips DESC;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;