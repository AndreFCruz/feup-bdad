PRAGMA foreign_keys = on;

-- Triggers to enforce Complete and Disjoint Generalization

DROP TRIGGER if exists InsertChef;
CREATE TRIGGER InsertChef
Instead of insert on ChefView
For each row
When not exists (SELECT * FROM Server, Cook WHERE
												New.FiscalNum = Server.FiscalNum OR
												New.FiscalNum = Cook.FiscalNum)
BEGIN
	Insert into Staff values (New.FiscalNum, New.Name, New.Salary, New.PhoneNum, New.Restaurant);
	Insert into Chef values (New.FiscalNum, New.NumMichelinStars);
END;


DROP TRIGGER if exists InsertCook;
CREATE TRIGGER InsertCook
Instead of insert on CookView
For each row
When not exists (SELECT * FROM Server, Chef WHERE
												New.FiscalNum = Server.FiscalNum OR
												New.FiscalNum = Chef.FiscalNum)
BEGIN
	Insert into Staff values (New.FiscalNum, New.Name, New.Salary, New.PhoneNum, New.Restaurant);
	Insert into Cook values (New.FiscalNum, New.Chef);
END;

DROP TRIGGER if exists InsertServer;
CREATE TRIGGER InsertServer
Instead of insert on ServerView
For each row
When not exists (SELECT * FROM Chef, Cook WHERE
												New.FiscalNum = Chef.FiscalNum OR
												New.FiscalNum = Cook.FiscalNum)
BEGIN
	Insert into Staff values (New.FiscalNum, New.Name, New.Salary, New.PhoneNum, New.Restaurant);
	Insert into Server values (New.FiscalNum, New.Tips);
END;