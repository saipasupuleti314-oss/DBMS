CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Pincode VARCHAR(10) NOT NULL,
    Registration_Date DATE NOT NULL
);
CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    City VARCHAR(50) NOT NULL
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Stock INT NOT NULL CHECK (Stock >= 0),
    Supplier_ID INT,
    FOREIGN KEY (Supplier_ID)
        REFERENCES Supplier(Supplier_ID)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE NOT NULL,
    Order_Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);
CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Unit_Price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT UNIQUE,
    Payment_Method VARCHAR(30) NOT NULL,
    Payment_Status VARCHAR(20) NOT NULL,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
);
CREATE TABLE Shipment (
    Shipment_ID INT PRIMARY KEY,
    Order_ID INT UNIQUE,
    Courier_Name VARCHAR(50) NOT NULL,
    Tracking_Number VARCHAR(50) UNIQUE,
    Shipment_Date DATE,
    Delivery_Date DATE,
    Shipment_Status VARCHAR(20) NOT NULL,

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
);
SHOW TABLES;
DESC Customer;
DESC Supplier;
DESC Product;
DESC Orders;
DESC Order_Details;
DESC Payment;
DESC Shipment;
USE ecommerce;

INSERT INTO Customer
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','MG Road','Hyderabad','Telangana','500001','2026-08-01'),
(102,'Priya','Reddy','priya@gmail.com','9876543211','Beach Road','Visakhapatnam','Andhra Pradesh','530001','2026-08-02'),
(103,'Arjun','Kumar','arjun@gmail.com','9876543212','BTM Layout','Bengaluru','Karnataka','560001','2026-08-03'),
(104,'Sneha','Patel','sneha@gmail.com','9876543213','CG Road','Ahmedabad','Gujarat','380001','2026-08-04'),
(105,'Vikram','Singh','vikram@gmail.com','9876543214','MI Road','Jaipur','Rajasthan','302001','2026-08-05'),
(106,'Kavya','Rao','kavya@gmail.com','9876543215','Governorpet','Vijayawada','Andhra Pradesh','520001','2026-08-06'),
(107,'Anjali','Verma','anjali@gmail.com','9876543216','Hazratganj','Lucknow','Uttar Pradesh','226001','2026-08-07'),
(108,'Neha','Gupta','neha@gmail.com','9876543217','FC Road','Pune','Maharashtra','411001','2026-08-08'),
(109,'Rohit','Mehta','rohit@gmail.com','9876543218','T Nagar','Chennai','Tamil Nadu','600001','2026-08-09'),
(110,'Pooja','Nair','pooja@gmail.com','9876543219','MG Road','Kochi','Kerala','682001','2026-08-10');

INSERT INTO Supplier
VALUES
(201,'Dell India','dell@gmail.com','9000000001','Bengaluru'),
(202,'HP India','hp@gmail.com','9000000002','Chennai'),
(203,'Boat','boat@gmail.com','9000000003','Delhi'),
(204,'Samsung','samsung@gmail.com','9000000004','Noida'),
(205,'Apple','apple@gmail.com','9000000005','Mumbai'),
(206,'Lenovo','lenovo@gmail.com','9000000006','Hyderabad'),
(207,'Logitech','logitech@gmail.com','9000000007','Pune'),
(208,'Canon','canon@gmail.com','9000000008','Kolkata'),
(209,'Sony','sony@gmail.com','9000000009','Chennai'),
(210,'Asus','asus@gmail.com','9000000010','Bengaluru');
INSERT INTO Product
VALUES
(301,'Dell Laptop','Electronics',65000,20,201),
(302,'HP Laptop','Electronics',60000,15,202),
(303,'Boat Headphones','Accessories',2500,40,203),
(304,'Samsung Mobile','Electronics',35000,30,204),
(305,'iPhone 16','Electronics',85000,10,205),
(306,'Lenovo Tablet','Electronics',28000,18,206),
(307,'Logitech Mouse','Accessories',1200,80,207),
(308,'Canon Printer','Electronics',15000,12,208),
(309,'Sony Earbuds','Accessories',5000,35,209),
(310,'Asus Monitor','Electronics',18000,22,210);

INSERT INTO Orders
VALUES
(401,101,'2026-08-12','Delivered'),
(402,102,'2026-08-13','Shipped'),
(403,103,'2026-08-14','Pending'),
(404,104,'2026-08-15','Confirmed'),
(405,105,'2026-08-16','Delivered'),
(406,106,'2026-08-17','Packed'),
(407,107,'2026-08-18','Cancelled'),
(408,108,'2026-08-19','Delivered'),
(409,109,'2026-08-20','Shipped'),
(410,110,'2026-08-21','Pending');


