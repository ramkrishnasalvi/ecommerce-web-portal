<%@ Page Title="" Language="C#" MasterPageFile="~/Emaster.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .Ename {
            width: auto;
            height: auto;
            text-align: center;
            align-content: center;
            background-color: orange;
            border-radius: 10px;
            color:white;
            padding: 10px 15px;
        }
          .CountdownEndDate {
  display: flex;
  gap: 5px;
}

.count-section {
  background: #ffa500;
  padding: 10px 15px;
  border-radius: 8px;
  text-align: center;
  min-width: 70px;
}

.count-amount {
  font-size: 22px;
  font-weight: bold;
  color: #ffffff;
}

.count-word {
  font-size: 12px;
  text-transform: uppercase;
  color: #ffffff;
}

    </style>
    <!--=========================
        BANNER 2 START
    ==========================-->
    <section class="banner_2">
        <div class="container">
            <div class="row">
                <div class="col-xl-2  d-none d-xxl-block">
                    <ul class="menu_cat_item">
                        <asp:ListView ID="lstmain" runat="server">
                            <ItemTemplate>
                                <li>
                            <a href="shop.aspx">
                                <span>
                                    <img src="Admin/img/category/<%# Eval("IconPath") %>" />
                                </span>
                                <%# Eval("CategoryName") %>
                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("CategoryID") %>' Visible="false"></asp:Label>
                            </a>
                            <ul class="menu_cat_droapdown">
                                <asp:ListView ID="lstsub" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("SubCategoryID") %>' Visible="false"></asp:Label>
                                        <li><a href="shop.aspx"><%# Eval("SubCategoryName") %><i class="fal fa-angle-right"></i></a>
                                            <ul class="sub_category">
                                                <asp:ListView ID="lstmini" runat="server">
                                                    <ItemTemplate>
                                                        <li><a href="Shop.aspx"><%# Eval("SubSubCategoryName") %></a></li>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </ul>
                                        </li>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ul>
                        </li>
                            </ItemTemplate>
                        </asp:ListView>
                        <li class="all_category">
                            <a href="category.aspx">View All Categories <i class="far fa-arrow-right"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-xxl-7 col-lg-8">
                    <div class="banner_content">
                        <div class="row banner_2_slider">
                            <asp:ListView ID="SliderListView" runat="server">
                                <ItemTemplate>
                                    <div class="col-xl-12">
                                        <div class="banner_slider_2 wow fadeInUp" style="background: url('Admin/img/Slider/<%# Eval("Sliderimage") %>');">
                                            <div class="banner_slider_2_text">
                                                <h3><%# Eval("Heading1") %></h3>
                                                <h1><%# Eval("Heading2") %></h1>
                                                <a class="common_btn" href='<%# Eval("LinkUrl") %>'>shop now <i class="fas fa-long-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </LayoutTemplate>
                            </asp:ListView>  
                        </div>
                    </div>
                </div>
                <div class="col-xxl-3 col-lg-4 col-sm-12 col-md-12">
                    <div class="row">
                        <asp:ListView ID="BannerListView" runat="server">
                                <ItemTemplate>
                                    <div class="col-xl-12">
                                        <div class="banner_2_add wow fadeInUp" style="background: url('Admin/img/Banner/<%# Eval("Bannerimage") %>');">
                                            <div class="text">
                                                <h4><%# Eval("Head1") %></h4>
                                                <h2><%# Eval("Head2") %></h2>
                                                <a class="common_btn" href='<%# Eval("LinkUrl2") %>'>shop now <i class="fas fa-long-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </LayoutTemplate>
                            </asp:ListView>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=========================
        BANNER 2 END
    ==========================-->
    <!--============================
        FEATURES START
    ==============================-->
    <section class="features mt_20">
        <div class="container">
            <div class="row">
                <asp:ListView ID="FeaturesListView" runat="server">
                    <ItemTemplate>
                        <div class="col-xl-3 col-md-6 wow fadeInUp">
                            <div class='features_item <%# Eval("ColorClass") %>'>
                                <div class="icon">
                                    <img src='Admin/<%# Eval("IconPath1") %>' alt="feature">
                                </div>
                                <div class="text">
                                    <h3><%# Eval("Title") %></h3>
                                    <p><%# Eval("Description") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>
    <!--============================
        FEATURES END
    ==============================-->
    <!--============================
        FLASH SELL 2 START
    ==============================-->
    <section class="flash_sell_2 flash_sell mt_95">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xxl-6 col-md-3 col-xl-4">
                    <div class="section_heading_2 section_heading">
                        <h3><span>Flash</span> Sell</h3>
                    </div>
                </div>
                <div class="col-xxl-6 col-md-9 col-xl-8">
                    <div class="d-flex flex-wrap justify-content-end">
                        <asp:ListView ID="CountdwonListView" runat="server">
                    <ItemTemplate>
                        <div style="display: flex; gap: 5px;">
                        <h4 class="Ename"><b><%# Eval("EventName") %></b></h4>
                        <div class="CountdownEndDate" data-end-date='<%# Eval("CountdownEndDate", "{0:yyyy-MM-dd HH:mm:ss}") %>'></div>
                            </div>
                        </ItemTemplate>
                            </asp:ListView>
                        <div class="view_all_btn_area" style="margin-left:50px;">
                            <a class="view_all_btn" href="flash_deals.aspx">View all</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt_25 flash_sell_2_slider">
                <asp:ListView ID="FlashSellListView" runat="server">
                    <ItemTemplate>
                <div class="col-xl-1-5 wow fadeInUp">
                    <div class="product_item_2 product_item">
                        <div class="product_img">
                            <img src='Admin/img/products/<%# Eval("ProductImage") %>' alt="Product" class="img-fluid w-100">
                            <ul class="discount_list">
                                <%# FormatDiscount(Eval("DiscountPercentage")) %>
                                <%# FormatIsNew(Eval("IsNew")) %>
                            </ul>
                            <ul class="btn_list">
                                <li>
                                    <a href="#">
                                        <img src="E-com-Img/assets/images/compare_icon_white.svg" alt="Compare" class="img-fluid">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="E-com-Img/assets/images/love_icon_white.svg" alt="Love" class="img-fluid">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="E-com-Img/assets/images/cart_icon_white.svg" alt="Love" class="img-fluid">
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="product_text">
                            <a class="title" href="shop_details.aspx?productId=<%# Eval("FlashSellID") %>"><%# Eval("Title") %></a>
                            <p class="price">$<%# Eval("DiscountedPrice") %> <%# FormatOldPrice(Eval("OriginalPrice"), Eval("DiscountedPrice")) %></p>
                            <p class="rating">
                                <%# SafeStarRating(Eval("Rating")) %>
                                    <span>(<%# Eval("ReviewCount") %> reviews)</span>
                            </p>
                        </div>
                    </div>
                </div>
                </ItemTemplate>
                </asp:ListView>
                
            </div>
        </div>
    </section>
   <script>
       document.addEventListener('DOMContentLoaded', function () {
           var countdowns = document.querySelectorAll('.CountdownEndDate');

           countdowns.forEach(function (countdown) {
               var endDate = new Date(countdown.getAttribute('data-end-date'));

               simplyCountdown(countdown, {
                   year: endDate.getFullYear(),
                   month: endDate.getMonth() + 1,
                   day: endDate.getDate(),
                   hours: endDate.getHours(),
                   minutes: endDate.getMinutes(),
                   seconds: endDate.getSeconds(),
                   enableUtc: true,
                   refresh: 1000,
                   inline: false, // ❌ string ki jagah structured HTML chahiye
                   sectionClass: 'count-section',
                   amountClass: 'count-amount',
                   wordClass: 'count-word',
                   zeroPad: true
               });
           });
       }, { passive: true });
</script>

    <!--============================
        FLASH SELL 2 END
    ==============================-->
    <!--============================
        CATEGORY 2 START
    ==============================-->
    <section class="category category_2 mt_55">
        <div class="container">
            <div class="row category_2_slider">
                <asp:ListView ID="CategoriesListView" runat="server">
                    <ItemTemplate>
                <div class="col-2 wow fadeInUp">
                    <a href="shop.aspx" class="category_item">
                        <div class="img">
                            <img src='Admin/img/categorySlider/<%# Eval("CateIconPath") %>' alt="Category" class="img-fluid w-100">
                        </div>
                        <h3><%# Eval("Title") %></h3>
                    </a>
                </div>
                     </ItemTemplate>
                </asp:ListView>
                
            </div>
        </div>
    </section>
    <!--============================
        CATEGORY 2 END
    ==============================-->
    <!--============================
        SPECIAL PRODUCT 2 START
    ==============================-->
    <section class="special_product_2 pt_85">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-sm-9">
                    <div class="section_heading_2 section_heading">
                        <h3>Our <span>Spatial</span> Brand Products</h3>
                    </div>
                </div>
                <div class="col-xl-6 col-sm-3">
                    <div class="view_all_btn_area">
                        <a class="view_all_btn" href="shop.aspx">View all</a>
                    </div>
                </div>
            </div>

            <div class="row pt_15">
                <asp:ListView ID="SpecialListView" runat="server">
                    <ItemTemplate>
                <div class="col-xl-4  wow fadeInLeft">
                    <div class="special_product_banner">
                        <img src='Admin/img/SpecialSlider/<%# Eval("Specialimage") %>' alt="special product" class="img-fluid w-100">
                        <div class="text">
                            <h3><%# Eval("TitleOS") %></h3>
                            <p><%# Eval("DiscountOS") %></p>
                            <a class="common_btn" href='<%# Eval("LinkUrlOS") %>'>shop now <i class="fas fa-long-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
                        </ItemTemplate>
                </asp:ListView>
                <div class="col-xl-8">
                    <div class="row">
                        <asp:ListView ID="SpecialProductsListView" runat="server">
                            <ItemTemplate>
                        <div class="col-md-6 wow fadeInUp">
                            <div class="special_product_item">
                                <div class="special_product_img">
                                    <img src='Admin/img/products/<%# Eval("SpecialimageSP") %>' alt="product" class="img-fluid w-100">
                                    <span class="discount">Save$<%# Eval("DiscountText") %></span>
                                </div>
                                <div class="special_product_text">
                                    <a class="title" href='shop-details.aspx?id=<%# Eval("SpecialProductID") %>'><%# Eval("TitleSP") %></a>
                                    <span><%# SafeStarRating(Eval("RatingSP")) %></span>
                                    <p>$<%# Eval("CurrentPrice") %> 
                                        <%# Eval("OriginalPriceSP") != DBNull.Value ?"<del>$" + Eval("OriginalPriceSP", "{0:F2}") + "</del>" : "" %>
                                    </p>
                                </div>
                            </div>
                        </div>
                                </ItemTemplate>
                            </asp:ListView>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--============================
        SPECIAL PRODUCT 2 END
    ==============================-->
    <!--============================
        TRENDING PRODUCT 2 START
    ==============================-->
    <section class="trending_product_2 mt_90">
        <div class="container">
            <div class="row">
                <div class="col-xl-6">
                    <div class="section_heading_2 section_heading mb_15">
                        <h3><span>Trending</span> Products</h3>
                    </div>
                </div>
            </div>
            <div class="row wow fadeInUp">
                <div class="col-12">
                    <div class="product_tabs">
                        <div data-pws-tab="tab111" data-pws-tab-name="western">
                            <div class="row">
                                <asp:ListView ID="TrendingProductsListView" runat="server">
                                    <ItemTemplate>
                                        <div class="col-xl-1-5 col-6 col-md-4 col-xl-3">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src='Admin/img/products/<%# Eval("TrendingimageTP") %>' alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <%# FormatIsNew(Eval("IsNewTP")) %>
                                                <%# FormatDiscount(Eval("DiscountShowTP")) %>
                                            </ul>
                                            <ul class="btn_list">
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/compare_icon_white.svg" alt="Compare" class="img-fluid">
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/love_icon_white.svg" alt="Love" class="img-fluid">
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/cart_icon_white.svg" alt="Love" class="img-fluid">
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="product_text">
                                            <a class="title" href='shop_details.aspx?id=<%# Eval("TrendingProductID") %>'><%# Eval("TitleTP") %></a>
                                            <p class="price">$<%# Eval("CurrentPriceTP") %> <%# FormatOldPrice(Eval("OriginalPriceTP"), Eval("CurrentPriceTP")) %></p>
                                            <p class="rating"><%# SafeStarRating(Eval("RatingTP")) %>
                                                <span>(<%# Eval("ReviewCountTP") %> reviews)</span>
                                            </p>
                                            
                                        </div>
                                    </div>
                                </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <div data-pws-tab="tab222" data-pws-tab-name="tops">
                            <div class="row">
                                <asp:ListView ID="TrendingProductsListView2" runat="server">
                                    <ItemTemplate>
                                        <div class="col-xl-1-5 col-6 col-md-4 col-xl-3">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src='Admin/img/products/<%# Eval("TrendingimageTP2") %>' alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <%# FormatIsNew(Eval("IsNewTP2")) %>
                                                <%# FormatDiscount(Eval("DiscountShowTP2")) %>
                                            </ul>
                                            <ul class="btn_list">
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/compare_icon_white.svg" alt="Compare" class="img-fluid">
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/love_icon_white.svg" alt="Love" class="img-fluid">
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/cart_icon_white.svg" alt="Love" class="img-fluid">
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="product_text">
                                            <a class="title" href='shop_details.aspx?id=<%# Eval("TrendingProduct2ID") %>'><%# Eval("TitleTP2") %></a>
                                            <p class="price">$<%# Eval("CurrentPriceTP2") %> <%# FormatOldPrice(Eval("OriginalPriceTP2"), Eval("CurrentPriceTP2")) %></p>
                                            <p class="rating"><%# SafeStarRating(Eval("RatingTP2")) %>
                                                <span>(<%# Eval("ReviewCountTP2") %> reviews)</span>
                                            </p>
                                            
                                        </div>
                                    </div>
                                </div>   
                                    </ItemTemplate>
                                </asp:ListView>                   
                            </div>
                        </div>
                        <div data-pws-tab="tab333" data-pws-tab-name="bags">
                            <div class="row">
                                <asp:ListView ID="TrendingProductsListView3" runat="server">
                                    <ItemTemplate>
                                        <div class="col-xl-1-5 col-6 col-md-4 col-xl-3">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src='Admin/img/products/<%# Eval("TrendingimageTP3") %>' alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <%# FormatIsNew(Eval("IsNewTP3")) %>
                                                <%# FormatDiscount(Eval("DiscountShowTP3")) %>
                                            </ul>
                                            <ul class="btn_list">
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/compare_icon_white.svg" alt="Compare" class="img-fluid">
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/love_icon_white.svg" alt="Love" class="img-fluid">
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/cart_icon_white.svg" alt="Love" class="img-fluid">
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="product_text">
                                            <a class="title" href='shop_details.aspx?id=<%# Eval("TrendingProduct3ID") %>'><%# Eval("TitleTP3") %></a>
                                            <p class="price">$<%# Eval("CurrentPriceTP3") %> <%# FormatOldPrice(Eval("OriginalPriceTP3"), Eval("CurrentPriceTP3")) %></p>
                                            <p class="rating">
                                                <%# SafeStarRating(Eval("RatingTP3")) %>
                                                <span>(<%# Eval("ReviewCountTP3") %> reviews)</span>
                                            </p>
                                            
                                        </div>
                                    </div>
                                </div>
                                    </ItemTemplate>
                                </asp:ListView> 
                            </div>
                        </div>
                        <div data-pws-tab="tab444" data-pws-tab-name="shoes">
                            <div class="row">
                                <asp:ListView ID="TrendingProductsListView4" runat="server">
                                    <ItemTemplate>
                                        <div class="col-xl-1-5 col-6 col-md-4 col-xl-3">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src='Admin/img/products/<%# Eval("TrendingimageTP4") %>' alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <%# FormatIsNew(Eval("IsNewTP4")) %>
                                                <%# FormatDiscount(Eval("DiscountShowTP4")) %>
                                            </ul>
                                            <ul class="btn_list">
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/compare_icon_white.svg" alt="Compare" class="img-fluid">
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/love_icon_white.svg" alt="Love" class="img-fluid">
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img src="E-com-Img/assets/images/cart_icon_white.svg" alt="Love" class="img-fluid">
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="product_text">
                                            <a class="title" href='shop_details.aspx?id=<%# Eval("TrendingProduct4ID") %>'><%# Eval("TitleTP4") %></a>
                                            <p class="price">$<%# Eval("CurrentPriceTP4") %> <%# FormatOldPrice(Eval("OriginalPriceTP4"), Eval("CurrentPriceTP4")) %></p>
                                            <p class="rating">
                                                <%# SafeStarRating(Eval("RatingTP4")) %>
                                                <span>(<%# Eval("ReviewCountTP4") %> reviews)</span>
                                            </p>
                                            
                                        </div>
                                    </div>
                                </div>
                                    </ItemTemplate>
                                </asp:ListView>   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--============================
        TRENDING PRODUCT 2 END
    ==============================-->
    <!--================================
        BEST SELLING PRODUCT 2 START
    ==================================-->
    <section class="best_selling_product_2 mt_95">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-sm-9">
                    <div class="section_heading_2 section_heading">
                        <h3>Our <span>Best</span> Selling Products</h3>
                    </div>
                </div>
                <div class="col-xl-6 col-sm-3">
                    <div class="view_all_btn_area">
                        <a class="view_all_btn" href="shop.aspx">View all</a>
                    </div>
                </div>
            </div>
            <div class="row mt_15">
                <div class="col-xl-7">
                    <div class="row">
                        <asp:ListView ID="BestSellingProductListView" runat="server">
                            <ItemTemplate>
                                <div class="col-xl-4 col-sm-6 col-md-4 wow fadeInUp">
                            <div class="best_selling_product_item">
                                <img src='Admin/img/BSELLP/<%# Eval("BestSellingimage") %>' alt="best sell" class="img-fluid w-100">
                                <div class="text">
                                    <a class="title" href='shop-details.aspx?id=<%# Eval("BestSellingProductID") %>'><%# Eval("TitleBS") %></a>
                                    <p class="price">$<%# Eval("CurrentPriceBS") %><del>$<%# Eval("OriginalPriceBS") %></del></p>
                                    <a class="buy_btn" href='<%# Eval("LinkUrlBS") %>'>buy now <i class="far fa-arrow-up"></i></a>
                                </div>
                            </div>
                        </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
                <asp:ListView ID="BestSellingProductListView1" runat="server">
                    <ItemTemplate>
                        <div class="col-xl-5 wow fadeInRight">
                    <div class="best_selling_product_item_large">
                        <img src='Admin/img/BSELLP/<%# Eval("BestSellingimage2") %>' alt="best sell" class="img-fluid w-100">
                        <div class="text">
                            <a class="title" href='shop_details.aspx?id=<%# Eval("BestSellingProduct2ID") %>'><%# Eval("TitleBS2") %></a>
                            <p class="price">$<%# Eval("CurrentPriceBS2") %><del>$<%# Eval("OriginalPriceBS2") %></del></p>
                            <a class="common_btn" href='<%# Eval("LinkUrlBS2") %>'>buy now <i class="fas fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>
    <!--================================
        BEST SELLING PRODUCT 2 END
    ==================================-->
    <!--================================
        NEW ARRIVAL 2 START
    ==================================-->
    <section class="new_arrival_2 mt_95">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-sm-9">
                    <div class="section_heading_2 section_heading">
                        <h3>Our <span>New</span> arrival Products</h3>
                    </div>
                </div>
                <div class="col-xl-6 col-sm-3">
                    <div class="view_all_btn_area">
                        <a class="view_all_btn" href="shop.aspx">View all</a>
                    </div>
                </div>
            </div>
            <div class="row mt_15">
                <asp:ListView ID="NewArrivalListView" runat="server">
                    <ItemTemplate>
                        <div class="col-xl-1-5 col-6 col-md-4 col-xl-3 wow fadeInUp">
                    <div class="product_item_2 product_item">
                        <div class="product_img">
                            <img src='Admin/img/products/<%# Eval("ArrivalImage") %>' alt="Product" class="img-fluid w-100">
                            <ul class="discount_list">
                                <%# FormatIsNew(Eval("IsNewNA")) %>
                            </ul>
                            <ul class="btn_list">
                                <li>
                                    <a href="#">
                                        <img src="E-com-Img/assets/images/compare_icon_white.svg" alt="Compare" class="img-fluid">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="E-com-Img/assets/images/love_icon_white.svg" alt="Love" class="img-fluid">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="E-com-Img/assets/images/cart_icon_white.svg" alt="Love" class="img-fluid">
                                    </a>
                                </li> 
                            </ul>
                        </div>
                        <div class="product_text">
                            <a class="title" href="shop_details.aspx"><%# Eval("TitleNA") %></a>
                            <p class="price">$<%# Eval("OriginalPriceNA") %></p>
                            <p class="rating">
                                <%# SafeStarRating(Eval("RatingNA")) %>
                                    <span>(<%# Eval("ReviewCountNA") %> reviews)</span>
                            </p>
                            
                        </div>
                    </div>
                </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>
    <!--================================
        NEW ARRIVAL 2 END
    ==================================-->
    <!--============================
        FAVOURITE PRODUCT 2 START
    ==============================-->
    <section class="favourite_product_2 mt_100">
        <div class="container">
            <div class="row">
                <asp:ListView ID="bundleBannerListView" runat="server">
                    <ItemTemplate>
                        <div class="col-xl-3 col-lg-4 wow fadeInLeft">
                    <div class="bundle_product_banner">
                        <img src='Admin/img/SpecialSlider/<%# Eval("BannerImageB") %>' alt="bundle" class="img-fluid">
                        <div class="text">
                            <h4><%# Eval("TitleB") %><span><%# Eval("DiscountTextB") %></span></h4>
                            <p><%# Eval("OfferTextB") %></p>
                            <a class="common_btn" href="shop_details.aspx">shop now <i class="fas fa-long-arrow-right" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
                    </ItemTemplate>
                </asp:ListView>
                <div class="col-xl-9 col-lg-8">
                    <div class="row">
                        <div class="col-xl-8">
                            <div class="section_heading_2 section_heading">
                                <h3>Our <span>Favorite</span> Style Product</h3>
                            </div>
                        </div>
                        <div class="row mt_40 favourite_product_2_slider">
                            <asp:ListView ID="FavoriteListView" runat="server">
                                <ItemTemplate>
                                    <div class="col-xl-3 wow fadeInUp">
                                <div class="product_item_2 product_item">
                                    <div class="product_img">
                                        <img src='Admin/img/products/<%# Eval("FavoriteImage") %>' alt="Product" class="img-fluid w-100">
                                        <ul class="discount_list">
                                            <%# FormatIsNew(Eval("IsNewF")) %>
                                            <%# FormatDiscount(Eval("DiscountShowF")) %>
                                        </ul>
                                        <ul class="btn_list">
                                            <li>
                                                <a href="#">
                                                    <img src="E-com-Img/assets/images/compare_icon_white.svg" alt="Compare" class="img-fluid">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <img src="E-com-Img/assets/images/love_icon_white.svg" alt="Love" class="img-fluid">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <img src="E-com-Img/assets/images/cart_icon_white.svg" alt="Love" class="img-fluid">
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="product_text">
                                        <a class="title" href='shop_details.aspx?id=<%# Eval("FavoriteID") %>'><%# Eval("TitleF") %></a>
                                        <p class="price">$<%# Eval("CurrentPriceF") %> <%# FormatOldPrice(Eval("OriginalPriceF"), Eval("CurrentPriceF")) %></p>
                                        <p class="rating">
                                            <%# SafeStarRating(Eval("RatingF")) %>
                                            <span><%# Eval("ReviewCountF") %> reviews</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--============================
        FAVOURITE PRODUCT 2 END
    ==============================-->
    <!--=========================
        BRAND 2 START
    ==========================-->
    <section class="brand_2 mt_85">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-sm-9">
                    <div class="section_heading_2 section_heading">
                        <h3>Our Top <span>Brands</span></h3>
                    </div>
                </div>
                <div class="col-xl-6 col-sm-3">
                    <div class="view_all_btn_area">
                        <a class="view_all_btn" href="brand.aspx">View all</a>
                    </div>
                </div>
            </div>
            <div class="row mt_40">
                <div class="col-12">
                    <ul>
                        <asp:ListView ID="BrandsListView" runat="server">
                            <ItemTemplate>
                                <li class="wow fadeInUp">
                            <a href="shop.aspx">
                                <img src='Admin/img/Brands/<%# Eval("Brandimage") %>' alt="Brand" class="img-fluid">
                            </a>
                        </li>
                            </ItemTemplate>
                        </asp:ListView> 
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!--=========================
        BRAND 2 END
    ==========================-->
    <!--=========================
        BLOG 2 START
    ==========================-->
    <section class="blog_2 pt_95" style="padding-bottom: 80px;">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-sm-9">
                    <div class="section_heading_2 section_heading">
                        <h3>Our <span>News</span> & Articles</h3>
                    </div>
                </div>
                <div class="col-xl-6 col-sm-3">
                    <div class="view_all_btn_area">
                        <a class="view_all_btn" href="blog_classic.aspx">View all</a>
                    </div>
                </div>
            </div>
            <div class="row mt_15">
                <asp:ListView ID="NewsArticlesListView" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-xxl-3 col-md-6 wow fadeInUp">
                    <div class="blog_item">
                        <a href="blog_details.aspx" class="blog_img">
                            <img src='Admin/img/Blog/<%# Eval("BlogImage") %>' alt="blog" class="img-fluid w-100">
                        </a>
                        <div class="blog_text">
                            <ul class="top">
                                <li>
                                    <span>
                                        <img src="E-com-Img/assets/images/user_icon_black.svg" alt="user" class="img-fluid w-100">
                                    </span>
                                    <%# Eval("AuthorName") %>
                                </li>
                                <li>
                                    <span>
                                        <img src="E-com-Img/assets/images/calender.png" alt="Message" class="img-fluid w-100">
                                    </span>
                                    <%# Convert.ToDateTime(Eval("PublishDate")).ToString("dd MMM yyyy") %>
                                </li>
                            </ul>
                            <a class="title" href="blog_details.aspx"><%# Eval("Title") %></a>
                            <ul class="bottom">
                                <li><a href="blog_details.aspx">read more <i class="fas fa-long-arrow-right"></i></a>
                                <li><span><i class="far fa-comment-dots"></i><%# Eval("CommentsCount") %>Comments</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                    </ItemTemplate>
                </asp:ListView>
                
            </div>
        </div>
    </section>
    <!--=========================
        BLOG 2 END
    ==========================-->
    <!--=========================
        FOOTER 2 START
    ==========================-->
    <footer class="footer_2 pt_100" style="background: url(E-com-Img/assets/images/footer_2_bg_2.jpg);">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-xl-3 col-md-6 col-lg-3 wow fadeInUp" data-wow-delay=".7s">
                    <div class="footer_2_logo_area">
                        <a class="footer_logo" href="index.aspx">
                            <img src="E-com-Img/assets/images/footer_logo_2.png" alt="Zenis" class="img-fluid w-100">
                        </a>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi, distinctio molestiae error
                            ullam obcaecati dolorem inventore.</p>
                        <ul>
                            <li><span>Follow :</span></li>
                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                            <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-sm-6 col-md-4 col-lg-2 wow fadeInUp" data-wow-delay="1s">
                    <div class="footer_link">
                        <h3>Company</h3>
                        <ul>
                            <li><a href="#about">About us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Affiliate</a></li>
                            <li><a href="#">Career</a></li>
                            <li><a href="#">Latest News</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-sm-6 col-md-4 col-lg-2 wow fadeInUp" data-wow-delay="1.3s">
                    <div class="footer_link">
                        <h3>Category</h3>
                        <ul>
                            <li><a href="#">Men’s Fashion</a></li>
                            <li><a href="#">denim Collection</a></li>
                            <li><a href="#">western wear</a></li>
                            <li><a href="#">sport wear</a></li>
                            <li><a href="#">fashion jewellery</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-sm-6 col-md-4 col-lg-2 wow fadeInUp" data-wow-delay="1.6s">
                    <div class="footer_link">
                        <h3>Quick Links</h3>
                        <ul>
                            <li><a href="#">Privacy Ploicy</a></li>
                            <li><a href="#">Terms and Condition</a></li>
                            <li><a href="#">Return Policy</a></li>
                            <li><a href="#">FAQ's</a></li>
                            <li><a href="#">Become a Vendor</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-md-4 col-lg-3 wow fadeInUp" data-wow-delay="1.9s">
                    <div class="footer_link footer_logo_area">
                        <h3>Contact Us</h3>
                        <p>It is a long established fact that reader distracted looking layout It is a long established
                            fact.</p>
                        <span>
                            <b><img src="E-com-Img/assets/images/location_icon_white.png" alt="Map" class="img-fluid"></b>
                            37 W 24th St, New York, NY</span>
                        <span>
                            <b><img src="E-com-Img/assets/images/phone_icon_white.png" alt="Call" class="img-fluid"></b>
                            <a href="callto:+123324587939">+123 324 5879 39</a>
                        </span>
                        <span>
                            <b><img src="E-com-Img/assets/images/mail_icon_white.png" alt="Mail" class="img-fluid"></b>
                            <a href="mailto:support@mail.com">info@Zenis.com</a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="footer_copyright mt_75">
                        <p>Copyright @ <b>Zenis</b> 2025. All right reserved.</p>
                        <ul class="payment">
                            <li>Payment by :</li>
                            <li>
                                <img src="E-com-Img/assets/images/footer_payment_icon_1.jpg" alt="payment" class="img-fluid w-100">
                            </li>
                            <li>
                                <img src="E-com-Img/assets/images/footer_payment_icon_2.jpg" alt="payment" class="img-fluid w-100">
                            </li>
                            <li>
                                <img src="E-com-Img/assets/images/footer_payment_icon_3.jpg" alt="payment" class="img-fluid w-100">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--=========================
        FOOTER 2 END
    ==========================-->

</asp:Content>

