.mode	columns

.headers	on

.nullvalue	NULL

-- Interrogation: Clients that are Companies or Societies.
SELECT Client.Name AS Names
  FROM Client
 WHERE Client.Name LIKE '%Empresa%' OR Client.Name LIKE '%Sociedade%'
ORDER BY Client.Name;

