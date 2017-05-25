-- Trigger that grants that a ROrder's Date and Time is previous to its associated Transaction

SELECT * FROM RTransaction;
SELECT * FROM ROrder;
-- Error Test
UPDATE ROrder SET RTransaction = 3 WHERE ID = 11;
SELECT * FROM ROrder;
-- Good Test
UPDATE ROrder SET RTransaction = 21 WHERE ID = 21;
SELECT * FROM ROrder;
SELECT * FROM RTransaction;