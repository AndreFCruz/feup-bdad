.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: Most commom table for client
CREATE VIEW [Most commom table for client] AS
    SELECT Client.Name,
           ROrder.TableID,
           ROrder.Restaurant,
           MAX(cnt) AS Frequency
      FROM (
               SELECT Client.Name,
                      ROrder.TableID,
                      ROrder.Restaurant,
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
PRAGMA foreign_keys = on;