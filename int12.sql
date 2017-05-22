.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;

DROP VIEW if exists 'Server Tips for Client & Order';

BEGIN TRANSACTION;

--TODO: Need to Finish this One

-- View: Server Tips for Client & Order
CREATE VIEW [Server Tips for Client & Order] AS
    /*SELECT ClientName,
           MAX(StaffName) as Chef
      FROM (*/
               SELECT Staff.Name AS StaffName,
                      ROrder.ID
                 FROM Server,
                      Staff,
                      Responsible,
                      ROrder
                WHERE Server.FiscalNum = Staff.FiscalNum AND
                      Server.FiscalNum = Responsible.Server AND
                      Responsible.TableID = ROrder.TableID AND
                      Responsible.Restaurant = ROrder.Restaurant
                GROUP BY  Staff.Name;
           --)
     --GROUP BY ClientName;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;