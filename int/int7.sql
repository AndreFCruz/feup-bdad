.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

-- Interrogation: Most Common table for client
SELECT Name,
       TableID,
       Restaurant,
       MAX(cnt) AS Frequency
  FROM (
           SELECT Client.Name AS Name,
                  ROrder.TableID AS TableID,
                  ROrder.Restaurant AS Restaurant,
                  COUNT( * ) AS cnt
             FROM ROrder,
                  RTable,
                  Client
            WHERE ROrder.TableID = RTable.ID AND 
                  ROrder.Restaurant = RTable.Restaurant AND 
                  ROrder.Client = Client.FiscalNum
            GROUP BY Client.Name,
                     ROrder.TableID
       )
 GROUP BY Name;

COMMIT TRANSACTION;