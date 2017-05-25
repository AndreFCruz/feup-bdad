PRAGMA foreign_keys = off;

-- Load respective Views
.read int15.sql

-- Triggers to enforce Complete and Disjoint Generalization

DROP TRIGGER if exists InsertChef;
CREATE TRIGGER InsertChef
Instead of insert on ChefView
For each row
When not exists (SELECT * FROM Server, Cook WHERE
												New.FiscalNum = Server.FiscalNum OR
												New.FiscalNum = Cook.FiscalNum)
BEGIN
	Insert into Chef (FiscalNum, NumMichelinStars) SELECT New.FiscalNum, New.NumMichelinStars;
	Insert into Staff (FiscalNum, Name, Salary, PhoneNum, Restaurant) SELECT New.FiscalNum, New.Name, New.Salary, New.PhoneNum, New.Restaurant;
END;


DROP TRIGGER if exists InsertCook;
CREATE TRIGGER InsertCook
Instead of insert on CookView
For each row
When not exists (SELECT * FROM Server, Chef WHERE
												New.FiscalNum = Server.FiscalNum OR
												New.FiscalNum = Chef.FiscalNum)
BEGIN
	Insert into Cook values (New.FiscalNum, New.Chef);
	Insert into Staff values (New.FiscalNum, New.Name, New.Salary, New.PhoneNum, New.Restaurant);
END;

DROP TRIGGER if exists InsertServer;
CREATE TRIGGER InsertServer
Instead of insert on ServerView
For each row
When not exists (SELECT * FROM Chef, Cook WHERE
												New.FiscalNum = Chef.FiscalNum OR
												New.FiscalNum = Cook.FiscalNum)
BEGIN
	Insert into Server values (New.FiscalNum, New.Tips);
	Insert into Staff values (New.FiscalNum, New.Name, New.Salary, New.PhoneNum, New.Restaurant);
END;