DROP TABLE IF EXISTS `OrderData`;
DROP TABLE IF EXISTS `Customer`;

-- CREATE tables
CREATE TABLE `Customer` (
	`customerId` VARCHAR(191) NOT NULL,
	`name` VARCHAR(191) NOT NULL,
	`email` VARCHAR(191) NOT NULL,
	`phone` VARCHAR(191) NOT NULL,
	PRIMARY KEY(`customerId`)
);

CREATE TABLE `OrderData` (
	`orderId` VARCHAR(191) NOT NULL,
	`price` DECIMAL(65,30) NOT NULL,
	`customerCustomerId` VARCHAR(191) NOT NULL,
	FOREIGN KEY(`customerCustomerId`) REFERENCES `Customer`(`customerId`),
	PRIMARY KEY(`orderId`)
);

-- Insert data into the Customer table
INSERT INTO Customer (CustomerID, name, email, phone)
VALUES
    ("1", 'John Doe', 'john.doe@email.com', '123-456-7890'),
    ("2", 'Jane Smith', 'jane.smith@email.com', '987-654-3210'),
    ("3", 'Alice Johnson', 'alice.johnson@email.com', '555-123-4567'),
    ("4", 'Bob Williams', 'bob.williams@email.com', '888-555-9999'),
    ("5", 'Eva Brown', 'eva.brown@email.com', '777-888-2222');

-- Insert data into the Order table
INSERT INTO OrderData (OrderID, price, customerCustomerId)
VALUES
    ("101", 100.50, "1"),
    ("102", 75.25, "5"),
    ("103", 200.00, "2"),
    ("104", 50.75, "4"),
    ("105", 300.90, "3");
