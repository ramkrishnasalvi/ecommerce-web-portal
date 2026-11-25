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

-- 9. NewarrivalProducts (4 items: product_29.png, product_30.png, _20251124153107.Png, _20251124153930.Png)
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
