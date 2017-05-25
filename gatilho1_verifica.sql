.mode	columns

.headers	on

-- Verification of Triggers that enforce Complete and Disjoint Generalization	

DELETE FROM Restaurant WHERE ID = 0;
DELETE FROM Staff WHERE FiscalNum = 234981200;
DELETE FROM Chef WHERE FiscalNum = 234981200;
DELETE FROM Staff WHERE FiscalNum = 234871110;
DELETE FROM Cook WHERE FiscalNum = 234871110;
DELETE FROM Staff WHERE FiscalNum = 273849164;
DELETE FROM Server WHERE FiscalNum = 273849164;

-- Testing Complete Generalization
INSERT INTO Restaurant VALUES (0, 123456879, "Test Restaurant", "Test Street");
SELECT * FROM Restaurant;
SELECT * FROM Chef;
SELECT * FROM Staff;
INSERT INTO ChefView VALUES ("Marco Silva", 1000, 923478230, 234981200, 0, 2);
SELECT * FROM Chef;
SELECT * FROM Staff;

SELECT * FROM Cook;
INSERT INTO CookView VALUES ("Mary Jane", 800, 912374008, 234871110, 0, 807238721);
SELECT * FROM Cook;
SELECT * FROM Staff;

SELECT * FROM Server;
INSERT INTO ServerView VALUES ("Romanov Ishutin", 550, 997827101, 273849164, 0, 18);
SELECT * FROM Server;
SELECT * FROM Staff;

-- Missing Test on insert into Staff -> Get an ERROR

-- Testing Disjoint Generalization
SELECT * FROM Chef;
INSERT INTO ChefView VALUES ("Romanov Ishutin", 550, 997827101, 273849164, 0, 2);
SELECT * FROM Chef;
SELECT * FROM Staff;

SELECT * FROM Cook;
INSERT INTO CookView VALUES ("Marco Silva", 1000, 923478230, 234981200, 0, 238924873);
SELECT * FROM Cook;
SELECT * FROM Staff;

SELECT * FROM Server;
INSERT INTO ServerView VALUES ("Mary Jane", 800, 912374008, 234871110, 0, 18);
SELECT * FROM Server;
SELECT * FROM Staff;