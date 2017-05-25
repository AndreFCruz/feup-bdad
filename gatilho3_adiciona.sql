-- Trigger that verifies if the Client is allergic to the dish he is ordering.

PRAGMA foreign_keys = on;

DROP TRIGGER if exists InsertOrderDish;

BEGIN TRANSACTION;

CREATE TRIGGER InsertOrderDish
Before insert on OrderDish
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
