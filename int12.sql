.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;

DROP VIEW if exists 'Server Tips for Client & Order';

BEGIN TRANSACTION;

-- View: Server Tips for Client & Order
CREATE VIEW [Server Tips for Client & Order] AS
      SELECT Staff.Name AS StaffName,
            (Server.Tips / COUNT(ROrder.ID)) AS AverageTip 
       FROM Server,
            Staff,
            Responsible,
            ROrder
      WHERE Server.FiscalNum = Staff.FiscalNum AND
            Server.FiscalNum = Responsible.Server AND
            Responsible.TableID = ROrder.TableID AND
            Responsible.Restaurant = ROrder.Restaurant
      GROUP BY  Staff.Name;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;