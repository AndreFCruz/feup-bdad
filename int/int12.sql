.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;

DROP VIEW if exists 'Server Average Tip for Client';

BEGIN TRANSACTION;

-- View: Server Tips for Client & Order
CREATE VIEW [Server Average Tip for Client] AS
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