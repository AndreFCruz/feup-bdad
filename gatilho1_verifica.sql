-- Verification of Triggers that enforce Complete and Disjoint Generalization
	
.read int15.sql

-- Testing Complete Generalization

SELECT * FROM Chef;
SELECT * FROM Staff;
INSERT INTO ChefView VALUES ("Marco Silva", 1000, 923478230, 234981200, 1, 2);
SELECT * FROM Chef;
SELECT * FROM Staff;

SELECT * FROM Cook;
SELECT * FROM Staff;
INSERT INTO CookView VALUES ("Mary Jane", 800, 912374008, 234871110, 4, 807238721);
SELECT * FROM Cook;
SELECT * FROM Staff;

SELECT * FROM Server;
SELECT * FROM Staff;
INSERT INTO ServerView VALUES ("Romanov Ishutin", 550, 997827101, 273849164, 2, 18);
SELECT * FROM Server;
SELECT * FROM Staff;

-- Missing Test on insert into Staff -> Get an ERROR

-- Testing Disjoint Generalization
SELECT * FROM Chef;
SELECT * FROM Staff;
INSERT INTO ChefView VALUES ("Romanov Ishutin", 550, 997827101, 273849164, 1, 2);
SELECT * FROM Chef;
SELECT * FROM Staff;

SELECT * FROM Cook;
SELECT * FROM Staff;
INSERT INTO CookView VALUES ("Marco Silva", 1000, 923478230, 234981200, 1, 238924873);
SELECT * FROM Cook;
SELECT * FROM Staff;

SELECT * FROM Server;
SELECT * FROM Staff;
INSERT INTO ServerView VALUES ("Mary Jane", 800, 912374008, 234871110, 4, 18);
SELECT * FROM Server;
SELECT * FROM Staff;