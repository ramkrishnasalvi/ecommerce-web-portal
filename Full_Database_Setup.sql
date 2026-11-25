-- ==========================================================
-- Complete Database Setup Script for E-Commerce Web Application
-- Target Database: E-commerce1 on (localdb)\Projects or SQL Server
-- ==========================================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'E-commerce1')
BEGIN
    CREATE DATABASE [E-commerce1];
    PRINT 'Database [E-commerce1] created successfully.';
END
GO

USE [E-commerce1];
GO

-- 1. Admin Login Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Adminlogin')
BEGIN
    CREATE TABLE Adminlogin (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        Username VARCHAR(55) NOT NULL,
        Password VARCHAR(55) NOT NULL
    );

    INSERT INTO Adminlogin (Username, Password)
    VALUES ('E-com-admin', 'Admin-ecom@12');
    PRINT 'Adminlogin table created and seeded.';
END
GO

-- 2. Categories Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Categories')
BEGIN
    CREATE TABLE Categories (
        CategoryID INT PRIMARY KEY IDENTITY(1,1),
        CategoryName NVARCHAR(100) NOT NULL,
        IconPath NVARCHAR(200),
        IsActive BIT DEFAULT 1
    );

    INSERT INTO Categories (CategoryName, IconPath, IsActive) VALUES
    ('Men’s Fashion', '1.png', 1),
    ('Women''s Fashion', '2.png', 1),
    ('Kid''s Fashion', '3.png', 1),
    ('Denim Collection', '4.png', 1),
    ('western wear', '5.png', 1),
    ('sport wear', '6.png', 1),
    ('footwear', '7.png', 1),
    ('fashion jewellery', '8.png', 1),
    ('Beauty & Cosmetics', '2.png', 1);
    PRINT 'Categories created and seeded.';
END
GO

-- 3. SubCategories Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SubCategories')
BEGIN
    CREATE TABLE SubCategories (
        SubCategoryID INT PRIMARY KEY IDENTITY(1,1),
        CategoryID INT,
        SubCategoryName NVARCHAR(100) NOT NULL
    );

    INSERT INTO SubCategories (CategoryID, SubCategoryName) VALUES 
    (1, 'shirts'), (1, 'pant'), (1, 'Casual Wear'), (1, 'Formal Attire'),
    (2, 'sharee'), (2, 'Shirts'), (2, 'T-Shirts'), (2, 'Nightie Set'), (2, '3-Piece'), (2, 'leggings'),
    (3, 'Boys’ Fashion'), (3, 'Girls’ Fashion'), (3, 'Newborn Essentials'), (3, 'Party & Occasion Wear'),(3,'Winter Warmers'),(3,'Summer Coolers'),
    (4, 'Denim Essentials'), (4, 'Jeans & Bottoms'), (4, 'Denim Jackets'), (4, 'Outerwear'),(4,'Denim Shirts & Tops'),(4,'Denim Shorts'),
    (5, 'Dresses & Jumpsuits'), (5, 'Tops & Blouses'), (5, 'T-Shirts & Tank Tops'), (5, 'Jeans & Denim'), (5, 'Trousers & Pants'),(5,'Skirts & Shorts'),(5,'Blazers & Jackets'),
    (6, 'Men’s Activewear'), (6, 'Women’s Activewear'), (6, 'Gym & Training Gear'), (6, 'Running Apparel'),(6,'Yoga & Athleisure'),
    (7, 'Men’s Footwear'), (7, 'Women’s Footwear'), (7, 'Casual Shoes'), (7, 'Formal Shoes'),(7,'Boots & Winter Wear'),(7,'Sandals & Slippers'),
    (8, 'Necklaces & Pendants'), (8, 'Earrings & Studs'), (8, 'Bracelets & Bangles'), (8, 'Rings & Finger Jewelry'),(8,'Brooches & Pins'),(8,'Hair Accessories');
    PRINT 'SubCategories created and seeded.';
END
GO

-- 4. SubSubCategories Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SubSubCategories')
BEGIN
    CREATE TABLE SubSubCategories (
        SubSubCategoryID INT PRIMARY KEY IDENTITY(1,1),
        SubCategoryID INT,
        SubSubCategoryName NVARCHAR(100) NOT NULL
    );

    INSERT INTO SubSubCategories (SubCategoryID, SubSubCategoryName) VALUES 
    (1, 'Casual Shirts'), (1, 'Formal Shirts'), (1, 'Denim Shirts'),
    (2, 'Casual Pants'), (2, 'Formal Trousers'), (2, 'Jeans & Denim'),
    (6, 'Full Sleeves Printed'), (6, 'Full Sleeves Solid'), (6, 'Half Sleeves Solid'),
    (7, 'Crew Neck'), (7, 'V Neck'), (7, 'Henley Neck'),
    (13, 'Sleepwear'), (13, 'Loungewear');
    PRINT 'SubSubCategories created and seeded.';
END
GO

-- 5. Sliders Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Sliders')
BEGIN
    CREATE TABLE Sliders (
        SliderID INT PRIMARY KEY,
        Sliderimage NVARCHAR(200) NOT NULL,
        Heading1 NVARCHAR(100),
        Heading2 NVARCHAR(100),
        LinkUrl NVARCHAR(200),
        DisplayOrder INT
    );

    INSERT INTO Sliders (SliderID, Sliderimage, Heading1, Heading2, LinkUrl, DisplayOrder) VALUES
    (1, '_20251124144704.jpg', 'Exclusive Offer', 'Where Fashion Meets Individuality', 'Shop.aspx', 1),
    (2, '_20251124144715.jpg', 'Trending Now', 'Make Your Fashion Look More Stunning', 'Shop.aspx', 2),
    (3, '_20251124144724.jpg', 'Best Collection', 'Discover Your Best Fitting Clothes', 'Shop.aspx', 3);
    PRINT 'Sliders created and seeded.';
END
GO

-- 6. Banners Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Banners')
BEGIN
    CREATE TABLE Banners (
        BannerID INT PRIMARY KEY,
        Bannerimage NVARCHAR(200) NOT NULL,
        Head1 NVARCHAR(100),
        Head2 NVARCHAR(100),
        LinkUrl2 NVARCHAR(200),
        DisplayOrder2 INT
    );

    INSERT INTO Banners (BannerID, Bannerimage, Head1, Head2, LinkUrl2, DisplayOrder2) VALUES
    (1, '_20251124144753.jpg', 'Summer Offer', 'Make Your Fashion Story Unique Every Day', 'Shop.aspx', 1);
    PRINT 'Banners created and seeded.';
END
GO

