.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;

DROP VIEW if exists ChefView;
BEGIN TRANSACTION;

-- View: Chef Attributes
CREATE VIEW ChefView AS
     SELECT Staff.Name AS Name,
     		Staff.Salary AS Salary,
     		Staff.PhoneNum AS PhoneNum,
     		Staff.FiscalNum AS FiscalNum,
     		Staff.Restaurant AS Restaurant,
     		Chef.NumMichelinStars AS NumMichelinStars
       FROM Chef,
            Staff
      WHERE Chef.FiscalNum = Staff.FiscalNum
      ORDER BY Staff.Name;

COMMIT TRANSACTION;


DROP VIEW if exists CookView;
BEGIN TRANSACTION;

-- View: Cook Attributes
CREATE VIEW CookView AS
     SELECT Staff.Name AS Name,
     		Staff.Salary AS Salary,
     		Staff.PhoneNum AS PhoneNum,
     		Staff.FiscalNum AS FiscalNum,
     		Staff.Restaurant AS Restaurant,
     		Cook.Chef AS Chef
       FROM Cook,
            Staff
      WHERE Cook.FiscalNum = Staff.FiscalNum
      ORDER BY Staff.Name;

COMMIT TRANSACTION;


DROP VIEW if exists ServerView;
BEGIN TRANSACTION;

-- View: Server Attributes
CREATE VIEW ServerView AS
     SELECT Staff.Name AS Name,
     		Staff.Salary AS Salary,
     		Staff.PhoneNum AS PhoneNum,
     		Staff.FiscalNum AS FiscalNum,
     		Staff.Restaurant AS Restaurant,
     		Server.Tips AS Tips
       FROM Server,
            Staff
      WHERE Server.FiscalNum = Staff.FiscalNum
      ORDER BY Staff.Name;

COMMIT TRANSACTION;

PRAGMA foreign_keys = on;