.mode	columns

.headers	on

-- Verification of Triggers that enforce Complete and Disjoint Generalization	

DELETE FROM Restaurant WHERE ID = -1;
DELETE FROM Staff WHERE FiscalNum = 234981200;
DELETE FROM Chef WHERE FiscalNum = 234981200;
DELETE FROM Staff WHERE FiscalNum = 234871110;
DELETE FROM Cook WHERE FiscalNum = 234871110;
DELETE FROM Staff WHERE FiscalNum = 273849164;
DELETE FROM Server WHERE FiscalNum = 273849164;

-- Testing Complete Generalization
INSERT INTO Restaurant VALUES (-1, 123456879, "Test Restaurant", "Test Street");
SELECT * FROM Restaurant;
SELECT * FROM Chef;
SELECT * FROM Staff;
INSERT INTO ChefView VALUES ("Marco Silva", 1000, 923478230, 234981200, -1, 2);
SELECT * FROM Chef;
SELECT * FROM Staff;

SELECT * FROM Cook;
INSERT INTO CookView VALUES ("Mary Jane", 800, 912374008, 234871110, -1, 234981200);
SELECT * FROM Cook;
SELECT * FROM Staff;

SELECT * FROM Server;
INSERT INTO ServerView VALUES ("Romanov Ishutin", 550, 997827101, 273849164, -1, 18);
SELECT * FROM Server;
SELECT * FROM Staff;

-- Testing Disjoint Generalization
-- This should not result in inserts as primary key is already in use
SELECT * FROM Chef;
INSERT INTO ChefView VALUES ("Romanov Ishutin", 550, 997827101, 273849164, -1, 2);
SELECT * FROM Chef;
SELECT * FROM Staff;

SELECT * FROM Cook;
INSERT INTO CookView VALUES ("Marco Silva", 1000, 923478230, 234981200, -1, 273849164);
SELECT * FROM Cook;
SELECT * FROM Staff;

SELECT * FROM Server;
INSERT INTO ServerView VALUES ("Mary Jane", 800, 912374008, 234871110, -1, 18);
SELECT * FROM Server;
SELECT * FROM Staff;


-------------
-- TO FAIL
INSERT INTO Staff VALUES (111000001, "TestStaff1", 1000, 111000002, 0);
INSERT INTO Staff VALUES (111000003, "TestStaff2", 1232, 111000004, 0);
INSERT INTO Staff VALUES (111000005, "TestStaff3", 1312, 111000006, 0);