-- 7. Features Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Features')
BEGIN
    CREATE TABLE Features (
        FeatureID INT PRIMARY KEY IDENTITY(1,1),
        IconPath1 NVARCHAR(200) NOT NULL,
        Title NVARCHAR(100) NOT NULL,
        Description NVARCHAR(200),
        ColorClass NVARCHAR(50),
        DisplayOrder INT DEFAULT 1
    );

    INSERT INTO Features (IconPath1, Title, Description, ColorClass, DisplayOrder) VALUES 
    ('img/Features/feature-icon_1.png', 'Return & refund', 'Money back guarantee', 'purple', 1),
    ('img/Features/feature-icon_2.png', 'Quality Support', 'Always online 24/7', 'green', 2),
    ('img/Features/feature-icon_3.png', 'Secure Payment', '30% off by subscribing', 'orange', 3),
    ('img/Features/feature-icon_4.png', 'Daily Offers', '20% off by subscribing', '', 4);
    PRINT 'Features created and seeded.';
END
GO

-- 8. FlashSell Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'FlashSell')
BEGIN
    CREATE TABLE FlashSell (
        FlashSellID INT PRIMARY KEY,
        ProductImage NVARCHAR(200) NOT NULL,
        Title NVARCHAR(200) NOT NULL,
        OriginalPrice DECIMAL(10, 2) NOT NULL,
        DiscountedPrice DECIMAL(10, 2) NOT NULL,
        DiscountPercentage INT NULL,
        IsNew BIT DEFAULT 0,
        Rating DECIMAL(2, 1),
        ReviewCount INT,
        ColorOptions NVARCHAR(200),
        DisplayOrderFS INT DEFAULT 1,
        CountdownEndDate DATETIME NULL
    );

    INSERT INTO FlashSell (FlashSellID, ProductImage, Title, OriginalPrice, DiscountedPrice, DiscountPercentage, IsNew, Rating, ReviewCount, ColorOptions, DisplayOrderFS, CountdownEndDate)
    VALUES (1, '1_20251125141806.Png', 'Casual Fit Printed Shirt', 1299.00, 899.00, 31, 1, 4.5, 12, 'Red,Blue,Black', 1, DATEADD(day, 15, GETDATE()));
    PRINT 'FlashSell created and seeded.';
END
GO

-- 9. CountdownEvents Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CountdownEvents')
BEGIN
    CREATE TABLE CountdownEvents (
        CountdownID INT PRIMARY KEY,
        EventName NVARCHAR(100),
        CountdownEndDate NVARCHAR(100),
        CountdownDisplayOrder INT
    );

    INSERT INTO CountdownEvents (CountdownID, EventName, CountdownEndDate, CountdownDisplayOrder)
    VALUES (1, 'Mega Year End Sale', '2026-12-31', 1);
    PRINT 'CountdownEvents created and seeded.';
END
GO

-- 10. Categoriespro Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Categoriespro')
BEGIN
    CREATE TABLE Categoriespro (
        CategoryID INT PRIMARY KEY,
        CateIconPath NVARCHAR(200) NOT NULL,
        Title NVARCHAR(100) NOT NULL,
        DisplayOrderC INT
    );

    INSERT INTO Categoriespro (CategoryID, CateIconPath, Title, DisplayOrderC)
    VALUES 
    (1, '_20251124145813.jpg', 'Men''s Collection', 1),
    (2, '_20251124145843.jpg', 'Women''s Western', 2),
    (3, '_20251124145902.jpg', 'Kids & Teens', 3);
    PRINT 'Categoriespro created and seeded.';
END
GO

-- 11. Special Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Special')
BEGIN
    CREATE TABLE Special (
        SpecialID INT PRIMARY KEY,
        Specialimage NVARCHAR(200) NOT NULL,
        TitleOS NVARCHAR(200) NOT NULL,
        DiscountOS NVARCHAR(100) NOT NULL,
        LinkUrlOS NVARCHAR(200),
        DisplayOrderOS INT
    );

    INSERT INTO Special (SpecialID, Specialimage, TitleOS, DiscountOS, LinkUrlOS, DisplayOrderOS)
    VALUES (1, '_20251124150718.jpg', 'Exclusive Seasonal Deals', 'Flat 40% Off', 'Shop.aspx', 1);
    PRINT 'Special created and seeded.';
END
GO

-- 12. SpecialProducts Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SpecialProducts')
BEGIN
    CREATE TABLE SpecialProducts (
        SpecialProductID INT PRIMARY KEY,
        SpecialimageSP NVARCHAR(200) NOT NULL,
        TitleSP NVARCHAR(100) NOT NULL,
        DiscountText NVARCHAR(50) NULL,
        RatingSP DECIMAL(2,1) DEFAULT 0,
        CurrentPrice DECIMAL(10,2) NOT NULL,
        OriginalPriceSP DECIMAL(10,2) NULL,
        DisplayOrderSP INT
    );

    INSERT INTO SpecialProducts (SpecialProductID, SpecialimageSP, TitleSP, DiscountText, RatingSP, CurrentPrice, OriginalPriceSP, DisplayOrderSP)
    VALUES (1, '22_20251124153107.Png', 'Premium Slim Cotton Shirt', '25% Off', 4.8, 999.00, 1399.00, 1);
    PRINT 'SpecialProducts created and seeded.';
END
GO

-- 13. TrendingProducts Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TrendingProducts')
BEGIN
    CREATE TABLE TrendingProducts (
        TrendingProductID INT PRIMARY KEY,
        TrendingimageTP NVARCHAR(200) NOT NULL,
        TitleTP NVARCHAR(100) NOT NULL,
        CurrentPriceTP DECIMAL(10,2) NULL,
        OriginalPriceTP DECIMAL(10,2) NOT NULL,
        DiscountShowTP NVARCHAR(50) NULL,
        RatingTP DECIMAL(2,1) DEFAULT 0,
        ReviewCountTP INT DEFAULT 0,
        IsNewTP BIT DEFAULT 0,
        ColorOptionsTP NVARCHAR(200),
        DisplayOrderTP INT
    );

    INSERT INTO TrendingProducts (TrendingProductID, TrendingimageTP, TitleTP, CurrentPriceTP, OriginalPriceTP, DiscountShowTP, RatingTP, ReviewCountTP, IsNewTP, ColorOptionsTP, DisplayOrderTP)
    VALUES (1, '3_20251124153207.Png', 'Navy Blue Casual Shirt', 849.00, 1299.00, '35% Off', 4.5, 18, 1, 'Navy,Grey', 1);
    PRINT 'TrendingProducts created and seeded.';
