.mode	columns

.headers	on

-- Trigger that guarantees that a ROrder's Date and Time is previous to its associated RTransaction

-- Overhead necessary for testing
DELETE FROM Restaurant WHERE ID = -1;
INSERT INTO Restaurant VALUES (-1, 123456879, "Test Restaurant", "Test Street");
DELETE FROM Client WHERE FiscalNum = 111000005;
INSERT INTO Client VALUES (111000005, "Test Client", 111000005);
DELETE FROM RTable WHERE ID = -1;
INSERT INTO RTable VALUES (-1, -1);
-- --

INSERT INTO ROrder VALUES (-1, '2017-02-17', '19:20', -1, -1, 111000005, NULL);
INSERT INTO ROrder VALUES (-2, '2017-02-18', '20:10', -1, -1, 111000005, NULL);
INSERT INTO ROrder VALUES (-3, '2017-02-18', '20:20', -1, -1, 111000005, NULL);
INSERT INTO RTransaction VALUES (-1, 100, '2017-01-15', '21:00', 111000005);
INSERT INTO RTransaction VALUES (-2, 100, '2017-02-17', '18:00', 111000005);
INSERT INTO RTransaction VALUES (-3, 100, '2017-02-17', '20:00', 111000005);
INSERT INTO RTransaction VALUES (-4, 100, '2017-02-18', '20:00', 111000005);
INSERT INTO RTransaction VALUES (-5, 100, '2017-02-18', '21:00', 111000005);

SELECT * FROM RTransaction;
SELECT * FROM ROrder;

-- Test to Fail
UPDATE ROrder SET RTransaction = -1 WHERE ROrder.ID = -1;
UPDATE ROrder SET RTransaction = -2 WHERE ROrder.ID = -1;
UPDATE ROrder SET RTransaction = -4 WHERE ROrder.ID = -2;
UPDATE ROrder SET RTransaction = -4 WHERE ROrder.ID = -3;
SELECT * FROM ROrder;

-- Test to Pass
UPDATE ROrder SET RTransaction = -3 WHERE ROrder.ID = -1;
UPDATE ROrder SET RTransaction = -5 WHERE ROrder.ID = -2;
UPDATE ROrder SET RTransaction = -5 WHERE ROrder.ID = -3;
SELECT * FROM ROrder;

