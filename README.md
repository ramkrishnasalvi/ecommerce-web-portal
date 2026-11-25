# ?? Full-Stack E-Commerce Portal & Admin Management System

A full-fledged, multi-category E-Commerce web application featuring a customer-facing storefront and a merchant administration suite. Built with **ASP.NET (C#)** and **Microsoft SQL Server**.

---

## ?? Key Modules & Features

### ??? 1. Customer Storefront
- **Dynamic Homepage (Index.aspx):**
  - Interactive hero sliders (Sliders table)
  - Promotional banners & bundle offers (Banners, BundleBanner)
  - Multi-level taxonomy: Categories, Sub-categories, and Sub-sub-categories
  - Time-limited deals with countdown timer (CountdownEvents)
  - Curated product sections: **Trending Products**, **Best Sellers**, **Flash Deals**, **New Arrivals**, and **Favorite Picks**
  - Brand partner showcase (Brands) and company blog/news stream (NewsArticles)
- **Product Exploration & Shopping:**
  - Catalog browsing by category (category.aspx) and brand (rand.aspx)
  - Dedicated product details view (Shop-Details.aspx) and store catalog (Shop.aspx)
  - Shopping Cart (cart.aspx) and Wishlist management (wishlist.aspx)
- **Customer Account & Services:**
  - Customer registration & sign-in (sign-up.aspx, sign-in.aspx, orgot-password.aspx)
  - Customer self-service dashboard (dashboard.aspx)
  - Real-time order tracking (	rack-order.aspx)
  - Standard store policy pages: About Us, Contact Us, Privacy Policy, Terms & Conditions, Return Policy

### ?? 2. Merchant Admin Management Suite (/Admin)
- **Admin Authentication:** Secure admin login portal (Loginpage.aspx, Admin-Index.aspx).
- **Visual Merchandising & CMS:**
  - Hero slider configuration (Index-Slider.aspx)
  - Banner campaigns (Index-Banner.aspx)
  - Category hierarchy manager (Index-Category.aspx)
  - Brand partner manager (Index-Brands.aspx)
- **Product & Offer Management:**
  - Trending items showcase (Index-TrendingProduct.aspx)
  - Best-selling products curator (Index-BestSellingProducts.aspx)
  - Flash sale campaign management (Index-FlashSell.aspx)
  - Special product showcases (Index-SpecialProduct.aspx)
  - New arrival merchandise updates (Index-Newarrival.aspx)
  - Countdown sale event scheduler (Index-Countdown.aspx)
  - Master product catalog & pricing control (Product-Shop.aspx)
- **Content Operations:**
  - Articles and blog updates (Index-News-Articles.aspx)
  - Store feature bullet-points (Index-FeaturesList.aspx)

---

## ??? Technology Stack

- **UI / Frontend:** ASP.NET Web Forms, HTML5, CSS3, JavaScript, SVG Handlers, Master Pages (Emaster.master, AdminMasterPage.master)
- **Backend / Logic:** C# (.NET Framework 4.5)
- **Database:** Microsoft SQL Server
- **IDE:** Visual Studio 2012 / 2019 / 2022

---

## ??? Database Setup

1. Open **SQL Server Management Studio (SSMS)** or Visual Studio SQL Server Object Explorer.
2. Create a new database named E-commerce1:
   ``sql
   CREATE DATABASE [E-commerce1];
   GO
   USE [E-commerce1];
   GO
   ``
3. Execute the complete schema and seed script included in this repository:
   - File: **Full_Database_Setup.sql**
   *(This creates all tables: Adminlogin, Categories, SubCategories, Sliders, Banners, Products, Features, TrendingProducts, BestSellers, etc., along with ready-to-use sample data).*
4. Connection string configuration:
   - Target database: (localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;
   - Configured in Web.config and code-behind files.

---

## ?? How to Run the Project

1. Clone this repository:
   ``bash
   git clone https://github.com/<your-username>/aspnet-ecommerce-portal.git
   ``
2. Open **E-commerce.sln** in Visual Studio.
3. Restore / verify the SQL database connection in SQL Server.
4. Set Index.aspx (Customer Store) or Admin/Loginpage.aspx (Admin Portal) as Start Page.
5. Press **F5** or run on **IIS Express**.
6. Default Admin Credentials:
   - **Username:** E-com-admin
   - **Password:** Admin-ecom@12

---

## ?? License
This project is open-source and available under the MIT License.
