--Test Trigger that verifies if the Client is allergic to the dish he is ordering.

SELECT * FROM ROrder;
SELECT * FROM RTransaction;
SELECT * FROM OrderDish;
-- Error Test
INSERT INTO OrderDish VALUES (23, 11);
SELECT * FROM OrderDish;
-- Good Test
INSERT INTO OrderDish VALUES (23, 10);
SELECT * FROM OrderDish;