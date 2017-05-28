.mode	columns

.headers	on

.nullvalue	NULL

-- Interrogation: Average Tip per Client served.
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
GROUP BY  Staff.Name
ORDER BY AverageTip DESC;
