CREATE DATABASE leads;
USE leads;

DROP TABLE IF EXISTS `LeadAnalyticsData`;

CREATE TABLE `LeadAnalyticsData` (
	`id` VARCHAR(191) NOT NULL,
	`firstName` VARCHAR(191) NOT NULL,
	`lastName` VARCHAR(191) NOT NULL,
	`email` VARCHAR(191) NOT NULL,
	`phone` VARCHAR(191) NOT NULL,
	`company` VARCHAR(191) NOT NULL,
	`status` VARCHAR(191) NOT NULL,
	`source` VARCHAR(191) NOT NULL,
	`score` DOUBLE NOT NULL,
	`owner` VARCHAR(191) NOT NULL,
	`createdDate` VARCHAR(191) NOT NULL,
	`lastContactDate` VARCHAR(191) NOT NULL,
	`lastActivity` VARCHAR(191) NOT NULL,
	`converted` VARCHAR(191) NOT NULL,
	`conversionDate` VARCHAR(191) NOT NULL,
	`opportunityAmount` DOUBLE NOT NULL,
	`opportunityStage` VARCHAR(191) NOT NULL,
	PRIMARY KEY(`id`)
);
