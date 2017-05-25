.mode	columns

.headers	on

--Test Trigger that verifies if the Client is allergic to the dish he is ordering.

SELECT * FROM ROrder;
SELECT * FROM RTransaction;
SELECT * FROM OrderDish;
-- Test to Fail
INSERT INTO OrderDish VALUES (23, 11);
SELECT * FROM OrderDish;
-- Test to Pass
INSERT INTO OrderDish VALUES (23, 10);
SELECT * FROM OrderDish;