INSERT INTO Order_Details
VALUES
(501,401,301,1,65000),
(502,401,307,2,1200),
(503,402,304,1,35000),
(504,403,305,1,85000),
(505,404,302,1,60000),
(506,405,309,2,5000),
(507,406,306,1,28000),
(508,407,303,3,2500),
(509,408,310,1,18000),
(510,409,308,1,15000);

INSERT INTO Payment
VALUES
(601,401,'UPI','Paid','2026-08-12',67400),
(602,402,'Credit Card','Paid','2026-08-13',35000),
(603,403,'Debit Card','Pending','2026-08-14',85000),
(604,404,'Net Banking','Paid','2026-08-15',60000),
(605,405,'UPI','Paid','2026-08-16',10000),
(606,406,'Credit Card','Paid','2026-08-17',28000),
(607,407,'UPI','Refunded','2026-08-18',7500),
(608,408,'Cash on Delivery','Paid','2026-08-19',18000),
(609,409,'UPI','Paid','2026-08-20',15000),
(610,410,'Debit Card','Pending','2026-08-21',65000);

INSERT INTO Shipment
VALUES
(701,401,'BlueDart','TRK1001','2026-08-12','2026-08-14','Delivered'),
(702,402,'DTDC','TRK1002','2026-08-13',NULL,'In Transit'),
(703,403,'Delhivery','TRK1003',NULL,NULL,'Pending'),
(704,404,'BlueDart','TRK1004','2026-08-15',NULL,'Packed'),
(705,405,'Ecom Express','TRK1005','2026-08-16','2026-08-18','Delivered'),
(706,406,'DTDC','TRK1006','2026-08-17',NULL,'Packed'),
(707,407,'BlueDart','TRK1007',NULL,NULL,'Cancelled'),
(708,408,'Delhivery','TRK1008','2026-08-19','2026-08-21','Delivered'),
(709,409,'Ecom Express','TRK1009','2026-08-20',NULL,'Shipped'),
(710,410,'BlueDart','TRK1010',NULL,NULL,'Pending');

SELECT * FROM Customer;
SELECT * FROM Supplier;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM Order_Details;
SELECT * FROM Payment;
SELECT * FROM Shipment;

SELECT COUNT(*) AS Total_Customers
FROM Customer;

SELECT AVG(Price) AS Average_Price
FROM Product;

SELECT MAX(Price) AS Highest_Price
FROM Product;

SELECT MIN(Price) AS Lowest_Price
FROM Product;

SELECT SUM(Stock) AS Total_Stock
FROM Product;

SELECT Category,COUNT(*) AS Total_Products
FROM Product
GROUP BY Category;

SELECT Category,COUNT(*) AS Total
FROM Product
GROUP BY Category
HAVING COUNT(*)>1;

SELECT
Customer.Customer_ID,
First_Name,
Last_Name,
Order_ID,
Order_Date,
Order_Status
FROM Customer
INNER JOIN Orders
ON Customer.Customer_ID=Orders.Customer_ID;

SELECT
Product.Product_Name,
Supplier.Supplier_Name,
Product.Price
FROM Product
INNER JOIN Supplier
ON Product.Supplier_ID=Supplier.Supplier_ID;

SELECT
Orders.Order_ID,
Customer.First_Name,
Product.Product_Name,
Order_Details.Quantity,
Order_Details.Unit_Price
FROM Orders
JOIN Customer
ON Orders.Customer_ID=Customer.Customer_ID
JOIN Order_Details
ON Orders.Order_ID=Order_Details.Order_ID
JOIN Product
ON Product.Product_ID=Order_Details.Product_ID;

SELECT
Orders.Order_ID,
Payment_Method,
Payment_Status,
Amount
FROM Payment
JOIN Orders
ON Payment.Order_ID=Orders.Order_ID;

SELECT
Orders.Order_ID,
Courier_Name,
Shipment_Status
FROM Shipment
JOIN Orders
ON Shipment.Order_ID=Orders.Order_ID;

SELECT
Customer.First_Name,
Orders.Order_ID
FROM Customer
LEFT JOIN Orders
ON Customer.Customer_ID=Orders.Customer_ID;

SELECT
Product.Product_Name,
Supplier.Supplier_Name
FROM Product
RIGHT JOIN Supplier
ON Product.Supplier_ID=Supplier.Supplier_ID;


SELECT *
FROM Product
WHERE Price=(SELECT MAX(Price) FROM Product);

SELECT *
FROM Orders
WHERE Order_Status='Pending';

SELECT *
FROM Orders
WHERE Order_Status='Delivered';

SELECT SUM(Amount) AS Total_Sales
FROM Payment
WHERE Payment_Status='Paid';