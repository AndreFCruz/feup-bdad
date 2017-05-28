.mode	columns

.headers	on

.nullvalue	NULL

BEGIN TRANSACTION;

-- Interrogation: Cook's specialties

SELECT DISTINCT Staff.Name AS StaffName,
                Dish.Name AS DishName
  FROM Specialty,
       Category,
       Staff,
       Dish
 WHERE Specialty.Category = Category.ID AND 
       Specialty.Cook = Staff.FiscalNum AND 
       Dish.Category = Specialty.Category
 ORDER BY Staff.Name;

COMMIT TRANSACTION;