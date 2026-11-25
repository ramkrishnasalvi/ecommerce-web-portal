<%@ Page Title="" Language="C#" MasterPageFile="~/Emaster.master" AutoEventWireup="true" CodeFile="track-order.aspx.cs" Inherits="_Default" %>

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
                            <h1>Track Order</h1>
                            <ul>
                                <li><a href="#"><i class="fal fa-home-lg"></i> Home</a></li>
                                <li><a href="#">Track Order</a></li>
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
        TRACK ORDER START
    =============================-->
    <section class="track_order mt_100 mb_100">
        <div class="container">
            <div class="row wow fadeInUp">
                <div class="col-xxl-5 col-xl-6 col-md-10 col-lg-8 m-auto">
                    <form class="tack_order_form">
                        <h4>order tracking</h4>
                        <p>tracking your order status</p>
                        <div class="single_input">
                            <label>order id*</label>
                            <input type="text" placeholder="#75HJFDYD4">
                        </div>
                        <div class="single_input">
                            <label>email address*</label>
                            <input type="email" placeholder="example@Zenis.com">
                        </div>
                        <button type="submit" class="common_btn">track order <i class="fas fa-long-arrow-right"></i></button>
                    </form>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-xxl-10 wow fadeInUp">
                    <ul class="track_order_map">
                        <li class="active">
                            <div class="icon">
                                <img src="E-com-Img/assets/images/track_icon_1.png" alt="Track" class="img-fluid">
                            </div>
                            <h4>Order Confirmed</h4>
                        </li>
                        <li>
                            <div class="icon">
                                <img src="E-com-Img/assets/images/track_icon_2.png" alt="Track" class="img-fluid">
                            </div>
                            <h4>order Processing</h4>
                        </li>
                        <li>
                            <div class="icon">
                                <img src="E-com-Img/assets/images/track_icon_3.png" alt="Track" class="img-fluid">
                            </div>
                            <h4>on the way</h4>
                        </li>
                        <li>
                            <div class="icon">
                                <img src="E-com-Img/assets/images/track_icon_4.png" alt="Track" class="img-fluid">
                            </div>
                            <h4>ready for delivery</h4>
                        </li>
                    </ul>
                </div>
                <div class="col-xxl-10">
                    <div class="tracking_product_area">
                        <div class="row">
                            <div class="col-lg-6 wow fadeInLeft">
                                <div class="tracking_product_info">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M21 11.25v8.25a1.5 1.5 0 0 1-1.5 1.5H5.25a1.5 1.5 0 0 1-1.5-1.5v-8.25M12 4.875A2.625 2.625 0 1 0 9.375 7.5H12m0-2.625V7.5m0-2.625A2.625 2.625 0 1 1 14.625 7.5H12m0 0V21m-8.625-9.75h18c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125h-18c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z"></path>
                                        </svg>
                                    </div>
                                    <h3>Your Order Confirmed</h3>
                                    <p>We will send you a shipping confirmation email as soon as your order ships</p>
                                    <ul>
                                        <li>
                                            <h6>estimated delivery time:</h6>
                                            <h5>April 10, 2025</h5>
                                        </li>
                                        <li>
                                            <h6>shopping by:</h6>
                                            <h5>Comfort Gallery</h5>
                                        </li>
                                        <li>
                                            <h6>status:</h6>
                                            <h5>June 12, 2025</h5>
                                        </li>
                                        <li>
                                            <h6>Order ID:</h6>
                                            <h5>#75HJFDYD4</h5>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-6 wow fadeInRight">
                                <div class="tracking_product_list">
                                    <h3>Order Details</h3>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>product</th>
                                                    <th>total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        Kid's dresses for summer
                                                        <span>× 02</span>
                                                    </td>
                                                    <td>$58.00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Full Sleeve Hoodie Jacket
                                                        <span>× 01</span>
                                                    </td>
                                                    <td>$45.00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Women's Western Party Dress
                                                        <span>× 01</span>
                                                    </td>
                                                    <td>$105.00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Denim Jeans Pants For Men
                                                        <span>× 03</span>
                                                    </td>
                                                    <td>$72.00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Full Sleeve Hoodie Jacket
                                                        <span>× 2</span>
                                                    </td>
                                                    <td>$45.00</td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Subtotal</th>
                                                    <th>$325.00</th>
                                                </tr>
                                                <tr>
                                                    <td>Shipping</td>
                                                    <td>$50.00</td>
                                                </tr>
                                                <tr>
                                                    <th>Total</th>
                                                    <th>$855.00</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--============================
        TRACK ORDER END
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

