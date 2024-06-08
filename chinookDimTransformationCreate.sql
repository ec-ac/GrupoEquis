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
DROP TABLE IF EXISTS [FactMusicSale];
DROP TABLE IF EXISTS [DimCustomer];
DROP TABLE IF EXISTS [DimEmployee];
DROP TABLE IF EXISTS [DimTrack];


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
);

