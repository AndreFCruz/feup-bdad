.mode	columns

.headers	on

.nullvalue	NULL

 -- Interrogation: All the Staff Information's.
 SELECT *
 FROM ((Staff NATURAL LEFT JOIN Chef) NATURAL LEFT JOIN Cook) NATURAL LEFT JOIN Server
 ORDER BY Staff.Name;
