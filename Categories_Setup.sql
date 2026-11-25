-- ==========================================================
-- Database Setup Script for E-Commerce Web Application
-- Target Database: E-commerce1
-- ==========================================================

USE [E-commerce1];
GO

-- 1. Categories Table (Fixes: Invalid object name 'Categories')
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Categories')
BEGIN
    CREATE TABLE [dbo].[Categories] (
        [CategoryID]   INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [CategoryName] NVARCHAR(255)     NOT NULL,
        [IconPath]     NVARCHAR(255)     NULL,
        [IsActive]     BIT               DEFAULT 1
    );

    SET IDENTITY_INSERT [dbo].[Categories] ON;

    INSERT INTO [dbo].[Categories] ([CategoryID], [CategoryName], [IconPath], [IsActive]) VALUES
    (1, N'Men’s Fashion',      '1.png', 1),
    (2, N'Women''s Fashion',   '2.png', 1),
    (3, N'Kid''s Fashion',     '3.png', 1),
    (4, N'Denim Collection',   '4.png', 1),
    (5, N'Western Wear',       '5.png', 1),
    (6, N'Sport Wear',         '6.png', 1),
    (7, N'Footwear',           '7.png', 1),
    (8, N'Fashion Jewellery',  '8.png', 1);

    SET IDENTITY_INSERT [dbo].[Categories] OFF;
    PRINT 'Categories table created and seeded successfully.';
END
GO

-- 2. Products Table (Used by Admin Dashboard)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Products')
BEGIN
    CREATE TABLE [dbo].[Products] (
        [ProductID]     INT IDENTITY(1,1) PRIMARY KEY,
        [ProductName]   NVARCHAR(255) NOT NULL,
        [Category]      NVARCHAR(100) NULL,
        [Price]         DECIMAL(18,2) DEFAULT 0,
        [StockQuantity] INT           DEFAULT 0,
        [ProductImage]  NVARCHAR(255) NULL,
        [IsActive]      BIT           DEFAULT 1,
        [CreatedDate]   DATETIME      DEFAULT GETDATE()
    );
    PRINT 'Products table created successfully.';
END
GO

-- 3. Orders Table (Used by Admin Dashboard)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Orders')
BEGIN
    CREATE TABLE [dbo].[Orders] (
        [OrderID]      INT IDENTITY(1,1) PRIMARY KEY,
        [CustomerName] NVARCHAR(255) NOT NULL,
        [TotalAmount]  DECIMAL(18,2) DEFAULT 0,
        [OrderDate]    DATETIME      DEFAULT GETDATE(),
        [Status]       NVARCHAR(50)  DEFAULT 'Pending'
    );
    PRINT 'Orders table created successfully.';
END
GO

-- 4. Customers Table (Used by Admin Dashboard)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Customers')
BEGIN
    CREATE TABLE [dbo].[Customers] (
        [CustomerID]   INT IDENTITY(1,1) PRIMARY KEY,
        [CustomerName] NVARCHAR(255) NOT NULL,
        [Email]        NVARCHAR(255) NULL,
        [Phone]        NVARCHAR(50)  NULL,
        [CreatedDate]  DATETIME      DEFAULT GETDATE()
    );
    PRINT 'Customers table created successfully.';
END
GO
