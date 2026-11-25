<%@ Page Title="" Language="C#" MasterPageFile="~/Emaster.master" AutoEventWireup="true" CodeFile="contact-us.aspx.cs" Inherits="_Default" %>

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
                            <h1>Contact Us</h1>
                            <ul>
                                <li><a href="#"><i class="fal fa-home-lg"></i> Home</a></li>
                                <li><a href="#">Contact Us</a></li>
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
        CONTACT US START
    =============================-->
    <section class="contact_us mt_75">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-md-6">
                    <div class="contact_info wow fadeInUp">
                        <span><img src="E-com-Img/assets/images/call_icon_black.png" alt="call" class="img-fluid"></span>
                        <h3>Call Us</h3>
                        <a href="callto:12345678901">+44 20 9994 7740</a>
                        <a href="callto:12345678901">+44 30 7772 8830</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6">
                    <div class="contact_info wow fadeInUp">
                        <span><img src="E-com-Img/assets/images/mail_icon_black.png" alt="Mail" class="img-fluid"></span>
                        <h3>Email Us</h3>
                        <a href="mailto:example@gmail.com">support@yourdomain.com</a>
                        <a href="mailto:example@gmail.com">hellow@yourdomain.com</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6">
                    <div class="contact_info wow fadeInUp">
                        <span><img src="E-com-Img/assets/images/location_icon_black.png" alt="Map" class="img-fluid"></span>
                        <h3>Our Location</h3>
                        <p>37 W 24th St, Blackwell Street Creek,
                            10th Avenue, New York</p>
                    </div>
                </div>
            </div>
            <div class="row mt_75">
                <div class="col-lg-5">
                    <div class="contact_img wow fadeInLeft">
                        <img src="E-com-Img/assets/images/contact_message.jpg" alt="contact" class="img-fluid w-100">
                        <div class="contact_hotline">
                            <h3>Hotline</h3>
                            <a href="callto:+123324587939">+123 324 5879 39</a>
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0M3.124 7.5A8.969 8.969 0 0 1 5.292 3m13.416 0a8.969 8.969 0 0 1 2.168 4.5"></path>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="contact_form wow fadeInRight">
                        <h2>Get In Touch 👋</h2>
                        <form action="#">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="single_input">
                                        <label>name</label>
                                        <input type="text" placeholder="Jhon Deo">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="single_input">
                                        <label>email</label>
                                        <input type="email" placeholder="example@Zenis.com">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="single_input">
                                        <label>phone</label>
                                        <input type="text" placeholder="+96512344854475">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="single_input">
                                        <label>Subject</label>
                                        <input type="text" placeholder="Subject">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="single_input">
                                        <label>Message</label>
                                        <textarea rows="7" placeholder="Message..."></textarea>
                                    </div>
                                    <button class="common_btn">send message <i class="fas fa-long-arrow-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="contact_map mt_100 wow fadeInUp">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3104.8776746534986!2d-77.027541687759!3d38.903912546200644!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b7b7931d95b707%3A0x16e85cf5a8a5fdce!2sMarriott%20Marquis%20Washington%2C%20DC!5e0!3m2!1sen!2sbd!4v1700767199965!5m2!1sen!2sbd" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </section>
    <!--============================
        CONTACT US END
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

