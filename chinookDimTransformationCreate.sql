-- Drop database if exists
IF DB_ID('MusicSalesDB') IS NOT NULL
BEGIN
    DROP DATABASE MusicSalesDB;
END
GO

-- Create database
CREATE DATABASE MusicSalesDB;
GO

-- Use the created database
USE MusicSalesDB;
GO

-- Drop tables if they exist
IF OBJECT_ID('FactMusicSale', 'U') IS NOT NULL DROP TABLE FactMusicSale;
IF OBJECT_ID('DimCustomer', 'U') IS NOT NULL DROP TABLE DimCustomer;
IF OBJECT_ID('DimEmployee', 'U') IS NOT NULL DROP TABLE DimEmployee;
IF OBJECT_ID('DimTrack', 'U') IS NOT NULL DROP TABLE DimTrack;
GO

-- Create DimCustomer table
CREATE TABLE DimCustomer (
    Id_customer INT PRIMARY KEY,
    Name_customer NVARCHAR(255) NOT NULL,
    Locality_customer NVARCHAR(255),
    Address_customer NVARCHAR(255),
    City_customer NVARCHAR(100),
    State_customer NVARCHAR(100),
    Country_customer NVARCHAR(100),
    PostalCode_customer NVARCHAR(20),
    Contact_customer NVARCHAR(100),
    Company NVARCHAR(100)
);
GO

-- Create DimEmployee table
CREATE TABLE DimEmployee (
    Id_employee INT PRIMARY KEY,
    Name_employee NVARCHAR(255) NOT NULL,
    Title NVARCHAR(100),
    Address_emp NVARCHAR(255),
    City_employee NVARCHAR(100),
    Country_employee NVARCHAR(100),
    PostalCode_employee NVARCHAR(20)
);
GO

-- Create DimTrack table
CREATE TABLE DimTrack (
    Id_track INT PRIMARY KEY,
    Name_track NVARCHAR(255) NOT NULL,
    Album NVARCHAR(255),
    MediaType NVARCHAR(100),
    Genre NVARCHAR(100),
    Playlist NVARCHAR(100),
    Artist NVARCHAR(100)
);
GO

-- Create FactMusicSale table
CREATE TABLE FactMusicSale (
    SaleId INT PRIMARY KEY,
    Sale_CustomerId INT,
    Sale_EmployeeId INT,
    Sale_TrackId INT,
    Sale_Invoice INT,
    Sale_Total DECIMAL(10, 2),
    Sale_Quantity INT,
    Sale_Date DATETIME,
    Sale_UnitPrice DECIMAL(10, 2),
    Sale_Address NVARCHAR(255),
    Sale_City NVARCHAR(100),
    Sale_Country NVARCHAR(100),
    Sale_PostalCode NVARCHAR(20),
    FOREIGN KEY (Sale_CustomerId) REFERENCES DimCustomer(Id_customer),
    FOREIGN KEY (Sale_EmployeeId) REFERENCES DimEmployee(Id_employee),
    FOREIGN KEY (Sale_TrackId) REFERENCES DimTrack(Id_track)
);
GO
