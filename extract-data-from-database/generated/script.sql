-- AUTO-GENERATED FILE.

-- This file is an auto-generated file by Ballerina persistence layer for model.
-- Please verify the generated scripts and execute them against the target DB server.

DROP TABLE IF EXISTS `OrderData`;
DROP TABLE IF EXISTS `Customer`;

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
