PRAGMA foreign_keys = off;

-- Droping all the tables
DROP TABLE if exists Responsible;
DROP TABLE if exists Allergy;
DROP TABLE if exists Beverage;
DROP TABLE if exists Category;
DROP TABLE if exists Chef;
DROP TABLE if exists Client;
DROP TABLE if exists Contains;
DROP TABLE if exists Cook;
DROP TABLE if exists Dish;
DROP TABLE if exists Ingredient;
DROP TABLE if exists ROrder;
DROP TABLE if exists OrderBeverage;
DROP TABLE if exists OrderDish;
DROP TABLE if exists Reservation;
DROP TABLE if exists ReservedTable;
DROP TABLE if exists Responsible;
DROP TABLE if exists Server;
DROP TABLE if exists Restaurant;
DROP TABLE if exists Specialty;
DROP TABLE if exists Staff;
DROP TABLE if exists RTable;
DROP TABLE if exists RTransaction;

-- Creating Tables

-- Table: Restaurant
CREATE TABLE Restaurant (
	ID INTEGER PRIMARY KEY,
	PhoneNum INTEGER UNIQUE CONSTRAINT PhoneNum9Digits CHECK ((99999999 < PhoneNum) AND (PhoneNum< 1000000000)),
	Name TEXT UNIQUE, 
	Adress TEXT UNIQUE
);

-- Table: Reservation
CREATE TABLE Reservation (
	ID INTEGER PRIMARY KEY, 
	Time TIME NOT NULL, 
	People INTEGER NOT NULL CONSTRAINT MinNumPeople CHECK (People > 0), 
	Restaurant REFERENCES Restaurant (ID) NOT NULL, 
	Client REFERENCES Client (FiscalNum) NOT NULL, 
	Date DATE NOT NULL,
	CONSTRAINT RepeatedRes UNIQUE (Client, Date, Time, Restaurant)
);

-- Table: Table
CREATE TABLE RTable (
	ID INTEGER NOT NULL, 
	Restaurant REFERENCES Restaurant (ID) NOT NULL,
	PRIMARY KEY (ID, Restaurant)
);

-- Table: Client
CREATE TABLE Client (
	FiscalNum INTEGER PRIMARY KEY CONSTRAINT FiscalNum9Digits CHECK ((99999999 < FiscalNum) AND (FiscalNum< 1000000000)), 
	Name TEXT NOT NULL,
	PhoneNum INTEGER NOT NULL CONSTRAINT PhoneNum9Digits CHECK ((99999999 < PhoneNum) AND (PhoneNum< 1000000000))
);

-- Table: ROrder
CREATE TABLE ROrder (
	ID INTEGER PRIMARY KEY,
	Date DATE NOT NULL, 
	Time TIME NOT NULL, 
	TableID INTEGER NOT NULL,
	Restaurant REFERENCES Restaurant (ID) NOT NULL,
	Client REFERENCES Client (FiscalNum) NOT NULL, 
	RTransaction REFERENCES RTransaction (ID),
	FOREIGN KEY (TableID, Restaurant) REFERENCES RTable(ID, Restaurant), 
	CONSTRAINT RepeatedOrd UNIQUE (Date, Time, Client)
);

-- Table: Staff
CREATE TABLE Staff (
	FiscalNum INTEGER PRIMARY KEY CONSTRAINT FiscalNum9Digits CHECK ((99999999 < FiscalNum) AND (FiscalNum < 1000000000)), 
	Name TEXT NOT NULL, 
	Salary INTEGER NOT NULL CONSTRAINT SalaryPositive CHECK (Salary > 0), 
	PhoneNum INTEGER UNIQUE CONSTRAINT PhoneNum9Digits CHECK ((99999999 < PhoneNum) AND (PhoneNum < 1000000000)), 
	Restaurant REFERENCES Restaurant (ID) NOT NULL
);

-- Table: 	
CREATE TABLE Server (
	FiscalNum PRIMARY KEY REFERENCES Staff (FiscalNum), 
	Tips INTEGER DEFAULT (0)
);

