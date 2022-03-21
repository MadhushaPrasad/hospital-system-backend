CREATE DATABASE hospital_management_system;

Use hospital_management_system;

CREATE TABLE AdminUser(
	userID INT NOT NULL AUTO_INCREMENT,
	userName VARCHAR(25) NOT NULL,
	f_Name varchar(255) NOT NULL,
	l_Name varchar(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
	telephone VARCHAR(10) NOT NULL,
	password VARCHAR(10) NOT NULL,
	CONSTRAINT PRIMARY KEY(userID)
);

CREATE TABLE Patient(
	userID INT NOT NULL AUTO_INCREMENT,
	f_Name varchar(255) NOT NULL,
	l_Name varchar(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
	telephone VARCHAR(10) NOT NULL,
	address VARCHAR(255) NOT NULL,
	password VARCHAR(10) NOT NULL,
	dob VARCHAR(50) NOT NULL,
	CONSTRAINT PRIMARY KEY(userID)
);

CREATE TABLE Doctor(
	userID INT NOT NULL AUTO_INCREMENT,
	f_Name varchar(255) NOT NULL,
	l_Name varchar(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
	telephone VARCHAR(10) NOT NULL,
	NIC VARCHAR(10) NOT NULL,
	dob VARCHAR(50) NOT NULL,
	password VARCHAR(10) NOT NULL,
	education varchar(255) NOT NULL,
	charge DECIMAL(10,2) NOT NULL,
	status VARCHAR(10) NOT NULL,
	CONSTRAINT PRIMARY KEY(userID)
);

CREATE TABLE Pharmarcy(
	pharmarcyID int NOT NULL AUTO_INCREMENT,
	adminID int NOT NULL,
	pharmarcyName varchar(255) NOT NULL,
	location varchar(255) NOT NULL,
	closeDate  DATE NOT NULL,
	openDate DATE NOT NULL,
	CONSTRAINT PRIMARY KEY(pharmarcyID),
	CONSTRAINT FOREIGN KEY(adminID) REFERENCES  AdminUser(userID)
);

CREATE TABLE Suppiler(
	suppilerID int NOT NULL AUTO_INCREMENT,
	pharmarcyID int NOT NULL,
	suppilerName varchar(255) NOT NULL,
	location varchar(255) NOT NULL,
	medicineName varchar(255) NOT NULL,
	contactNumber varchar(10) NOT NULL,
	QTY varchar(10) NOT NULL,
	unitPrice DECIMAL(10,2) NOT NULL,
	CONSTRAINT PRIMARY KEY(suppilerID),
	CONSTRAINT FOREIGN KEY(pharmarcyID) REFERENCES  Pharmarcy(pharmarcyID)
);

CREATE TABLE Medicine(
	medicineID int NOT NULL AUTO_INCREMENT,
	suppilerID int NOT NULL,
	medicineName varchar(255) NOT NULL,
	expireDate  DATE NOT NULL,
	manufactureDate DATE NOT NULL,
	QTY varchar(10) NOT NULL,
	unitPrice DECIMAL(10,2) NOT NULL,
	status VARCHAR(10) NOT NULL,
	CONSTRAINT PRIMARY KEY(medicineID),
	CONSTRAINT FOREIGN KEY(suppilerID) REFERENCES  Suppiler(suppilerID)
);

CREATE TABLE Invoice(
	invoiceID int NOT NULL AUTO_INCREMENT,
	pharmarcyID int NOT NULL,
	treatment varchar(255) NOT NULL,
	doctorName varchar(255) NOT NULL,
	labName varchar(255) NOT NULL,
	wardName varchar(255) NOT NULL,
	wardCharge DECIMAL(10,2) NOT NULL,
	labCharge DECIMAL(10,2) NOT NULL,
	doctorCharge DECIMAL(10,2) NOT NULL,
	treatmentCharge DECIMAL(10,2) NOT NULL,
	totalAmount DECIMAL(10,2) NOT NULL,
	CONSTRAINT PRIMARY KEY(invoiceID),
	CONSTRAINT FOREIGN KEY(pharmarcyID) REFERENCES  Pharmarcy(pharmarcyID)
);

CREATE TABLE Lab(
	labID INT NOT NULL AUTO_INCREMENT,
	lab_Name varchar(255) NOT NULL,
	patientName varchar(255) NOT NULL,
    closeDate  DATE NOT NULL,
	openDate DATE NOT NULL,
	charge DECIMAL(10,2) NOT NULL,
	CONSTRAINT PRIMARY KEY(labID)
);

CREATE TABLE Ward(
	wardID INT NOT NULL AUTO_INCREMENT,
	departmentID int NOT NULL,
	numberOfAssignDoctors int NOT NULL,
	numberOfNurse int NOT NULL,
	numberOfPaitents int NOT NULL,
	wardCharge DECIMAL(10,2) NOT NULL,
	CONSTRAINT PRIMARY KEY(labID)
	CONSTRAINT FOREIGN KEY(departmentID) REFERENCES  Department(departmentID)
);