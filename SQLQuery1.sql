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
    VALUES (1, '2_20251124153107.Png', 'Premium Slim Cotton Shirt', '25% Off', 4.8, 999.00, 1399.00, 1);
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
    (2, '2_20251124153107.Png', 'Slim Fit Denim Jeans', 999.00, 1499.00, '33%', 4.6, 12, 1, 2);
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