END
GO

-- 14. TrendingProducts2 Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TrendingProducts2')
BEGIN
    CREATE TABLE TrendingProducts2 (
        TrendingProduct2ID INT PRIMARY KEY,
        TrendingimageTP2 NVARCHAR(200) NOT NULL,
        TitleTP2 NVARCHAR(100) NOT NULL,
        CurrentPriceTP2 DECIMAL(10,2) NULL,
        OriginalPriceTP2 DECIMAL(10,2) NOT NULL,
        DiscountShowTP2 NVARCHAR(50) NULL,
        RatingTP2 DECIMAL(2,1) DEFAULT 0,
        ReviewCountTP2 INT DEFAULT 0,
        IsNewTP2 BIT DEFAULT 0,
        ColorOptionsTP2 NVARCHAR(200),
        DisplayOrderTP2 INT
    );

    INSERT INTO TrendingProducts2 (TrendingProduct2ID, TrendingimageTP2, TitleTP2, CurrentPriceTP2, OriginalPriceTP2, DiscountShowTP2, RatingTP2, ReviewCountTP2, IsNewTP2, ColorOptionsTP2, DisplayOrderTP2)
    VALUES (1, '4_20251124153238.Png', 'Urban Checked Casual Shirt', 899.00, 1499.00, '40% Off', 4.6, 22, 1, 'Black,Red', 1);
    PRINT 'TrendingProducts2 created and seeded.';
END
GO

-- 15. TrendingProducts3 Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TrendingProducts3')
BEGIN
    CREATE TABLE TrendingProducts3 (
        TrendingProduct3ID INT PRIMARY KEY,
        TrendingimageTP3 NVARCHAR(200) NOT NULL,
        TitleTP3 NVARCHAR(100) NOT NULL,
        CurrentPriceTP3 DECIMAL(10,2) NULL,
        OriginalPriceTP3 DECIMAL(10,2) NOT NULL,
        DiscountShowTP3 NVARCHAR(50) NULL,
        RatingTP3 DECIMAL(2,1) DEFAULT 0,
        ReviewCountTP3 INT DEFAULT 0,
        IsNewTP3 BIT DEFAULT 0,
        ColorOptionsTP3 NVARCHAR(200),
        DisplayOrderTP3 INT
    );

    INSERT INTO TrendingProducts3 (TrendingProduct3ID, TrendingimageTP3, TitleTP3, CurrentPriceTP3, OriginalPriceTP3, DiscountShowTP3, RatingTP3, ReviewCountTP3, IsNewTP3, ColorOptionsTP3, DisplayOrderTP3)
    VALUES (1, '5_20251124153358.Png', 'Pure Linen White Shirt', 1199.00, 1699.00, '29% Off', 4.7, 15, 1, 'White', 1);
    PRINT 'TrendingProducts3 created and seeded.';
END
GO

-- 16. TrendingProducts4 Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TrendingProducts4')
BEGIN
    CREATE TABLE TrendingProducts4 (
        TrendingProduct4ID INT PRIMARY KEY,
        TrendingimageTP4 NVARCHAR(200) NOT NULL,
        TitleTP4 NVARCHAR(100) NOT NULL,
        CurrentPriceTP4 DECIMAL(10,2) NULL,
        OriginalPriceTP4 DECIMAL(10,2) NOT NULL,
        DiscountShowTP4 NVARCHAR(50) NULL,
        RatingTP4 DECIMAL(2,1) DEFAULT 0,
        ReviewCountTP4 INT DEFAULT 0,
        IsNewTP4 BIT DEFAULT 0,
        ColorOptionsTP4 NVARCHAR(200),
        DisplayOrderTP4 INT
    );

    INSERT INTO TrendingProducts4 (TrendingProduct4ID, TrendingimageTP4, TitleTP4, CurrentPriceTP4, OriginalPriceTP4, DiscountShowTP4, RatingTP4, ReviewCountTP4, IsNewTP4, ColorOptionsTP4, DisplayOrderTP4)
    VALUES (1, '6_20251124153433.Png', 'Formal Striped Dress Shirt', 949.00, 1399.00, '32% Off', 4.4, 9, 1, 'Blue,White', 1);
    PRINT 'TrendingProducts4 created and seeded.';
END
GO

-- 17. BestSellingProducts Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'BestSellingProducts')
BEGIN
    CREATE TABLE BestSellingProducts (
        BestSellingProductID INT PRIMARY KEY,
        BestSellingimage NVARCHAR(200) NOT NULL,
        TitleBS NVARCHAR(100) NOT NULL,
        CurrentPriceBS DECIMAL(10,2) NOT NULL,
        OriginalPriceBS DECIMAL(10,2) NULL,
        LinkUrlBS NVARCHAR(200),
        DisplayOrderBS INT
    );

    INSERT INTO BestSellingProducts (BestSellingProductID, BestSellingimage, TitleBS, CurrentPriceBS, OriginalPriceBS, LinkUrlBS, DisplayOrderBS)
    VALUES (1, '1_20251126153252.Png', 'Trending Stylish Jacket', 1999.00, 2799.00, 'Shop.aspx', 1);
    PRINT 'BestSellingProducts created and seeded.';
END
GO

-- 18. BestSellingProducts2 Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'BestSellingProducts2')
BEGIN
    CREATE TABLE BestSellingProducts2 (
        BestSellingProduct2ID INT PRIMARY KEY,
        BestSellingimage2 NVARCHAR(200) NOT NULL,
        TitleBS2 NVARCHAR(100) NOT NULL,
        CurrentPriceBS2 DECIMAL(10,2) NOT NULL,
        OriginalPriceBS2 DECIMAL(10,2) NULL,
        LinkUrlBS2 NVARCHAR(200),
        DisplayOrderBS2 INT
    );

    INSERT INTO BestSellingProducts2 (BestSellingProduct2ID, BestSellingimage2, TitleBS2, CurrentPriceBS2, OriginalPriceBS2, LinkUrlBS2, DisplayOrderBS2)
    VALUES (1, '2_20251126153747.Png', 'Classic Denim Jacket', 1799.00, 2499.00, 'Shop.aspx', 1);
    PRINT 'BestSellingProducts2 created and seeded.';
END
GO

