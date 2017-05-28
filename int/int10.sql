.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

/*-- Interrogation: Servers ordered by tips received
SELECT Staff.FiscalNum,
       Staff.Name,
       Server.Tips,
       Restaurant.Name AS Restaurant
  FROM Staff,
       Server,
       Restaurant
 WHERE Staff.FiscalNum = Server.FiscalNum AND 
       Restaurant.ID = Staff.Restaurant
 ORDER BY Server.Tips DESC;*/

 -- Interrogation: All the Staff Information's.
 SELECT *
 FROM ((Staff NATURAL LEFT JOIN Chef) NATURAL LEFT JOIN Cook) NATURAL LEFT JOIN Server;

COMMIT TRANSACTION;