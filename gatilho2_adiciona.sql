PRAGMA foreign_keys = on;

DROP TRIGGER InsertOrderDish;

BEGIN TRANSACTION;

CREATE TRIGGER InsertOrderDish
Before insert on ROrder
For each row
When exists (SELECT ROrder.Client FROM ROrder, Contains, Allergy WHERE 
					Allergy.Client = ROrder.Client AND
					Contains.Ingredient = Allergy.Ingredient AND
					Contains.Dish = New.Dish AND
					New.ROrder = ROrder.ID)
BEGIN
	SELECT raise(rollback, 'Client is allergic to added dish');
END;

COMMIT TRANSACTION;