-- 19. NewarrivalProducts Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'NewarrivalProducts')
BEGIN
    CREATE TABLE NewarrivalProducts (
        ArrivalID INT PRIMARY KEY,
        ArrivalImage NVARCHAR(200) NOT NULL,
        TitleNA NVARCHAR(200) NOT NULL,
        OriginalPriceNA DECIMAL(10, 2) NOT NULL,
        IsNewNA BIT DEFAULT 0,
        RatingNA DECIMAL(2, 1),
        ReviewCountNA INT,
        ColorOptionsNA NVARCHAR(200),
        DisplayOrderNA INT 
    );

    INSERT INTO NewarrivalProducts (ArrivalID, ArrivalImage, TitleNA, OriginalPriceNA, IsNewNA, RatingNA, ReviewCountNA, ColorOptionsNA, DisplayOrderNA)
    VALUES (1, '7_20251124153503.Png', 'Modern Slim-Fit Trousers', 1099.00, 1, 4.3, 7, 'Beige,Black', 1);
    PRINT 'NewarrivalProducts created and seeded.';
END
GO

-- 20. BundleBanner Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'BundleBanner')
BEGIN
    CREATE TABLE BundleBanner (
        BannerBID INT PRIMARY KEY,
        BannerImageB NVARCHAR(200) NOT NULL,
        TitleB NVARCHAR(100) NOT NULL,
        DiscountTextB NVARCHAR(50) NULL,        
        OfferTextB NVARCHAR(100) NULL,        
        DisplayOrderB INT
    );

    INSERT INTO BundleBanner (BannerBID, BannerImageB, TitleB, DiscountTextB, OfferTextB, DisplayOrderB)
    VALUES (1, '1_20251119180046.jpg', 'Exclusive Style Bundle', 'Buy 2 Get 1 Free', 'Limited Time Discount Offer', 1);
    PRINT 'BundleBanner created and seeded.';
END
GO

-- 21. FavoriteProducts Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'FavoriteProducts')
BEGIN
    CREATE TABLE FavoriteProducts (
        FavoriteID INT PRIMARY KEY,
        FavoriteImage NVARCHAR(200) NOT NULL,
        TitleF NVARCHAR(200) NOT NULL,
        CurrentPriceF DECIMAL(10,2) NULL,
        OriginalPriceF DECIMAL(10,2) NOT NULL,
        DiscountShowF NVARCHAR(50) NULL,
        IsNewF BIT DEFAULT 0,
        RatingF DECIMAL(2, 1),
        ReviewCountF INT,
        DisplayOrderF INT 
    );

    INSERT INTO FavoriteProducts (FavoriteID, FavoriteImage, TitleF, CurrentPriceF, OriginalPriceF, DiscountShowF, IsNewF, RatingF, ReviewCountF, DisplayOrderF)
    VALUES (1, '1_20251125141806.Png', 'Casual Fit Printed Shirt', 899.00, 1299.00, '31% Off', 1, 4.5, 12, 1);
    PRINT 'FavoriteProducts created and seeded.';
END
GO

-- 22. Brands Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Brands')
BEGIN
    CREATE TABLE Brands (
        BrandID INT PRIMARY KEY,
        BrandImage NVARCHAR(200) NOT NULL,       
        DisplayOrder INT
    );

    INSERT INTO Brands (BrandID, BrandImage, DisplayOrder)
    VALUES 
    (1, '10_20251124174915.Png', 1),
    (2, '11_20251124174924.Png', 2),
    (3, '12_20251124174928.Png', 3),
    (4, '13_20251124174933.Png', 4);
    PRINT 'Brands created and seeded.';
END
GO

-- 23. NewsArticles Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'NewsArticles')
BEGIN
    CREATE TABLE NewsArticles (
        BlogID INT PRIMARY KEY,
        BlogImage NVARCHAR(500) NOT NULL,
        AuthorName NVARCHAR(100),
        PublishDate DATE,
        Title NVARCHAR(300) NOT NULL,
        CommentsCount INT DEFAULT 0,
        DisplayOrder INT
    );

    INSERT INTO NewsArticles (BlogID, BlogImage, AuthorName, PublishDate, Title, CommentsCount, DisplayOrder)
    VALUES 
    (1, '1_20251125164912.Png', 'Fashion Trends', '2026-11-20', 'Top Men & Women Fashion Trends for the Upcoming Season', 5, 1),
    (2, '2_20251125165029.Png', 'Style Guide', '2026-11-22', 'How to Match Accessories with Casual and Formal Outfits', 3, 2);
    PRINT 'NewsArticles created and seeded.';
END
GO

-- 24. ProductsShop Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ProductsShop')
BEGIN
    CREATE TABLE ProductsShop (
        ShopProductID INT PRIMARY KEY,
        Shopimage NVARCHAR(200) NOT NULL,
        ProductImage NVARCHAR(200) NULL,
        Title NVARCHAR(100) NOT NULL,
        CurrentPrice DECIMAL(10,2) NULL,
        DiscountedPrice DECIMAL(10,2) NULL,
        OriginalPrice DECIMAL(10,2) NOT NULL,
        DiscountPercentage NVARCHAR(50) NULL,
        Rating DECIMAL(2,1) DEFAULT 0,
        ReviewCount INT DEFAULT 0,
        IsNew BIT DEFAULT 0,
        DisplayOrder INT,
        DisplayOrderFS INT NULL
    );

    INSERT INTO ProductsShop (ShopProductID, Shopimage, Title, CurrentPrice, OriginalPrice, DiscountPercentage, Rating, ReviewCount, IsNew, DisplayOrder)
    VALUES 
    (1, '1_20251125141806.Png', 'Graphic Cotton T-Shirt', 499.00, 799.00, '37%', 4.4, 8, 1, 1),
    (2, '22_20251124153107.Png', 'Slim Fit Denim Jeans', 999.00, 1499.00, '33%', 4.6, 12, 1, 2);
    PRINT 'ProductsShop created and seeded.';
END
GO

-- 25. Users Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
BEGIN
    CREATE TABLE Users (
        UserId INT PRIMARY KEY IDENTITY(1,1),
        FullName NVARCHAR(100),
        Email NVARCHAR(100) UNIQUE,
        Password NVARCHAR(100),
        CreatedDate DATETIME DEFAULT GETDATE()
    );
    PRINT 'Users table created.';
END
GO

PRINT '==========================================================';
PRINT 'All E-Commerce tables and seed data created successfully!';
PRINT '==========================================================';

