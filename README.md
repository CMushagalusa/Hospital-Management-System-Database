# Hospital Management System Database

## 📌 Description
This project provides a **MySQL database schema** for managing a **hospital system**, including:
- **Hospitals** 🏥
- **Patients** 👨‍⚕️
- **Doctors** 🩺
- **Admissions** 📋
- **Medical Records** 📂
- **Wards & Rooms** 🚑

It includes structured relationships, **foreign keys**, **auto-generated IDs**, and **optimized queries** for efficient data management.

## 🚀 Features
✅ **Structured database schema** with relational integrity  
✅ **Auto-generated unique IDs** (e.g., HOS001, PAT001) using MySQL triggers  
✅ **Optimized foreign key relationships** for consistency  
✅ **Pre-populated sample data** for quick testing  
✅ **Efficient queries** to retrieve and manage hospital data  

## 📂 Database Schema
### 🔹 Tables
- **Hospital** – Stores hospital details
- **Patient** – Manages patient records
- **Doctor** – Keeps doctor information
- **Admission** – Tracks patient admissions
- **MedicalRecord** – Stores medical diagnoses & treatments
- **Room & Ward** – Manages hospital rooms and patient wards

## 🛠 Installation & Usage
### 📌 Prerequisites
- **MySQL Server** installed
- A database management tool (**MySQL Workbench**, **phpMyAdmin**, or **CLI**)

### 📥 Setup
1. **Clone this repository**:
   ```sh
   git clone https://github.com/CMushagalusa/Hospital-Management-System-Database.git
   cd hospital-management-system
   ```
2. **Import the SQL file into MySQL**:
   ```sh
   mysql -u root -p < hospital_management_system.sql
   ```
3. **Use the database**:
   ```sql
   USE Hospital_Management_System;
   ```
4. **Run queries and test the system!** 🎯

## 📊 Sample Queries
- **View all hospitals:**
  ```sql
  SELECT HospitalID, HospitalName, Address FROM Hospital;
  ```
- **Find female patients:**
  ```sql
  SELECT PatientID, PatientName FROM Patient WHERE Gender = 'F';
  ```
- **Check admissions in Room 3:**
  ```sql
  SELECT * FROM Admission WHERE RoomNumber = '3';
  ```
---
🚀 **Contributions are welcome!** If you find any issues or improvements, feel free to submit a pull request. 😃

Clovis Mushagalusa CIRUBAKADERHA

