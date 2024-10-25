use wpm0026db;
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    UnitPrice DECIMAL(6,2),
    Author VARCHAR(100),
    Quantity INT,
    SupplierID INT,
    SubjectID INT
);
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Phone VARCHAR(15)
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    ShippedDate DATE,
    ShipperID INT
);
CREATE TABLE OrderDetails (
    BookID INT,
    OrderID INT,
    Quantity INT,
    PRIMARY KEY (BookID, OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    ShipperName VARCHAR(255)
);
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    CategoryName VARCHAR(255)
);
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    ContactLastName VARCHAR(255),
    ContactFirstName VARCHAR(255),
    Phone VARCHAR(20)
);

ALTER TABLE Orders MODIFY ShippedDate date NULL;
ALTER TABLE Orders MODIFY ShipperID int NULL;