-- 26. Products (Admin Dashboard)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Products')
BEGIN
    CREATE TABLE [dbo].[Products] (
        [ProductID] INT IDENTITY(1,1) PRIMARY KEY,
        [ProductName] NVARCHAR(255) NOT NULL,
        [Category] NVARCHAR(100) NULL,
        [Price] DECIMAL(18,2) DEFAULT 0,
        [StockQuantity] INT DEFAULT 0,
        [ProductImage] NVARCHAR(255) NULL,
        [IsActive] BIT DEFAULT 1,
        [CreatedDate] DATETIME DEFAULT GETDATE()
    );
    INSERT INTO [dbo].[Products] ([ProductName], [Category], [Price], [StockQuantity], [ProductImage], [IsActive]) VALUES
    ('Slim Fit Casual Shirt', 'Men’s Fashion', 899.00, 45, '1_20251125141806.Png', 1),
    ('Premium Denim Jacket', 'Denim Collection', 1999.00, 20, '2_20251126153747.Png', 1);
END
GO

-- 27. Orders (Admin Dashboard)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Orders')
BEGIN
    CREATE TABLE [dbo].[Orders] (
        [OrderID] INT IDENTITY(1,1) PRIMARY KEY,
        [CustomerName] NVARCHAR(255) NOT NULL,
        [TotalAmount] DECIMAL(18,2) DEFAULT 0,
        [OrderDate] DATETIME DEFAULT GETDATE(),
        [Status] NVARCHAR(50) DEFAULT 'Pending'
    );
    INSERT INTO [dbo].[Orders] ([CustomerName], [TotalAmount], [OrderDate], [Status]) VALUES
    ('Aarav Mehta', 1798.00, DATEADD(hour, -2, GETDATE()), 'Delivered'),
    ('Ananya Sharma', 899.00, DATEADD(hour, -5, GETDATE()), 'Shipped');
END
GO

-- 28. Customers (Admin Dashboard)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Customers')
BEGIN
    CREATE TABLE [dbo].[Customers] (
        [CustomerID] INT IDENTITY(1,1) PRIMARY KEY,
        [CustomerName] NVARCHAR(255) NOT NULL,
        [Email] NVARCHAR(255) NULL,
        [Phone] NVARCHAR(50) NULL,
        [CreatedDate] DATETIME DEFAULT GETDATE()
    );
    INSERT INTO [dbo].[Customers] ([CustomerName], [Email], [Phone]) VALUES
    ('Aarav Mehta', 'aarav@gmail.com', '9876543201'),
    ('Ananya Sharma', 'ananya@gmail.com', '9876543202');
END
GO

USE [E-commerce1];
GO

-- 1. FlashSell
DELETE FROM FlashSell;
INSERT INTO FlashSell (FlashSellID, ProductImage, Title, OriginalPrice, DiscountedPrice, DiscountPercentage, IsNew, Rating, ReviewCount, ColorOptions, DisplayOrderFS, CountdownEndDate) VALUES
(1, '1_20251125141806.Png', 'Casual Fit Printed Shirt', 1299.00, 899.00, 31, 1, 4.5, 12, '', 1, '2026-12-31'),
(2, '1_20251125141825.Png', 'Slim Fit Denim Jeans', 1999.00, 1399.00, 30, 0, 4.8, 25, '', 2, '2026-12-31'),
(3, '1_20251125144625.Png', 'Classic Cotton Polo T-Shirt', 999.00, 699.00, 30, 1, 4.2, 18, '', 3, '2026-12-31'),
(4, '1_20251125145148.Png', 'Men Stylish Bomber Jacket', 2999.00, 1999.00, 33, 0, 4.9, 34, '', 4, '2026-12-31'),
(5, '1_20251125145244.Png', 'Designer Casual Sneakers', 2499.00, 1749.00, 30, 1, 4.6, 20, '', 5, '2026-12-31'),
(6, '1_20251126140943.Png', 'Premium Leather Wallet & Belt', 1499.00, 999.00, 33, 0, 4.7, 15, '', 6, '2026-12-31'),
(7, '1_20251126141158.Png', 'Women Floral Maxi Dress', 2199.00, 1499.00, 32, 1, 4.4, 28, '', 7, '2026-12-31'),
(8, '1_20251126141655.Png', 'Trendy Urban Hoodie', 1899.00, 1299.00, 31, 0, 4.6, 19, '', 8, '2026-12-31');

-- 2. Categoriespro (11 circular categories)
DELETE FROM Categoriespro;
INSERT INTO Categoriespro (CategoryID, CateIconPath, Title, DisplayOrderC) VALUES
(1, '_20251124145813.jpg', 'Men''s Collection', 1),
(2, '_20251124145843.jpg', 'Women''s Western', 2),
(3, '_20251124145902.jpg', 'Kids & Teens', 3),
(4, '_20251124145909.jpg', 'Footwear', 4),
(5, '_20251124145953.jpg', 'Accessories', 5),
(6, '_20251124150003.jpg', 'Sportswear', 6),
(7, '_20251124150017.jpg', 'Winter Wear', 7),
(8, '_20251124150030.jpg', 'Beauty & Care', 8),
(9, '_20251124150043.jpg', 'Jewelry & Watches', 9),
(10, '_20251124150059.jpg', 'Denim Hub', 10),
(11, '_20251124150108.jpg', 'Bags & Luggage', 11);

-- 3. SpecialProducts (4 items in 2x2 grid)
DELETE FROM SpecialProducts;
INSERT INTO SpecialProducts (SpecialProductID, SpecialimageSP, TitleSP, DiscountText, RatingSP, CurrentPrice, OriginalPriceSP, DisplayOrderSP) VALUES
(1, '_20251124145021.png', 'Premium Slim Cotton Shirt', '25', 4.5, 999.00, 1499.00, 1),
(2, '_20251124145125.png', 'Elegant Summer Floral Top', '30', 4.7, 849.00, 1299.00, 2),
(3, '_20251124145204.png', 'Comfort Stretch Chino Pants', '20', 4.3, 1199.00, 1599.00, 3),
(4, '_20251124145242.png', 'Classic Checked Flannel', '35', 4.8, 1099.00, 1699.00, 4);

-- 4. TrendingProducts (Western) - 4 items
DELETE FROM TrendingProducts;
INSERT INTO TrendingProducts (TrendingProductID, TrendingimageTP, TitleTP, CurrentPriceTP, OriginalPriceTP, DiscountShowTP, RatingTP, ReviewCountTP, IsNewTP, ColorOptionsTP, DisplayOrderTP) VALUES
(1, '22_20251124153107.Png', 'Navy Blue Casual Shirt', 849.00, 1299.00, '35', 4.5, 18, 1, '', 1),
(2, '3_20251124153207.Png', 'Vintage Washed Denim Jacket', 1899.00, 2499.00, '24', 4.8, 32, 0, '', 2),
(3, '4_20251124153238.Png', 'Boho Style Printed Tunic', 799.00, 1199.00, '33', 4.6, 14, 1, '', 3),
(4, '5_20251124153358.Png', 'Slim Fit Stretch Jeans', 1499.00, 1999.00, '25', 4.4, 21, 0, '', 4);

