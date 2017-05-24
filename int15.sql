.mode	columns

.headers	on

.nullvalue	NULL

PRAGMA foreign_keys = off;

DROP VIEW if exists ChefView;
BEGIN TRANSACTION;

-- View: Chef Attributes
CREATE VIEW ChefView AS
     SELECT Staff.Name AS ChefName,
     		Staff.Salary AS ChefSalary,
     		Staff.PhoneNum AS ChefPhoneNum,
     		Staff.FiscalNum AS ChefFiscalNum,
     		Chef.NumMichelinStars AS ChefMichelinStars
       FROM Chef,
            Staff
      WHERE Chef.FiscalNum = Staff.FiscalNum
      ORDER BY Staff.Name;

COMMIT TRANSACTION;


DROP VIEW if exists CookView;
BEGIN TRANSACTION;

-- View: Cook Attributes
CREATE VIEW CookView AS
     SELECT Staff.Name AS CookName,
     		Staff.Salary AS CookSalary,
     		Staff.PhoneNum AS CookPhoneNum,
     		Staff.FiscalNum AS CookFiscalNum
       FROM Cook,
            Staff
      WHERE Cook.FiscalNum = Staff.FiscalNum
      ORDER BY Staff.Name;

COMMIT TRANSACTION;


DROP VIEW if exists ServerView;
BEGIN TRANSACTION;

-- View: Server Attributes
CREATE VIEW ServerView AS
     SELECT Staff.Name AS ServerName,
     		Staff.Salary AS ServerSalary,
     		Staff.PhoneNum AS ServerPhoneNum,
     		Staff.FiscalNum AS ServerFiscalNum,
     		Server.Tips AS ServerTips
       FROM Server,
            Staff
      WHERE Server.FiscalNum = Staff.FiscalNum
      ORDER BY Staff.Name;

COMMIT TRANSACTION;

PRAGMA foreign_keys = on;