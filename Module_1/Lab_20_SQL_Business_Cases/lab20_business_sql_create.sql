CREATE DATABASE lab_mysql_1;
USE lab_mysql_1;

CREATE TABLE Cars (
	ID int,
    VIN varchar(255),
    manufacturer varchar(255),
    model varchar(255),
    year int,
    color varchar(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Customers (
	ID int,
    CustomerID varchar(255),
    name varchar(255),
    phone varchar(255),
    email varchar(255),
    address varchar(255),
    city varchar(255),
    state varchar(255),
    country varchar(255),
    postal_code varchar(50),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Salespersons (
	ID int,
    StaffID varchar(255),
    name varchar(255),
    store varchar(255),
    PRIMARY KEY (StaffID)
);

CREATE TABLE Invoices (
ID int,
InvoiceID varchar(255),
date date,
CarID int,
CustomerID varchar(255),
StaffID varchar(255),
PRIMARY KEY (InvoiceID),
FOREIGN KEY (CarID) REFERENCES Cars (ID),
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
FOREIGN KEY (StaffID) REFERENCES Salespersons (StaffID)
);

INSERT INTO Cars (ID, VIN, manufacturer, model, year, color)
VALUES
(0, "3K096I98581DHSNUP", "Volkswagen", "Tiguan", 2019, "Blue)"),
(1,  "ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter",  2019, "Red"),
(2,  "RKXVNNIHLVVZOUB4M", "Ford", "Fusion", 2018, "White"),
(3, "HKNDGS7CU31E9Z7JW", "Toyota", "RAV4",  2018, "Silver"),
(4,  "DAM41UDN3CHU2WVF6", "Volvo", "V60", 2019, "Gray"),
(5, "DAM41UDN3CHU2WVF6",  "Volvo", "V60 Cross Country", 2019, "Gray")
;

INSERT INTO Customers(ID, CustomerID, name, phone, email, address, city, state, country, postal_code)
VALUES
(0, 10001, "Pablo Picasso",  "+34 636 17 63 82",  "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", 28045),
(1, 20001, "Abraham Lincoln", "+1 305 907 7086", "-", "120 SW 8th St,", "Miami", "Florida", "United States", 33130),
(2, 30001, "Napoléon Bonaparte", "+33 1 79 75 40 00", " -", "40 Rue du Colisée", "Paris", "Île-de-France", "France", 75008)
;

INSERT INTO Salespersons(ID, StaffID, name, store)
VALUES
(0, 00001, "Petey Cruiser", "Madrid"),
(1, 00002, "Anna Sthesia", "Barcelona"),
(2, 00003, "Paul Molive", "Berlin"),
(3, 00004, "Gail Forcewind", "Paris"),
(4, 00005, "Paige Turner", "Mimia"),
(5, 00006, "Bob Frapples", "Mexico City"),
(6, 00007, "Walter Melon", "Amsterdam"),
(7, 00008, "Shonda Leer", "São Paulo")
;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO Invoices(ID, InvoiceID, date, CarID, CustomerID, StaffID)
VALUES
(0, 852399038, '2018-08-22', 0 , 1 , 3 ),
(1, 731166526, '2018-12-31', 3 , 0 , 5 ),
(2, 271135104, '2019-01-22', 2 , 2 , 7 )
;