-- 5. TrendingProducts2 (Tops) - 4 items
DELETE FROM TrendingProducts2;
INSERT INTO TrendingProducts2 (TrendingProduct2ID, TrendingimageTP2, TitleTP2, CurrentPriceTP2, OriginalPriceTP2, DiscountShowTP2, RatingTP2, ReviewCountTP2, IsNewTP2, ColorOptionsTP2, DisplayOrderTP2) VALUES
(1, '_20251124153930.Png', 'Women Off-Shoulder Top', 699.00, 999.00, '30', 4.3, 15, 1, '', 1),
(2, '2_20251125142600.Png', 'Classic White Linen Shirt', 899.00, 1399.00, '35', 4.7, 27, 0, '', 2),
(3, '2_20251125150036.Png', 'Striped Casual Crewneck', 599.00, 899.00, '33', 4.5, 19, 1, '', 3),
(4, '3_20251125163238.Png', 'Sleeveless Summer Blouse', 749.00, 1099.00, '32', 4.6, 22, 0, '', 4);

-- 6. TrendingProducts3 (Bags) - 4 items
DELETE FROM TrendingProducts3;
INSERT INTO TrendingProducts3 (TrendingProduct3ID, TrendingimageTP3, TitleTP3, CurrentPriceTP3, OriginalPriceTP3, DiscountShowTP3, RatingTP3, ReviewCountTP3, IsNewTP3, ColorOptionsTP3, DisplayOrderTP3) VALUES
(1, '3_20251125163250.Png', 'Leather Crossbody Handbag', 1599.00, 2299.00, '30', 4.8, 42, 1, '', 1),
(2, '3_20251125163254.Png', 'Canvas Travel Backpack', 1299.00, 1899.00, '31', 4.6, 35, 0, '', 2),
(3, '3_20251125163519.Png', 'Vintage Messenger Satchel', 1799.00, 2499.00, '28', 4.9, 19, 1, '', 3),
(4, '3_20251201160116.Png', 'Casual Tote Shoulder Bag', 999.00, 1499.00, '33', 4.4, 28, 0, '', 4);

-- 7. TrendingProducts4 (Shoes) - 4 items
DELETE FROM TrendingProducts4;
INSERT INTO TrendingProducts4 (TrendingProduct4ID, TrendingimageTP4, TitleTP4, CurrentPriceTP4, OriginalPriceTP4, DiscountShowTP4, RatingTP4, ReviewCountTP4, IsNewTP4, ColorOptionsTP4, DisplayOrderTP4) VALUES
(1, '3_20251201160128.Png', 'Mesh Athletic Running Shoes', 1799.00, 2499.00, '28', 4.7, 50, 1, '', 1),
(2, '3_20251202163202.Png', 'Classic Oxford Formal Shoes', 2299.00, 3199.00, '28', 4.9, 38, 0, '', 2),
(3, '4_20251124153246.Png', 'Comfort Slip-On Loafers', 1499.00, 1999.00, '25', 4.5, 23, 1, '', 3),
(4, '4_20251201160213.Png', 'High-Top Streetwear Sneakers', 1999.00, 2799.00, '28', 4.8, 44, 0, '', 4);

-- 8. BestSellingProducts - 3 items
DELETE FROM BestSellingProducts;
INSERT INTO BestSellingProducts (BestSellingProductID, BestSellingimage, TitleBS, CurrentPriceBS, OriginalPriceBS, LinkUrlBS, DisplayOrderBS) VALUES
(1, '_20251126152308.jpg', 'Trending Stylish Jacket', 1999.00, 2799.00, 'shop_details.aspx', 1),
(2, '_20251126152321.jpg', 'Casual Winter Overcoat', 2499.00, 3499.00, 'shop_details.aspx', 2),
(3, '_20251126152355.jpg', 'Urban Windbreaker Parka', 1799.00, 2499.00, 'shop_details.aspx', 3);

-- 9. NewarrivalProducts - 4 items
DELETE FROM NewarrivalProducts;
INSERT INTO NewarrivalProducts (ArrivalID, ArrivalImage, TitleNA, OriginalPriceNA, IsNewNA, RatingNA, ReviewCountNA, ColorOptionsNA, DisplayOrderNA) VALUES
(1, '6_20251124153433.Png', 'Modern Slim-Fit Trousers', 1099.00, 1, 4.5, 7, '', 1),
(2, '7_20251124153503.Png', 'Graphic Print Cotton Tee', 649.00, 1, 4.8, 16, '', 2),
(3, '8_20251124153544.Png', 'Oversized Knit Cardigan', 1399.00, 1, 4.6, 12, '', 3),
(4, '1_20251127142404.png', 'Structured Trench Coat', 2899.00, 1, 4.9, 21, '', 4);

-- 10. FavoriteProducts - 5 items (for 4-item carousel)
DELETE FROM FavoriteProducts;
INSERT INTO FavoriteProducts (FavoriteID, FavoriteImage, TitleF, CurrentPriceF, OriginalPriceF, DiscountShowF, IsNewF, RatingF, ReviewCountF, DisplayOrderF) VALUES
(1, '1_20251126140943.Png', 'Casual Fit Printed Shirt', 899.00, 1299.00, '31', 1, 4.5, 12, 1),
(2, '1_20251126141158.Png', 'Slim Fit Chino Trousers', 1199.00, 1699.00, '29', 0, 4.7, 24, 2),
(3, '1_20251126141655.Png', 'Denim Trucker Jacket', 1999.00, 2699.00, '26', 1, 4.8, 30, 3),
(4, '1_20251126151050.Png', 'Classic Crewneck Pullover', 999.00, 1499.00, '33', 0, 4.4, 15, 4),
(5, '1_20251126151415.Png', 'Athletic Performance Joggers', 849.00, 1199.00, '29', 1, 4.6, 18, 5);

-- 11. Brands - 10 items
DELETE FROM Brands;
INSERT INTO Brands (BrandID, BrandImage, DisplayOrder) VALUES
(1, '1_20251124174608.Png', 1),
(2, '2_20251124174822.Png', 2),
(3, '3_20251124174827.Png', 3),
(4, '4_20251124174834.Png', 4),
(5, '5_20251124174839.Png', 5),
(6, '6_20251124174844.Png', 6),
(7, '7_20251124174852.Png', 7),
(8, '8_20251124174857.Png', 8),
(9, '9_20251124174904.Png', 9),
(10, '10_20251124174915.Png', 10);

