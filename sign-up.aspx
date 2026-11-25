<%@ Page Title="" Language="C#" MasterPageFile="~/Emaster.master" AutoEventWireup="true" CodeFile="sign-up.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--=========================
        SIGN UP PAGE START
    ==========================-->
    <section class="sign_up mt_100 mb_100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xxl-3 col-lg-4 col-xl-4 d-none d-lg-block wow fadeInLeft">
                    <div class="sign_in_img">
                        <img src="E-com-Img/assets/images/sign_in_img_2.jpg" alt="Sign In" class="img-fluid w-100">
                    </div>
                </div>
                <div class="col-xxl-5 col-lg-8 col-xl-6 col-md-10 wow fadeInRight">
                    <div class="sign_in_form">
                        <h3>Sign Up to Continue 👋</h3>
                        <form>
                            <div class="row">

                                <div class="col-lg-6">
                                    <div class="single_input">
                                        <label>first name</label>
                                        <input type="text" placeholder="First name">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="single_input">
                                        <label>Last name</label>
                                        <input type="text" placeholder="Last name">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="single_input">
                                        <label>email</label>
                                        <input type="email" placeholder="example@Zenis.com">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="single_input">
                                        <label>phone</label>
                                        <input type="text" placeholder="+95745841369465895">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="single_input">
                                        <label>password</label>
                                        <input type="password" placeholder="********">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="single_input">
                                        <label>cnfirm password</label>
                                        <input type="password" placeholder="********">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <button type="submit" class="common_btn">Sign Up <i class="fas fa-long-arrow-right"></i></button>
                                </div>

                            </div>
                        </form>

                        <p class="dont_account">Already have an account? <a href="sign_in.html">Sign In</a></p>
                        <p class="or">or</p>
                        <ul>
                            <li>
                                <a href="#">
                                    <span>
                                        <img src="E-com-Img/assets/images/google_logo.png" alt="google" class="img-fluid w-100">
                                    </span>
                                    Google
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span>
                                        <img src="E-com-Img/assets/images/fb_logo.png" alt="google" class="img-fluid w-100">
                                    </span>
                                    Facebook
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span>
                                        <img src="E-com-Img/assets/images/twitter_logo.png" alt="google" class="img-fluid w-100">
                                    </span>
                                    Twitter
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=========================
        SIGN UP PAGE END
    ==========================-->
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