-- Table: Chef
CREATE TABLE Chef (
	FiscalNum PRIMARY KEY REFERENCES Staff (FiscalNum), 
	NumMichelinStars INTEGER DEFAULT (0)
);

-- Table: Cook
CREATE TABLE Cook (
	FiscalNum PRIMARY KEY REFERENCES Staff (FiscalNum),
	Chef REFERENCES Chef (FiscalNum) NOT NULL
);

-- Table: RTransaction
CREATE TABLE RTransaction (
	ID INTEGER PRIMARY KEY,
	Amount REAL NOT NULL,  
	Date DATE NOT NULL, 
	Time TIME NOT NULL, 
	FiscalNum REFERENCES Client (FiscalNum),
	CONSTRAINT RepeatedTran UNIQUE (FiscalNum, Date, Time)
);

-- Table: Beverage
CREATE TABLE Beverage (
	ID INTEGER PRIMARY KEY,
	Name TEXT UNIQUE NOT NULL,  
	Price REAL NOT NULL
);

-- Table: Dish
CREATE TABLE Dish (
	ID INTEGER PRIMARY KEY, 
	Name TEXT NOT NULL, 
	Description TEXT NOT NULL, 
	Price REAL NOT NULL, 
	Category REFERENCES Category (ID) NOT NULL, 
	Author REFERENCES Chef (FiscalNum) NOT NULL, 
	CONSTRAINT RepeatedDish UNIQUE (Name, Author)
);

-- Table: Category
CREATE TABLE Category (
	ID INTEGER PRIMARY KEY, 
	Name TEXT UNIQUE NOT NULL
);

-- Table: Ingredient
CREATE TABLE Ingredient (
	ID INTEGER PRIMARY KEY,
	Name TEXT UNIQUE NOT NULL
);

-- Tables Based on Associations
-- Table: Contains
CREATE TABLE Contains (
	Dish REFERENCES Dish (ID), 
	Ingredient REFERENCES Ingredient (ID),
	CONSTRAINT Contains PRIMARY KEY (Dish, Ingredient)
);
-- Table: ReservedTable
CREATE TABLE ReservedTable (
	Reservation REFERENCES Reservation (ID), 
	TableID INTEGER NOT NULL,
	Restaurant REFERENCES Restaurant (ID) NOT NULL,
	FOREIGN KEY (TableID, Restaurant) REFERENCES RTable(ID, Restaurant), 
	CONSTRAINT ReservedTable PRIMARY KEY (Reservation, TableID, Restaurant)
);

-- Table: Responsible
CREATE TABLE Responsible (
	TableID INTEGER NOT NULL,
	Restaurant REFERENCES Restaurant (ID) NOT NULL,
	Server REFERENCES Server (FiscalNum),
	FOREIGN KEY (TableID, Restaurant) REFERENCES RTable(ID, Restaurant),  
	CONSTRAINT Responsible PRIMARY KEY (TableID, Restaurant, Server)
);

-- Table: OrderBeverage
CREATE TABLE OrderBeverage (
	ROrder REFERENCES ROrder (ID), 
	Beverage REFERENCES Beverage (ID),
	CONSTRAINT OrderBeverage PRIMARY KEY (ROrder, Beverage)
);

-- Table: OrderDish
CREATE TABLE OrderDish (
	ROrder REFERENCES ROrder (ID), 
	Dish REFERENCES Dish (ID),
	CONSTRAINT OrderDish PRIMARY KEY (ROrder, Dish)
);

-- Table: Allergy
CREATE TABLE Allergy (
	Client REFERENCES Client (FiscalNum), 
	Ingredient REFERENCES Ingredient (ID),
	CONSTRAINT Allergy PRIMARY KEY (Client, Ingredient)
);

-- Table: Specialty
CREATE TABLE Specialty (
	Cook REFERENCES Cook (FiscalNum), 
	Category REFERENCES Category (ID),
	CONSTRAINT Specialty PRIMARY KEY (Cook, Category)
);

PRAGMA foreign_keys = ON;