-- 12. NewsArticles - 4 items
DELETE FROM NewsArticles;
INSERT INTO NewsArticles (BlogID, BlogImage, AuthorName, PublishDate, Title, CommentsCount, DisplayOrder) VALUES
(1, '1_20251125164912.Png', 'Admin', '2025-11-20', 'Top 10 Fashion Trends You Need to Try This Winter Season', 5, 1),
(2, '2_20251125165029.Png', 'Admin', '2025-11-22', 'How to Style Denim Jackets for Any Occasion Effortlessly', 8, 2),
(3, '3_20251125164450.Png', 'Admin', '2025-11-24', 'The Ultimate Guide to Sustainable and Eco-Friendly Wardrobes', 12, 3),
(4, '4_20251125165125.Png', 'Admin', '2025-11-25', 'Essential Accessories That Elevate Every Simple Everyday Outfit', 6, 4);

PRINT 'All products and categories seeded successfully!';
GO
USE [E-commerce1];
GO

-- 1. FlashSell (8 distinct products with product_1.png to product_8.png)
DELETE FROM FlashSell;
INSERT INTO FlashSell (FlashSellID, ProductImage, Title, OriginalPrice, DiscountedPrice, DiscountPercentage, IsNew, Rating, ReviewCount, ColorOptions, DisplayOrderFS, CountdownEndDate) VALUES
(1, 'product_1.png', 'Casual Printed T-Shirt', 75.00, 49.00, 35, 1, 4.8, 18, '', 1, '2026-12-31'),
(2, 'product_2.png', 'Slim Fit Denim Jeans', 120.00, 89.00, 26, 0, 4.6, 24, '', 2, '2026-12-31'),
(3, 'product_3.png', 'Premium Leather Jacket', 220.00, 149.00, 32, 1, 4.9, 32, '', 3, '2026-12-31'),
(4, 'product_4.png', 'Women Floral Summer Dress', 95.00, 65.00, 32, 0, 4.7, 15, '', 4, '2026-12-31'),
(5, 'product_5.png', 'Classic Sports Sneakers', 160.00, 110.00, 31, 1, 4.5, 42, '', 5, '2026-12-31'),
(6, 'product_6.png', 'Vintage Cotton Hoodie', 80.00, 55.00, 31, 0, 4.4, 19, '', 6, '2026-12-31'),
(7, 'product_7.png', 'Urban Chino Trousers', 100.00, 70.00, 30, 1, 4.8, 28, '', 7, '2026-12-31'),
(8, 'product_8.png', 'Elegant Formal Blazer', 190.00, 135.00, 29, 0, 4.9, 35, '', 8, '2026-12-31');

-- 2. Categoriespro (9 unique circular categories: category_img_1.png to category_img_9.png)
DELETE FROM Categoriespro;
INSERT INTO Categoriespro (CategoryID, CateIconPath, Title, DisplayOrderC) VALUES
(1, 'category_img_1.png', 'Men''s Fashion', 1),
(2, 'category_img_2.png', 'Women''s Wear', 2),
(3, 'category_img_3.png', 'Kids Fashion', 3),
(4, 'category_img_4.png', 'Footwear', 4),
(5, 'category_img_5.png', 'Bags & Purses', 5),
(6, 'category_img_6.png', 'Sportswear', 6),
(7, 'category_img_7.png', 'Winter Wear', 7),
(8, 'category_img_8.png', 'Beauty & Care', 8),
(9, 'category_img_9.png', 'Accessories', 9);

-- 3. SpecialProducts (4 items in 2x2 grid: product_9.png to product_12.png)
DELETE FROM SpecialProducts;
INSERT INTO SpecialProducts (SpecialProductID, SpecialimageSP, TitleSP, DiscountText, RatingSP, CurrentPrice, OriginalPriceSP, DisplayOrderSP) VALUES
(1, 'product_9.png', 'Luxury Silk Shirt', '25', 4.8, 75.00, 100.00, 1),
(2, 'product_10.png', 'Casual Checked Shirt', '30', 4.6, 60.00, 90.00, 2),
(3, 'product_11.png', 'Woolen Winter Sweater', '35', 4.9, 85.00, 120.00, 3),
(4, 'product_12.png', 'Designer Summer Top', '20', 4.5, 50.00, 70.00, 4);

-- 4. TrendingProducts (Western - 4 items: product_13.png to product_16.png)
DELETE FROM TrendingProducts;
INSERT INTO TrendingProducts (TrendingProductID, TrendingimageTP, TitleTP, CurrentPriceTP, OriginalPriceTP, DiscountShowTP, RatingTP, ReviewCountTP, IsNewTP, ColorOptionsTP, DisplayOrderTP) VALUES
(1, 'product_13.png', 'Western Denim Vest', 65.00, 95.00, '32', 4.7, 18, 1, '', 1),
(2, 'product_14.png', 'Classic Plaid Flannel', 55.00, 80.00, '31', 4.5, 22, 0, '', 2),
(3, 'product_15.png', 'Vintage Leather Boots', 130.00, 180.00, '28', 4.9, 35, 1, '', 3),
(4, 'product_16.png', 'Boho Fringe Jacket', 95.00, 140.00, '32', 4.6, 14, 0, '', 4);

-- 5. TrendingProducts2 (Tops - 4 items: product_17.png to product_20.png)
DELETE FROM TrendingProducts2;
INSERT INTO TrendingProducts2 (TrendingProduct2ID, TrendingimageTP2, TitleTP2, CurrentPriceTP2, OriginalPriceTP2, DiscountShowTP2, RatingTP2, ReviewCountTP2, IsNewTP2, ColorOptionsTP2, DisplayOrderTP2) VALUES
(1, 'product_17.png', 'Embroidered Crop Top', 45.00, 65.00, '31', 4.4, 19, 1, '', 1),
(2, 'product_18.png', 'Linen Button-Down Shirt', 58.00, 85.00, '32', 4.8, 27, 0, '', 2),
(3, 'product_19.png', 'Striped Cotton Pullover', 62.00, 90.00, '31', 4.5, 16, 1, '', 3),
(4, 'product_20.png', 'Solid Casual Tunic', 48.00, 70.00, '31', 4.6, 21, 0, '', 4);

