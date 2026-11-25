CREATE TABLE TrendingProducts4 (
    TrendingProduct4ID INT PRIMARY KEY,
    TrendingimageTP4 NVARCHAR(200) NOT NULL,
    TitleTP4 NVARCHAR(100) NOT NULL,
	CurrentPriceTP4 DECIMAL(10,4) NULL,
    OriginalPriceTP4 DECIMAL(10,4) NOT NULL,
    DiscountShowTP4 NVARCHAR(50) NULL,
    RatingTP4 DECIMAL(4,1) DEFAULT 0,
    ReviewCountTP4 INT DEFAULT 0,
    IsNewTP4 BIT DEFAULT 0,
    ColorOptionsTP4 NVARCHAR(200),
    DisplayOrderTP4 INT
);

select isnull(max(TrendingProduct4ID),0)+1 from TrendingProducts4

select * from TrendingProducts4

DROP TABLE TrendingProducts4;