PRAGMA foreign_keys = on;

-- Load respective Views
.read int15.sql

-- Triggers to enforce Complete and Disjoint Generalization

DROP TRIGGER if exists InsertChef;
CREATE TRIGGER InsertChef
Instead of insert on ChefView
For each row
When not exists (SELECT * FROM Chef, Server, Cook WHERE
												New.FiscalNum = Chef.FiscalNum OR
												New.FiscalNum = Server.FiscalNum OR
												New.FiscalNum = Cook.FiscalNum)
BEGIN
	Insert into Staff (FiscalNum, Name, Salary, PhoneNum, Restaurant) SELECT New.FiscalNum, New.Name, New.Salary, New.PhoneNum, New.Restaurant;
	Insert into Chef (FiscalNum, NumMichelinStars) SELECT New.FiscalNum, New.NumMichelinStars;
END;


DROP TRIGGER if exists InsertCook;
CREATE TRIGGER InsertCook
Instead of insert on CookView
For each row
When not exists (SELECT * FROM Chef, Server, Cook WHERE
												New.FiscalNum = Chef.FiscalNum OR
												New.FiscalNum = Server.FiscalNum OR
												New.FiscalNum = Cook.FiscalNum)
BEGIN
	Insert into Staff values (New.FiscalNum, New.Name, New.Salary, New.PhoneNum, New.Restaurant);
	Insert into Cook values (New.FiscalNum, New.Chef);
END;

DROP TRIGGER if exists InsertServer;
CREATE TRIGGER InsertServer
Instead of insert on ServerView
For each row
When not exists (SELECT * FROM Chef, Server, Cook WHERE
												New.FiscalNum = Chef.FiscalNum OR
												New.FiscalNum = Server.FiscalNum OR
												New.FiscalNum = Cook.FiscalNum)
BEGIN
	Insert into Staff values (New.FiscalNum, New.Name, New.Salary, New.PhoneNum, New.Restaurant);
	Insert into Server values (New.FiscalNum, New.Tips);
END;


-- Insert on Staff should not be possible unless if combined with insert on Server/Chef/Cook
-- Guarantees complete generalization
DROP TRIGGER if exists InsertStaff;
CREATE TRIGGER InsertStaff
After insert on Staff
For each row
When not exists (SELECT New.FiscalNum FROM Server, Chef, Cook WHERE New.FiscalNum = Server.FiscalNum OR
													New.FiscalNum = Chef.FiscalNum OR
													New.FiscalNum = Cook.FiscalNum)
BEGIN
	SELECT raise(rollback, 'Staff generalization must be complete, disjoint');
END;

-- Delete on Staff should delete corresponding Server/Chef/Cook
-- Guarantees complete generalization
DROP TRIGGER if exists DeleteStaff;
CREATE TRIGGER DeleteStaff
After delete on Staff
For each row
BEGIN
	DELETE FROM Chef WHERE (Chef.FiscalNum = Old.FiscalNum);
	DELETE FROM Cook WHERE (Cook.FiscalNum = Old.FiscalNum);
	DELETE FROM Server WHERE (Server.FiscalNum = Old.FiscalNum);	
END;