-- 6. TrendingProducts3 (Bags - 4 items: product_21.png to product_24.png)
DELETE FROM TrendingProducts3;
INSERT INTO TrendingProducts3 (TrendingProduct3ID, TrendingimageTP3, TitleTP3, CurrentPriceTP3, OriginalPriceTP3, DiscountShowTP3, RatingTP3, ReviewCountTP3, IsNewTP3, ColorOptionsTP3, DisplayOrderTP3) VALUES
(1, 'product_21.png', 'Leather Crossbody Bag', 85.00, 125.00, '32', 4.8, 32, 1, '', 1),
(2, 'product_22.png', 'Canvas Everyday Backpack', 65.00, 95.00, '32', 4.7, 40, 0, '', 2),
(3, 'product_23.png', 'Elegant Evening Clutch', 50.00, 75.00, '33', 4.5, 15, 1, '', 3),
(4, 'product_24.png', 'Travel Duffle Bag', 110.00, 160.00, '31', 4.9, 28, 0, '', 4);

-- 7. TrendingProducts4 (Shoes - 4 items: product_25.png to product_28.png)
DELETE FROM TrendingProducts4;
INSERT INTO TrendingProducts4 (TrendingProduct4ID, TrendingimageTP4, TitleTP4, CurrentPriceTP4, OriginalPriceTP4, DiscountShowTP4, RatingTP4, ReviewCountTP4, IsNewTP4, ColorOptionsTP4, DisplayOrderTP4) VALUES
(1, 'product_25.png', 'Breathable Running Shoes', 95.00, 140.00, '32', 4.8, 50, 1, '', 1),
(2, 'product_26.png', 'Classic Oxford Loafers', 115.00, 165.00, '30', 4.9, 38, 0, '', 2),
(3, 'product_27.png', 'Suede Chelsea Boots', 140.00, 200.00, '30', 4.7, 24, 1, '', 3),
(4, 'product_28.png', 'Casual Canvas Sneakers', 60.00, 85.00, '29', 4.6, 42, 0, '', 4);

-- 8. BestSellingProducts (3 items: best_sell_pro_img_1.jpg to best_sell_pro_img_3.jpg)
DELETE FROM BestSellingProducts;
INSERT INTO BestSellingProducts (BestSellingProductID, BestSellingimage, TitleBS, CurrentPriceBS, OriginalPriceBS, LinkUrlBS, DisplayOrderBS) VALUES
(1, 'best_sell_pro_img_1.jpg', 'Trending Stylish Jacket', 85.00, 120.00, 'shop_details.aspx', 1),
(2, 'best_sell_pro_img_2.jpg', 'Casual Winter Overcoat', 125.00, 175.00, 'shop_details.aspx', 2),
(3, 'best_sell_pro_img_3.jpg', 'Urban Windbreaker Parka', 95.00, 135.00, 'shop_details.aspx', 3);

-- 8b. BestSellingProducts2 (1 large feature item: best_sell_pro_img_4.jpg)
DELETE FROM BestSellingProducts2;
INSERT INTO BestSellingProducts2 (BestSellingProduct2ID, BestSellingimage2, TitleBS2, CurrentPriceBS2, OriginalPriceBS2, LinkUrlBS2, DisplayOrderBS2) VALUES
(1, 'best_sell_pro_img_4.jpg', 'Classic Denim Jacket', 149.00, 210.00, 'shop_details.aspx', 1);

-- 9. NewarrivalProducts (4 items: product_29.png, product_30.png, 2_20251124153107.Png, _20251124153930.Png)
DELETE FROM NewarrivalProducts;
INSERT INTO NewarrivalProducts (ArrivalID, ArrivalImage, TitleNA, OriginalPriceNA, IsNewNA, RatingNA, ReviewCountNA, ColorOptionsNA, DisplayOrderNA) VALUES
(1, 'product_29.png', 'Modern Slim-Fit Trousers', 75.00, 1, 4.6, 12, '', 1),
(2, 'product_30.png', 'Structured Trench Coat', 165.00, 1, 4.9, 25, '', 2),
(3, '2_20251124153107.Png', 'Navy Blue Casual Shirt', 65.00, 1, 4.7, 18, '', 3),
(4, '_20251124153930.Png', 'Women Off-Shoulder Top', 52.00, 1, 4.5, 14, '', 4);

-- 10. FavoriteProducts - 5 distinct items (for 4-item carousel)
DELETE FROM FavoriteProducts;
INSERT INTO FavoriteProducts (FavoriteID, FavoriteImage, TitleF, CurrentPriceF, OriginalPriceF, DiscountShowF, IsNewF, RatingF, ReviewCountF, DisplayOrderF) VALUES
(1, '1_20251126140943.Png', 'Casual Leather Belt & Wallet', 45.00, 65.00, '31', 1, 4.7, 18, 1),
(2, '1_20251126141158.Png', 'Women Floral Maxi Blouse', 58.00, 85.00, '32', 0, 4.8, 22, 2),
(3, '1_20251126141655.Png', 'Denim Trucker Jacket', 120.00, 170.00, '29', 1, 4.9, 31, 3),
(4, '1_20251126151050.Png', 'Classic Knit Cardigan', 75.00, 110.00, '32', 0, 4.6, 15, 4),
(5, '1_20251126151415.Png', 'Athletic Performance Joggers', 65.00, 95.00, '32', 1, 4.8, 20, 5);

-- 11. Brands - 10 distinct brand logos (brand1.png to brand10.png)
DELETE FROM Brands;
INSERT INTO Brands (BrandID, BrandImage, DisplayOrder) VALUES
(1, 'brand1.png', 1),
(2, 'brand2.png', 2),
(3, 'brand3.png', 3),
(4, 'brand4.png', 4),
(5, 'brand5.png', 5),
(6, 'brand6.png', 6),
(7, 'brand7.png', 7),
(8, 'brand8.png', 8),
(9, 'brand9.png', 9),
(10, 'brand10.png', 10);

-- 12. NewsArticles - 4 unique articles (blog_img_1.png to blog_img_4.png)
DELETE FROM NewsArticles;
INSERT INTO NewsArticles (BlogID, BlogImage, AuthorName, PublishDate, Title, CommentsCount, DisplayOrder) VALUES
(1, 'blog_img_1.png', 'Admin', '2025-11-20', 'Top 10 Fashion Trends You Need to Try This Winter Season', 5, 1),
(2, 'blog_img_2.png', 'Admin', '2025-11-22', 'How to Style Denim Jackets for Any Occasion Effortlessly', 8, 2),
(3, 'blog_img_3.png', 'Admin', '2025-11-24', 'The Ultimate Guide to Sustainable and Eco-Friendly Wardrobes', 12, 3),
(4, 'blog_img_4.png', 'Admin', '2025-11-25', 'Essential Accessories That Elevate Every Simple Everyday Outfit', 6, 4);

PRINT 'All unique products and categories seeded successfully without any duplicate photos!';
GO

