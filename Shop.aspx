<%@ Page Title="" Language="C#" MasterPageFile="~/Emaster.master" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--=========================
        PAGE BANNER START
    ==========================-->
    <section class="page_banner" style="background: url(E-com-Img/assets/images/page_banner_bg.jpg);">
        <div class="page_banner_overlay">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="page_banner_text wow fadeInUp">
                            <h1>Shop</h1>
                            <ul>
                                <li><a href="#"><i class="fal fa-home-lg"></i> Home</a></li>
                                <li><a href="#">Shop</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=========================
        PAGE BANNER START
    ==========================-->
    <!--============================
        SHOP PAGE START

    =============================-->
    <section class="shop_page mt_100 mb_100">
        <div class="container">
            <div class="row">
                <div class="col-xxl-2 col-lg-4 col-xl-3">
                    <div id="sticky_sidebar">
                        <div class="shop_filter_btn d-lg-none"> Filter </div>
                        <div class="shop_filter_area">
                            <div class="sidebar_range">
                                <h3>Price Range</h3>
                                <div class="range_slider"></div>   
                            </div>
                            <div class="sidebar_status">
                                <h3>Product Status</h3>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                        On sale
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                                    <label class="form-check-label" for="flexCheckChecked">
                                        In Stock
                                    </label>
                                </div>
                            </div>
                            <div class="sidebar_category">
                                <h3>Categories</h3>
                                <ul>
                                    <li>
                                        <a href="#">
                                            Men’s Fashion
                                            <span>20</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            western wear
                                            <span>09</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            skin care
                                            <span>04</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            sport wear
                                            <span>13</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            fashion jewellery
                                            <span>36</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            beauty Care
                                            <span>22</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            Makeoup Tools
                                            <span>16</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            Winter collention
                                            <span>27</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            Men’s Fashion
                                            <span>20</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            western wear
                                            <span>09</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            skin care
                                            <span>04</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            sport wear
                                            <span>13</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            fashion jewellery
                                            <span>36</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            beauty Care
                                            <span>22</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            Makeoup Tools
                                            <span>16</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            Winter collention
                                            <span>27</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="sidebar_color">
                                <h3>Filter by Color</h3>
                                <ul>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="color_1" style="background-color: #DB4437;">
                                            <label class="form-check-label" for="color_1">
                                                Red
                                            </label>
                                        </div>
                                        <span>03</span>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" checked="" id="color_2" style="background-color: #41CF0F;">
                                            <label class="form-check-label" for="color_2">
                                                green
                                            </label>
                                        </div>
                                        <span>17</span>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="color_3" style="background-color: #8e8e8e;">
                                            <label class="form-check-label" for="color_3">
                                                gray
                                            </label>
                                        </div>
                                        <span>06</span>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" checked="" id="color_4" style="background-color: #ffa500;">
                                            <label class="form-check-label" for="color_4">
                                                Orange
                                            </label>
                                        </div>
                                        <span>09</span>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="color_5" style="background-color: #B615FD;">
                                            <label class="form-check-label" for="color_5">
                                                purple
                                            </label>
                                        </div>
                                        <span>42</span>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="color_6" style="background-color: #FFD747;">
                                            <label class="form-check-label" for="color_6">
                                                Yellow
                                            </label>
                                        </div>
                                        <span>23</span>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="color_7" style="background-color: #AB9774;">
                                            <label class="form-check-label" for="color_7">
                                                Olive
                                            </label>
                                        </div>
                                        <span>06</span>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="color_8" style="background-color: #1C58F2;">
                                            <label class="form-check-label" for="color_8">
                                                Dark Blue
                                            </label>
                                        </div>
                                        <span>25</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="sidebar_rating">
                                <h3>Rating</h3>

                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck4">
                                    <label class="form-check-label" for="defaultCheck4">
                                        <i class="fas fa-star" aria-hidden="true"></i>
                                        5 star
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck5">
                                    <label class="form-check-label" for="defaultCheck5">
                                        <i class="fas fa-star" aria-hidden="true"></i>
                                        4 star or above
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck6">
                                    <label class="form-check-label" for="defaultCheck6">
                                        <i class="fas fa-star" aria-hidden="true"></i>
                                        3 star or above
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck7">
                                    <label class="form-check-label" for="defaultCheck7">
                                        <i class="fas fa-star" aria-hidden="true"></i>
                                        2 star or above
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck8">
                                    <label class="form-check-label" for="defaultCheck8">
                                        <i class="fas fa-star" aria-hidden="true"></i>
                                        1 star or above
                                    </label>
                                </div>
                            </div>
                            <div class="sidebar_related_product">
                                <h3>Top Rated Products</h3>
                                <ul>
                                    <li>
                                        <a href="shop_details.html" class="img">
                                            <img src="E-com-Img/assets/images/product_18.png" alt="Product" class="img-fluid">
                                        </a>
                                        <div class="text">
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(29)</span>
                                            </p>
                                            <a class="title" href="shop_details.html">Kid's Western Party Dress</a>
                                            <p class="price">$59.00</p>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="shop_details.html" class="img">
                                            <img src="E-com-Img/assets/images/product_23.png" alt="Product" class="img-fluid">
                                        </a>
                                        <div class="text">
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(12)</span>
                                            </p>
                                            <a class="title" href="shop_details.html">Kid's dresses for summer</a>
                                            <p class="price">$54.00</p>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="shop_details.html" class="img">
                                            <img src="E-com-Img/assets/images/product_13.png" alt="Product" class="img-fluid">
                                        </a>
                                        <div class="text">
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(09)</span>
                                            </p>
                                            <a class="title" href="shop_details.html">Sharee Petticoat For Women</a>
                                            <p class="price">$28.00</p>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="shop_details.html" class="img">
                                            <img src="E-com-Img/assets/images/product_7.png" alt="Product" class="img-fluid">
                                        </a>
                                        <div class="text">
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(35)</span>
                                            </p>
                                            <a class="title" href="shop_details.html">Denim 2 Quarter Pant</a>
                                            <p class="price">$54.00</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xxl-10 col-lg-8 col-xl-9">
                    <div class="product_page_top">
                        <div class="row">
                            <div class="col-4 col-xl-6 col-md-6">
                                <div class="product_page_top_button">
                                    guy
                                    <p>Showing 1–14 of 26 results</p>
                                </div>
                            </div>
                            <div class="col-8 col-xl-6 col-md-6">
                                <ul class="product_page_sorting">
                                    <li>
                                        <select class="select_js">
                                            <option>Default Sorting</option>
                                            <option>Low to Hight</option>
                                            <option>High to Low</option>
                                            <option>New Added</option>
                                            <option>On Sale</option>
                                        </select>
                                    </li>
                                    <li>
                                        <select class="select_js show">
                                            <option>Show: 12</option>
                                            <option>Show: 16</option>
                                            <option>Show: 20</option>
                                            <option>Show: 24</option>
                                            <option>Show: 26</option>
                                        </select>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                            <div class="row">
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_23.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="new"> new</li>
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
                                            <a class="title" href="shop_details.html"> Kid's dresses for summer</a>
                                            <p class="price">$70.00</p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <span>(44 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_18.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="new"> new</li>
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
                                            <a class="title" href="shop_details.html">Full Sleeve Hoodie Jacket</a>
                                            <p class="price">$88.00 </p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <span>(20 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_7.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="new"> new</li>
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
                                            </ul>
                                        </div>
                                        <div class="product_text">
                                            <a class="title" href="shop_details.html">Denim 2 Quarter Pant</a>
                                            <p class="price">$40.00</p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(20 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                        <div class="out_of_stock">
                                            <p>out of stock</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_9.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="discount"> <b>-</b> 45%</li>
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
                                            <a class="title" href="shop_details.html">Men's Denim combo set</a>
                                            <p class="price">$47.00 <del>$50.00</del></p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <span>(17 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_10.png" alt="Product" class="img-fluid w-100">
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
                                            <a class="title" href="shop_details.html">Women's Western Party Dress</a>
                                            <p class="price">$43.00</p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <span>(22 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_11.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="new"> new</li>
                                                <li class="discount"> <b>-</b> 75%</li>
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
                                            <a class="title" href="shop_details.html">Kid's Western Party Dress</a>
                                            <p class="price">$75.00 <del>$69.00</del></p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(58 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_17.png" alt="Product" class="img-fluid w-100">
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
                                            <a class="title" href="shop_details.html">Denim Jeans Pants For Men</a>
                                            <p class="price">$71.00</p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <span>(20 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_12.png" alt="Product" class="img-fluid w-100">
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
                                            <a class="title" href="shop_details.html">Half Sleeve Tops for Women</a>
                                            <p class="price">$29.00</p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(44 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_13.png" alt="Product" class="img-fluid w-100">
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
                                            <a class="title" href="shop_details.html">Sharee Petticoat For Women</a>
                                            <p class="price">$56.00 </p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <span>(98 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_14.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="discount"> <b>-</b> 49%</li>
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
                                            <a class="title" href="shop_details.html">Jeans Pants For Women</a>
                                            <p class="price">$49.00 <del>$39.00</del></p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(44 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_16.png" alt="Product" class="img-fluid w-100">
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
                                            <a class="title" href="shop_details.html">cherry fabric western tops</a>
                                            <p class="price">$33.00</p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(20 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_15.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="new"> new</li>
                                                <li class="discount"> <b>-</b> 75%</li>
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
                                            <a class="title" href="shop_details.html">Denim Shirt For Men</a>
                                            <p class="price">$40.00 <del>$48.00</del></p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(20 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_18.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="new"> new</li>
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
                                            <a class="title" href="shop_details.html">Full Sleeve Hoodie Jacket</a>
                                            <p class="price">$88.00 </p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <span>(20 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_19.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="new"> new</li>
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
                                            <a class="title" href="shop_details.html">Men's premium formal shirt</a>
                                            <p class="price">$46.00</p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <span>(17 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_20.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="new"> new</li>
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
                                            <a class="title" href="shop_details.html">cherry fabric western tops</a>
                                            <p class="price">$46.00</p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                                <span>(22 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                                <li style="background:#1C58F2"></li>
                                                <li style="background:#ffa500"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-6 col-md-4 col-lg-6 col-xl-4 wow fadeInUp">
                                    <div class="product_item_2 product_item">
                                        <div class="product_img">
                                            <img src="E-com-Img/assets/images/product_4.png" alt="Product" class="img-fluid w-100">
                                            <ul class="discount_list">
                                                <li class="new"> new</li>
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
                                            <a class="title" href="shop_details.html">Comfortable Sports Sneakers</a>
                                            <p class="price">$75.00</p>
                                            <p class="rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <span>(58 reviews)</span>
                                            </p>
                                            <ul class="color">
                                                <li class="active" style="background:#DB4437"></li>
                                                <li style="background:#638C34"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="pagination_area">
                                    <nav aria-label="...">
                                        <ul class="pagination justify-content-start mt_50">
                                            <li class="page-item">
                                                <a class="page-link" href="#">
                                                    <i class="far fa-arrow-left"></i>
                                                </a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link active" href="#">01</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">02</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">03</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">
                                                    <i class="far fa-arrow-right"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        
                    

                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <script>
                                                                                $(document).ready(function () {

                                                                                    // Ye function products ko filter karega
                                                                                    function filterProducts() {
                                                                                        // Tumhare slider ke inputs se values read kar raha hai
                                                                                        var minPrice = parseFloat($('input[name="from"]').val()) || 0;
                                                                                        var maxPrice = parseFloat($('input[name="to"]').val()) || 0;

                                                                                        // Console me check karne ke liye (Development ke time useful hai)
                                                                                        // console.log("Filtering: " + minPrice + " to " + maxPrice);

                                                                                        // Har product check karega
                                                                                        // NOTE: Apne product div par class="product-item" aur data-price="100" zaroor lagana
                                                                                        $('.product-item').each(function () {
                                                                                            var itemPrice = parseFloat($(this).data('price'));

                                                                                            if (itemPrice >= minPrice && itemPrice <= maxPrice) {
                                                                                                $(this).fadeIn(); // Range me hai to dikhao
                                                                                            } else {
                                                                                                $(this).fadeOut(); // Range se bahar hai to chupao
                                                                                            }
                                                                                        });
                                                                                    }

                                                                                    // 1. Jab Input field (From/To) change ho tab filter kare
                                                                                    $('.js-al-range-slider__input').on('change input', function () {
                                                                                        filterProducts();
                                                                                    });

                                                                                    // 2. Extra Safety: Kyunki ye custom slider hai, kabhi kabhi input change event fire nahi karta.
                                                                                    // Isliye slider par mouse chhutne (mouseup) par bhi filter trigger kar rahe hain.
                                                                                    $('.al-range-slider').on('mouseup touchend', function () {
                                                                                        setTimeout(filterProducts, 200); // Thoda delay taaki value update ho jaye
                                                                                    });

                                                                                    // Page load hone par ek baar filter chala do
                                                                                    setTimeout(filterProducts, 500);
                                                                                });
</script>
    </section>
    
    
    
    <!--============================
        SHOP PAGE END
    =============================-->
    <!--=========================
        FOOTER 2 START
    ==========================-->
    <footer class="footer_2 pt_100" style="background: url(E-com-Img/assets/images/footer_2_bg_2.jpg);">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-xl-3 col-md-6 col-lg-3 wow fadeInUp" data-wow-delay=".7s">
                    <div class="footer_2_logo_area">
                        <a class="footer_logo" href="index.html">
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

