.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: Cook's specialties
CREATE VIEW ["Cook's specialties"] AS
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
PRAGMA foreign_keys = on;