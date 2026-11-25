<%@ Page Title="" Language="C#" MasterPageFile="~/Emaster.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="_Default" %>

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
                            <h1>Cart View</h1>
                            <ul>
                                <li><a href="#"><i class="fal fa-home-lg"></i> Home</a></li>
                                <li><a href="#">Cart View</a></li>
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
        CART PAGE START
    =============================-->
    <section class="cart_page mt_100 mb_100">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 wow fadeInUp">
                    <div class="cart_table_area">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="cart_page_checkbox">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                            </div>
                                        </th>
                                        <th class="cart_page_img">Product image </th>
                                        <th class="cart_page_details">Product Details</th>
                                        <th class="cart_page_price">Unit Price</th>
                                        <th class="cart_page_quantity">Quantity</th>
                                        <th class="cart_page_total">Subtotal</th>
                                        <th class="cart_page_action">action</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <td>
                                        <h4 class="cart_vendor_name">
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 0 1 .75-.75h3a.75.75 0 0 1 .75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349M3.75 21V9.349m0 0a3.001 3.001 0 0 0 3.75-.615A2.993 2.993 0 0 0 9.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 0 0 2.25 1.016c.896 0 1.7-.393 2.25-1.015a3.001 3.001 0 0 0 3.75.614m-16.5 0a3.004 3.004 0 0 1-.621-4.72l1.189-1.19A1.5 1.5 0 0 1 5.378 3h13.243a1.5 1.5 0 0 1 1.06.44l1.19 1.189a3 3 0 0 1-.621 4.72M6.75 18h3.75a.75.75 0 0 0 .75-.75V13.5a.75.75 0 0 0-.75-.75H6.75a.75.75 0 0 0-.75.75v3.75c0 .414.336.75.75.75Z"></path>
                                            </svg>
                                            Zapier Gallery
                                        </h4>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td class="cart_page_checkbox">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
                                            </div>
                                        </td>
                                        <td class="cart_page_img">
                                            <div class="img">
                                                <img src="E-com-Img/assets/images/product_18.png" alt="Products" class="img-fluid w-100">
                                            </div>
                                        </td>
                                        <td class="cart_page_details">
                                            <a class="title" href="shop_details.html">Full Sleeve Hoodie Jacket</a>
                                            <p>$59.00 <del>$65.00</del></p>
                                            <span><b>Color:</b> Orange</span>
                                            <span><b>Size:</b> M (Medium)</span>
                                        </td>
                                        <td class="cart_page_price">
                                            <h3>$59.00</h3>
                                        </td>
                                        <td class="cart_page_quantity">
                                            <div class="details_qty_input">
                                                <button class="minus"><i class="fal fa-minus" aria-hidden="true"></i></button>
                                                <input type="text" placeholder="01">
                                                <button class="plus"><i class="fal fa-plus" aria-hidden="true"></i></button>
                                            </div>
                                        </td>
                                        <td class="cart_page_total">
                                            <h3>$59.00</h3>
                                        </td>
                                        <td class="cart_page_action">
                                            <a href="#"> <i class="fal fa-times"></i> Remove</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="cart_page_checkbox">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault6">
                                            </div>
                                        </td>
                                        <td class="cart_page_img">
                                            <div class="img">
                                                <img src="E-com-Img/assets/images/product_7.png" alt="Products" class="img-fluid w-100">
                                            </div>
                                        </td>
                                        <td class="cart_page_details">
                                            <a class="title" href="shop_details.html">Denim 2 Quarter Pant</a>
                                            <p>$36.00</p>
                                            <span><b>Color:</b> Black</span>
                                            <span><b>Size:</b> L (Large)</span>
                                        </td>
                                        <td class="cart_page_price">
                                            <h3>$36.00</h3>
                                        </td>
                                        <td class="cart_page_quantity">
                                            <div class="details_qty_input">
                                                <button class="minus"><i class="fal fa-minus" aria-hidden="true"></i></button>
                                                <input type="text" placeholder="01">
                                                <button class="plus"><i class="fal fa-plus" aria-hidden="true"></i></button>
                                            </div>
                                        </td>
                                        <td class="cart_page_total">
                                            <h3>$36.00</h3>
                                        </td>
                                        <td class="cart_page_action">
                                            <a href="#"> <i class="fal fa-times"></i> Remove</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <td>
                                        <h4 class="cart_vendor_name">
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 0 1 .75-.75h3a.75.75 0 0 1 .75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349M3.75 21V9.349m0 0a3.001 3.001 0 0 0 3.75-.615A2.993 2.993 0 0 0 9.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 0 0 2.25 1.016c.896 0 1.7-.393 2.25-1.015a3.001 3.001 0 0 0 3.75.614m-16.5 0a3.004 3.004 0 0 1-.621-4.72l1.189-1.19A1.5 1.5 0 0 1 5.378 3h13.243a1.5 1.5 0 0 1 1.06.44l1.19 1.189a3 3 0 0 1-.621 4.72M6.75 18h3.75a.75.75 0 0 0 .75-.75V13.5a.75.75 0 0 0-.75-.75H6.75a.75.75 0 0 0-.75.75v3.75c0 .414.336.75.75.75Z"></path>
                                            </svg>
                                            Comfort Gallery
                                        </h4>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td class="cart_page_checkbox">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault03">
                                            </div>
                                        </td>
                                        <td class="cart_page_img">
                                            <div class="img">
                                                <img src="E-com-Img/assets/images/product_16.png" alt="Products" class="img-fluid w-100">
                                            </div>
                                        </td>
                                        <td class="cart_page_details">
                                            <a class="title" href="shop_details.html">cherry fabric western tops</a>
                                            <p>$75.00</p>
                                            <span><b>Color:</b> Blue</span>
                                            <span><b>Size:</b> XL (Extra Large)</span>
                                        </td>
                                        <td class="cart_page_price">
                                            <h3>$72.00</h3>
                                        </td>
                                        <td class="cart_page_quantity">
                                            <div class="details_qty_input">
                                                <button class="minus"><i class="fal fa-minus" aria-hidden="true"></i></button>
                                                <input type="text" placeholder="01">
                                                <button class="plus"><i class="fal fa-plus" aria-hidden="true"></i></button>
                                            </div>
                                        </td>
                                        <td class="cart_page_total">
                                            <h3>$72.00</h3>
                                        </td>
                                        <td class="cart_page_action">
                                            <a href="#"> <i class="fal fa-times"></i> Remove</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="cart_page_checkbox">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault4">
                                            </div>
                                        </td>
                                        <td class="cart_page_img">
                                            <div class="img">
                                                <img src="E-com-Img/assets/images/product_4.png" alt="Products" class="img-fluid w-100">
                                            </div>
                                        </td>
                                        <td class="cart_page_details">
                                            <a class="title" href="shop_details.html">Comfortable Sports Sneakers</a>
                                            <p>$66.00 <del>$70.00</del></p>
                                            <span><b>Color:</b> Blue</span>
                                            <span><b>Size:</b> 40" (Large)</span>
                                        </td>
                                        <td class="cart_page_price">
                                            <h3>$66.00</h3>
                                        </td>
                                        <td class="cart_page_quantity">
                                            <div class="details_qty_input">
                                                <button class="minus"><i class="fal fa-minus" aria-hidden="true"></i></button>
                                                <input type="text" placeholder="01">
                                                <button class="plus"><i class="fal fa-plus" aria-hidden="true"></i></button>
                                            </div>
                                        </td>
                                        <td class="cart_page_total">
                                            <h3>$66.00</h3>
                                        </td>
                                        <td class="cart_page_action">
                                            <a href="#"> <i class="fal fa-times"></i> Remove</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="cart_page_checkbox">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault5">
                                            </div>
                                        </td>
                                        <td class="cart_page_img">
                                            <div class="img">
                                                <img src="E-com-Img/assets/images/product_17.png" alt="Products" class="img-fluid w-100">
                                            </div>
                                        </td>
                                        <td class="cart_page_details">
                                            <a class="title" href="shop_details.html">Denim Jeans Pants For Men</a>
                                            <p>$52.00</p>
                                            <span><b>Color:</b> Gray</span>
                                            <span><b>Size:</b> 42" (Medium)</span>
                                        </td>
                                        <td class="cart_page_price">
                                            <h3>$59.00</h3>
                                        </td>
                                        <td class="cart_page_quantity">
                                            <div class="details_qty_input">
                                                <button class="minus"><i class="fal fa-minus" aria-hidden="true"></i></button>
                                                <input type="text" placeholder="01">
                                                <button class="plus"><i class="fal fa-plus" aria-hidden="true"></i></button>
                                            </div>
                                        </td>
                                        <td class="cart_page_total">
                                            <h3>$59.00</h3>
                                        </td>
                                        <td class="cart_page_action">
                                            <a href="#"> <i class="fal fa-times"></i> Remove</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <div class="col-lg-4 col-md-9 wow fadeInRight">
                    <div id="sticky_sidebar">
                        <div class="cart_page_summary">
                            <h3>Billing summary</h3>

                            <a href="vendor_details.html" class="vendor_name">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 0 1 .75-.75h3a.75.75 0 0 1 .75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349M3.75 21V9.349m0 0a3.001 3.001 0 0 0 3.75-.615A2.993 2.993 0 0 0 9.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 0 0 2.25 1.016c.896 0 1.7-.393 2.25-1.015a3.001 3.001 0 0 0 3.75.614m-16.5 0a3.004 3.004 0 0 1-.621-4.72l1.189-1.19A1.5 1.5 0 0 1 5.378 3h13.243a1.5 1.5 0 0 1 1.06.44l1.19 1.189a3 3 0 0 1-.621 4.72M6.75 18h3.75a.75.75 0 0 0 .75-.75V13.5a.75.75 0 0 0-.75-.75H6.75a.75.75 0 0 0-.75.75v3.75c0 .414.336.75.75.75Z"></path>
                                </svg>
                                Zapier Gallery
                            </a>
                            <ul>
                                <li>
                                    <a class="img" href="#">
                                        <img src="E-com-Img/assets/images/product_18.png" alt="Products" class="img-fluid w-100">
                                    </a>
                                    <div class="text">
                                        <a class="title" href="shop_details.html">Full Sleeve Hoodie Jacket</a>
                                        <p>$59.00 × 2</p>
                                        <p>Color: Red, Size: XL</p>
                                    </div>
                                </li>
                                <li>
                                    <a class="img" href="#">
                                        <img src="E-com-Img/assets/images/product_16.png" alt="Products" class="img-fluid w-100">
                                    </a>
                                    <div class="text">
                                        <a class="title" href="shop_details.html">cherry fabric western tops</a>
                                        <p>$75.00 × 1</p>
                                        <p>Color: Orange, Size: M</p>
                                    </div>
                                </li>

                            </ul>
                            <a href="vendor_details.html" class="vendor_name">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 0 1 .75-.75h3a.75.75 0 0 1 .75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349M3.75 21V9.349m0 0a3.001 3.001 0 0 0 3.75-.615A2.993 2.993 0 0 0 9.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 0 0 2.25 1.016c.896 0 1.7-.393 2.25-1.015a3.001 3.001 0 0 0 3.75.614m-16.5 0a3.004 3.004 0 0 1-.621-4.72l1.189-1.19A1.5 1.5 0 0 1 5.378 3h13.243a1.5 1.5 0 0 1 1.06.44l1.19 1.189a3 3 0 0 1-.621 4.72M6.75 18h3.75a.75.75 0 0 0 .75-.75V13.5a.75.75 0 0 0-.75-.75H6.75a.75.75 0 0 0-.75.75v3.75c0 .414.336.75.75.75Z"></path>
                                </svg>
                                Comfort Gallery
                            </a>
                            <ul>
                                <li>
                                    <a class="img" href="#">
                                        <img src="E-com-Img/assets/images/product_18.png" alt="Products" class="img-fluid w-100">
                                    </a>
                                    <div class="text">
                                        <a class="title" href="shop_details.html">Full Sleeve Hoodie Jacket</a>
                                        <p>$59.00 × 2</p>
                                        <p>Color: Red, Size: XL</p>
                                    </div>
                                </li>
                            </ul>

                            <h6>subtotal <span>$395.00</span></h6>
                            <h6>Tax <span>(+) $100.00</span></h6>
                            <h6>Discount <span>(-) $45.00</span></h6>
                            <h4>Total <span>$410.00</span></h4>

                            <form action="#">
                                <input type="text" placeholder="Coupon code">
                                <button type="submit" class="common_btn">Apply</button>
                                <p>
                                    Coupon Code: HEM4556JL
                                    <a href="#"><i class="fal fa-times"></i></a>
                                </p>
                            </form>
                        </div>
                        <div class="cart_summary_btn">
                            <a class="common_btn continue_shopping" href="shop.html">Contiue shopping</a>
                            <a class="common_btn" href="checkout.html">checkout <i class="fas fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--============================
        CART PAGE END
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

