.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

-- Interrogation: Servers ordered by tips received
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