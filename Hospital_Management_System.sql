-- Drop the database if it already exists
DROP DATABASE IF EXISTS Hospital_Management_System;
CREATE DATABASE Hospital_Management_System;
USE Hospital_Management_System;

-- Hospital Table
CREATE TABLE Hospital (
    HospitalID VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    HospitalName VARCHAR(30) NOT NULL, 
    Address VARCHAR(25),
    ContactNumber VARCHAR(12) UNIQUE
);

-- Patient Table
CREATE TABLE Patient (
    PatientID VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    PatientName VARCHAR(30) NOT NULL, 
    DateofBirth DATE,
    Gender ENUM('M', 'F') NOT NULL,
    Address VARCHAR(25),
    ContactNumber VARCHAR(12) UNIQUE
);

-- Doctor Table
CREATE TABLE Doctor (
    HospitalID VARCHAR(8),
    DoctorID VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    DoctorName VARCHAR(30) NOT NULL, 
    DateofBirth DATE,
    Gender ENUM('M', 'F') NOT NULL,
    ContactNumber VARCHAR(12) UNIQUE,
    FOREIGN KEY (HospitalID) REFERENCES Hospital (HospitalID)
);

-- Admission Table
CREATE TABLE Admission (
    AdmissionID VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    PatientID VARCHAR(8),
    DoctorID VARCHAR(8),
    RoomNumber VARCHAR(5),
    AdmissionDate DATE,
    DischargeDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient (PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor (DoctorID) 
);

-- Medical Record Table
CREATE TABLE MedicalRecord (
    RecordID VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    AdmissionID VARCHAR(8),
    DateofRecord DATE NOT NULL,
    Diagnosis VARCHAR(50),
    Treatment VARCHAR(50),
    FOREIGN KEY (AdmissionID) REFERENCES Admission (AdmissionID)
);

-- Room Table
CREATE TABLE Room (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    AdmissionID VARCHAR(8) NOT NULL,
    FOREIGN KEY (AdmissionID) REFERENCES Admission (AdmissionID)
);

-- Ward Table
CREATE TABLE Ward (
    WardID VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    WardName VARCHAR(20),
    NumberOfPatients INT,
    TimeIn TIME,
    TimeOut TIME,
    RoomID INT,
    FOREIGN KEY (RoomID) REFERENCES Room (RoomID)
);

-- ✅ Auto-incremented ID Generators (Triggers)
DELIMITER $$

-- Hospital Trigger
CREATE TRIGGER table_hospital
BEFORE INSERT ON Hospital
FOR EACH ROW
BEGIN
    SET NEW.HospitalID = CONCAT('HOS', LPAD((SELECT COUNT(*)+1 FROM Hospital), 3, '0'));
END$$

-- Patient Trigger
CREATE TRIGGER table_patient
BEFORE INSERT ON Patient
FOR EACH ROW
BEGIN
    SET NEW.PatientID = CONCAT('PAT', LPAD((SELECT COUNT(*)+1 FROM Patient), 3, '0'));
END$$

-- Doctor Trigger
CREATE TRIGGER table_doctor
BEFORE INSERT ON Doctor
FOR EACH ROW
BEGIN
    SET NEW.DoctorID = CONCAT('DOC', LPAD((SELECT COUNT(*)+1 FROM Doctor), 3, '0'));
END$$

-- Admission Trigger
CREATE TRIGGER table_admission
BEFORE INSERT ON Admission
FOR EACH ROW
BEGIN
    SET NEW.AdmissionID = CONCAT('ADM', LPAD((SELECT COUNT(*)+1 FROM Admission), 3, '0'));
END$$

-- Medical Record Trigger
CREATE TRIGGER table_medicalRecord
BEFORE INSERT ON MedicalRecord
FOR EACH ROW
BEGIN
    SET NEW.RecordID = CONCAT('REC', LPAD((SELECT COUNT(*)+1 FROM MedicalRecord), 3, '0'));
END$$

-- Ward Trigger
CREATE TRIGGER table_ward
BEFORE INSERT ON Ward
FOR EACH ROW
BEGIN
    SET NEW.WardID = CONCAT('WAR', LPAD((SELECT COUNT(*)+1 FROM Ward), 3, '0'));
END$$

DELIMITER ;

-- ✅ Insert Sample Data
INSERT INTO Hospital (HospitalName, Address, ContactNumber) VALUES
    ('General Hospital', '123 Accra', '233255451234'),
    ('Berekuso Medical Center', '456 Elm St', '233257556239');

INSERT INTO Patient (PatientName, DateOfBirth, Gender, Address, ContactNumber) VALUES
    ('John Kwabena', '1990-05-15', 'M', '123 University Berekuso', '2335551111'),
    ('Jane Nana', '1985-08-20', 'F', '456 Upper West', '2335552222');

INSERT INTO Doctor (HospitalID, DoctorName, DateOfBirth, Gender, ContactNumber) VALUES
    ('HOS001', 'John Doe', '1975-07-05', 'M', '233254567345'),
    ('HOS002', 'Sarah Smith', '1985-08-20', 'F', '233254534053');

INSERT INTO Admission (PatientID, DoctorID, RoomNumber, AdmissionDate, DischargeDate) VALUES 
    ('PAT001', 'DOC001', '8', '2023-07-05', '2023-07-15');

INSERT INTO MedicalRecord (AdmissionID, DateOfRecord, Diagnosis, Treatment) VALUES 
    ('ADM001', '2023-07-05', 'Flu', 'Bed Rest and Fluids');

-- ✅ Query Hospital Data
SELECT HospitalID, HospitalName, Address FROM Hospital;

-- ✅ Query Female Patients
SELECT PatientID, PatientName FROM Patient WHERE Gender = 'F';

-- ✅ Query Admissions
SELECT AdmissionID, PatientID, DoctorID FROM Admission WHERE RoomNumber = '3' AND DischargeDate = '2008-10-03';

