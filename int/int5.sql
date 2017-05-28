.mode	columns

.headers	on

.nullvalue	NULL

-- Interrogation: Cook's specialties
SELECT DISTINCT Staff.Name AS StaffName,
                Dish.Name AS DishName
  FROM (Category JOIN (Dish NATURAL JOIN Specialty) T1 ON T1.Category = Category.ID) T2 JOIN Staff ON T2.Cook = Staff.FiscalNum
 ORDER BY Staff.Name;
