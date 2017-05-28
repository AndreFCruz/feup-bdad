.mode	columns

.headers	on

.nullvalue	NULL


-- Interrogation: Union of all the people that are related to the Restaurant (Staff + Clients)
SELECT Client.Name AS Name,
       Client.FiscalNum AS FiscalNum
  FROM Client
UNION
SELECT Staff.Name AS Name,
       Staff.FiscalNum AS FiscalNum
  FROM Staff;
