<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Web development.aspx.cs" Inherits="GO_IT.Web_development" %>

<!DOCTYPE html>

<html style="font-size: 16px;">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="IT Services, ​Preparing For Your Success Provide Best IT Solutions., Development Services, About Us, Testimonials, Meet The Team, Contact Us">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Web development</title>
    <link rel="icon" type="image/x-icon" href="images/myfav.png">
    <link rel="stylesheet" href="nicepage.css" media="screen">
    <link rel="stylesheet" href="Our-Products.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.4.3, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
    <script src="https://kit.fontawesome.com/b9b88d2319.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="~/MyStyle.css" rel="stylesheet" type="text/css" />











    <script type="application/ld+json">
        {
        "@context": "http://schema.org",
        "@type": "Organization",
        "name": "",
        "logo": "images/ca3c956e1057b5ce2863c5f0a21c09e3.png"
        }
    </script>

    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">
    <style>
        h1, h2, h3, h4, h5, h6 {
            font-family: Montserrat
        }

        input[type=text], input[type=date], input[type=number], input[type=tel] {
            padding: 10px;
            border: none;
            border-bottom: 1px solid gray;
            font-family: Montserrat;
            box-sizing: border-box;
            width: 100%;
            background: inherit;
        }

            input[type=text]:focus, input[type=date]:focus, input[type=number]:focus, input[type=tel]:focus {
                padding: 10px;
                outline: none;
                border-bottom: 2px solid gray;
            }

        .no-display {
            display: none;
        }

        .error {
            display: block;
            color: orangered;
        }

        label {
            width: 100%
        }

        #tryTotal {
            display: inline;
            border: none;
            width: auto;
        }

        #slider {
            position: relative;
            width: 100%;
            height: 490px;
            overflow: hidden;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
        }

            #slider ul {
                position: relative;
                list-style: none;
                height: 100%;
                width: 10000%;
                padding: 0;
                margin: 0;
                transition: all 750ms ease;
                left: 0;
            }

                #slider ul li {
                    position: relative;
                    height: 100%;
                    float: left;
                }

                    #slider ul li img {
                        width: 782px;
                        height: 490px;
                    }

            #slider #prev, #slider #next {
                width: 50px;
                line-height: 50px;
                border-radius: 50%;
                font-size: 2rem;
                text-shadow: 0 0 20px rgba(0, 0, 0, 0.6);
                text-align: center;
                color: white;
                text-decoration: none;
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                transition: all 150ms ease;
            }

                #slider #prev:hover, #slider #next:hover {
                    background-color: rgba(0, 0, 0, 0.5);
                    text-shadow: 0;
                }

            #slider #prev {
                left: 10px;
            }

            #slider #next {
                right: 10px;
            }

        .home {
            color: black;
        }

        #big-img {
            /* display:none; */
            display: inline-block;
            width: 100%;
            height: auto;
        }

        #big-div {
            display: inline-block;
            width: 60%;
            height: 500px;
            background: inherit; /*url(images/abeae987a6f362b2cf8f4ccb5fc2c1efe2d3b6de1b7fef75bc8fc2e615714b65c2f3d2e648b2a0e1796d6fc39a2d3bc84f1cf7bf79570ab0164c33_1280.jpg) left; */
            /* background-repeat:no-repeat;
            background-size: contain; */
        }

        #small-div {
            display: inline-block;
            position: relative;
            width: 37%;
            height: 490px;
            background: inherit;
            box-shadow: 1px 1px 3px black;
            vertical-align: top;
            padding: 15px;
            font-size: 14.5px;
        }

        #contact {
            /*opacity: 0;*/
            position: relative;
            /*transition: all 2s;*/
            display: none;
        }

        .sub:hover {
            background: !important;
            background-color: lightgray;
        }

        #details textarea {
            display: block;
            background: inherit;
            width: 50%;
            height: 150px;
        }

        #details label {
            display: block;
        }

        #details input[type=text], input[type=date], input[type=number] {
            width: 50%;
        }

        .message {
            display: block;
            background: inherit;
            width: 100%;
            height: 150px;
        }

        @media only screen and (max-width: 620px) {
            /* For mobile phones: */
            #slider {
                position: relative;
                width: 100%;
                height: 250px;
            }

                #slider ul li img {
                    width: 500px;
                    height: 250px;
                }

            #big-div {
                background: inherit;
                width: 100%;
                height: auto;
            }

            #big-img {
                display: inline-block;
                width: 100%;
                height: auto;
            }

            #small-div {
                width: 100%;
                vertical-align: top;
                height: auto;
            }

            #details input[type=text], input[type=date], input[type=number] {
                width: 100%;
            }

            #details textarea {
                width: 100%
            }
        }
    </style>
    <!--u-sticky u-sticky-1702-->
</head>
<body data-home-page="Index.aspx" data-home-page-title="Index" class="u-body u-xl-mode">
    <form runat="server" id="form1">
        <table width="100%">
            <tr>
                <td>
                    <header class="u-clearfix u-header u-header" id="sec-a2c0" style="box-shadow: 1px 1px 4px 1px black;">
                        <script src="https://apps.elfsight.com/p/platform.js" defer></script>
                        <div class="elfsight-app-6f4e400a-f035-4353-8590-8933c21c23d1"></div>
                        <div class="u-clearfix u-sheet u-sheet-1">
                            <a href="Index.aspx" class="u-image u-logo u-image-1" data-image-width="363" data-image-height="176">
                                <img src="images/logo2.png" class="u-logo-image u-logo-image-1" style="width: 100%; height: auto;">
                            </a>
                            <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
                                <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px; font-weight: 700;">
                                    <a class="u-button-style u-custom-active-border-color u-custom-border u-custom-border-color u-custom-borders u-custom-hover-border-color u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
                                        <svg class="u-svg-link" viewBox="0 0 24 24">
                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
                                        <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg">
                                            <g>
                                                <rect y="1" width="16" height="2"></rect>
                                                <rect y="7" width="16" height="2"></rect>
                                                <rect y="13" width="16" height="2"></rect>
                                            </g>
                                        </svg>
                                    </a>
                                </div>
                                <div class="u-custom-menu u-nav-container">
                                    <ul class="u-nav u-spacing-20 u-unstyled u-nav-1">
                                        <li class="u-nav-item">
                                            <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="index.aspx" style="padding: 10px;"><i class="fa-solid fa-house"></i>Home</a>
                                        </li>
                                        <li class="u-nav-item">
                                            <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="#" style="padding: 10px;"><i class="fa-solid fa-file-lines"></i>Pages</a><div class="u-nav-popup">
                                                <ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-2">
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link u-white" href="index.aspx#carousel_2104" data-page-id="2743630793"><i class="fa-solid fa-phone"></i>Contact Us</a>
                                                    </li>
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link u-white" href="index.aspx#carousel_c70b" data-page-id="2743630793"><i class="fa-solid fa-bag-shopping"></i>Our Services</a>
                                                    </li>
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link u-white" href="index.aspx#carousel_f5c7" data-page-id="2743630793"><i class="fa-solid fa-user"></i>About</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="u-nav-item">
                                            <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" style="padding: 10px;" href="#"><i class="fa-solid fa-gift"></i>Products</a><div class="u-nav-popup">
                                                <ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-3">
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link u-white" href="ASP web application.aspx"><i class="fa-solid fa-wifi"></i>ASP.NET Web App</a>
                                                    </li>
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link u-white" href="Window application.aspx"><i class="fa-solid fa-window-restore"></i>Windows application</a>
                                                    </li>
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link u-white" href="Web development.aspx"><i class="fa-brands fa-internet-explorer"></i>Web development</a>
                                                    </li>
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link u-white" href="Web design.aspx"><i class="fa-brands fa-firefox"></i>Web designing</a>
                                                    </li>
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link u-white" href="Graphics design.aspx"><i class="fa-solid fa-brush"></i>Graphics designing</a>
                                                    </li>
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link u-white" href="Word processing.aspx"><i class="fa-solid fa-book"></i>Desktop publishing</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="u-nav-item">
                                            <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="Help.aspx" style="padding: 10px;"><i class="fa-solid fa-circle-info"></i>Help</a>
                                        </li>

                                        <asp:Panel ID="login" runat="server" CssClass="u-nav-item">
                                            <li class="u-nav-item">
                                                <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="Register.aspx" style="padding: 10px;"><i class="fa-solid fa-arrow-right-to-bracket"></i>Login</a>
                                            </li>
                                        </asp:Panel>

                                        <asp:Panel ID="user" runat="server" CssClass="u-nav-item" Visible="false">
                                            <li class="u-nav-item">
                                                <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" style="padding: 10px;" id="name1" runat="server"></a>
                                            </li>
                                        </asp:Panel>
                                        <li class="u-nav-item">
                                            <a id="cart" runat="server" style="float: right" class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="Register.aspx"><i class="fa-solid fa-cart-arrow-down"></i>
                                                Cart<sup><asp:Label Visible="false" runat="server" ID="cart_badge" CssClass="cart-badge"></asp:Label></sup>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="u-custom-menu u-nav-container-collapse">
                                    <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                                        <div class="u-inner-container-layout u-sidenav-overflow">
                                            <div class="u-menu-close"></div>
                                            <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-4">
                                                <li class="u-nav-item">
                                                    <a class="u-button-style u-nav-link" href="Index.aspx" style="padding: 10px;"><i class="fa-solid fa-house"></i>Home</a>
                                                </li>
                                                <li class="u-nav-item">
                                                    <a class="u-button-style u-nav-link" href="#" style="padding: 10px;"><i class="fa-solid fa-file-lines"></i>Pages</a><div class="u-nav-popup">
                                                        <ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-5">
                                                            <li class="u-nav-item">
                                                                <a class="u-button-style u-nav-link" href="Our-Products.html#carousel_2104" data-page-id="2743630793"><i class="fa-solid fa-phone"></i>Contact Us</a>
                                                            </li>
                                                            <li class="u-nav-item">
                                                                <a class="u-button-style u-nav-link" href="Our-Products.html#carousel_c70b" data-page-id="2743630793"><i class="fa-solid fa-bag-shopping"></i>Our Services</a>
                                                            </li>
                                                            <li class="u-nav-item">
                                                                <a class="u-button-style u-nav-link" href="Our-Products.html#carousel_f5c7" data-page-id="2743630793"><i class="fa-solid fa-user"></i>About</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="u-nav-item">
                                                    <a class="u-button-style u-nav-link" style="padding: 10px;" href="#"><i class="fa-solid fa-gift"></i>Products</a><div class="u-nav-popup">
                                                        <ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-6">
                                                            <li class="u-nav-item">
                                                                <a class="u-button-style u-nav-link" href="ASP web application.aspx"><i class="fa-solid fa-wifi"></i>ASP.NET Web App</a>
                                                            </li>
                                                            <li class="u-nav-item">
                                                                <a class="u-button-style u-nav-link" href="Window application.aspx"><i class="fa-solid fa-window-restore"></i>Windows application</a>
                                                            </li>
                                                            <li class="u-nav-item">
                                                                <a class="u-button-style u-nav-link" href="Web development.aspx"><i class="fa-brands fa-internet-explorer"></i>Web development</a>
                                                            </li>
                                                            <li class="u-nav-item">
                                                                <a class="u-button-style u-nav-link" href="Web design.aspx"><i class="fa-brands fa-firefox"></i>Web designing</a>
                                                            </li>
                                                            <li class="u-nav-item">
                                                                <a class="u-button-style u-nav-link" href="Graphics design.aspx"><i class="fa-solid fa-brush"></i>Graphics designing</a>
                                                            </li>
                                                            <li class="u-nav-item">
                                                                <a class="u-button-style u-nav-link" href="Word processing.aspx"><i class="fa-solid fa-book"></i>Desktop publishing</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="u-nav-item">
                                                    <a class="u-button-style u-nav-link" href="Help.aspx" style="padding: 10px;"><i class="fa-solid fa-circle-info"></i>Help</a>
                                                </li>

                                                <asp:Panel ID="login2" runat="server" CssClass="u-nav-item">
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link" href="Register.aspx" style="padding: 10px;"><i class="fa-solid fa-arrow-right-to-bracket"></i>Login</a>
                                                    </li>
                                                </asp:Panel>

                                                <asp:Panel ID="user2" runat="server" CssClass="u-nav-item" Visible="false">
                                                    <li class="u-nav-item">
                                                        <a class="u-button-style u-nav-link" style="padding: 10px;" id="name2" runat="server"></a>
                                                    </li>
                                                </asp:Panel>

                                                <li class="u-nav-item">
                                                    <a class="u-button-style u-nav-link" href="Cart.aspx" id="cart2" runat="server" style="padding: 10px;"><i class="fa-solid fa-cart-arrow-down"></i>
                                                        Cart<sup><asp:Label Visible="false" runat="server" ID="cart_badge2" CssClass="cart-badge"></asp:Label></sup>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
                                </div>
                            </nav>
                        </div>
                    </header>
                </td>
            </tr>
            <tr>
                <td>
                    <section style="padding: 20px;">
                        <h2 class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">
                            <img src="images/4.png" style="width: 30px; height: 30px;" alt="">&nbsp;<dfn style="text-decoration: none; font-style: normal;" id="s_name1" runat="server"></dfn></h2>
                        <div id="big-div">
                            <!--<img src="images/abeae987a6f362b2cf8f4ccb5fc2c1efe2d3b6de1b7fef75bc8fc2e615714b65c2f3d2e648b2a0e1796d6fc39a2d3bc84f1cf7bf79570ab0164c33_1280.jpg" id="big-img" /> -->
                            <div id="slider">
                                <ul id="slideWrap">
                                    <li>
                                        <img src="images/web-development.jpg" id="image" runat="server" /></li>
                                    <li>
                                        <img src="images/web-development2.jpg" /></li>
                                    <li>
                                        <img src="images/web-development3.jpg" /></li>
                                    <li>
                                        <img src="images/PHP-MySQL.jpg" /></li>
                                    <li>
                                        <img src="images/javascript.jpg" /></li>
                                </ul>
                                <a id="prev" style="cursor: pointer;">&#8810;</a>
                                <a id="next" style="cursor: pointer;">&#8811;</a>
                            </div>


                            <script>
                                var responsiveSlider = function () {

                                    var slider = document.getElementById("slider");
                                    var sliderWidth = slider.offsetWidth;
                                    var slideList = document.getElementById("slideWrap");
                                    var count = 1;
                                    var items = slideList.querySelectorAll("li").length;
                                    var prev = document.getElementById("prev");
                                    var next = document.getElementById("next");

                                    window.addEventListener('resize', function () {
                                        sliderWidth = slider.offsetWidth;
                                    });

                                    var prevSlide = function () {
                                        if (count > 1) {
                                            count = count - 2;
                                            slideList.style.left = "-" + count * sliderWidth + "px";
                                            count++;
                                        }
                                        else if (count = 1) {
                                            count = items - 1;
                                            slideList.style.left = "-" + count * sliderWidth + "px";
                                            count++;
                                        }
                                    };

                                    var nextSlide = function () {
                                        if (count < items) {
                                            slideList.style.left = "-" + count * sliderWidth + "px";
                                            count++;
                                        }
                                        else if (count = items) {
                                            slideList.style.left = "0px";
                                            count = 1;
                                        }
                                    };

                                    next.addEventListener("click", function () {
                                        nextSlide();
                                    });

                                    prev.addEventListener("click", function () {
                                        prevSlide();
                                    });

                                    setInterval(function () {
                                        nextSlide()
                                    }, 5000);

                                };

                                window.onload = function () {
                                    responsiveSlider();
                                }


                            </script>
                        </div>
                        <div id="small-div">
                            <h4 class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" id="s_name2" runat="server"></h4>

                            <blockquote>
                                Web development is the work involved in developing a website for the Internet (World Wide Web) or an intranet (a private network). Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services.
                            </blockquote>

                            <blockquote>
                                Our team will create and develop responsive websites for you adding different plugins, modules, animations and so on. This will involve two sections; the front-end and the backend. The front-end will comprise of HTML, CSS and Bootstrap, while the back-end will comprise of PHP and MySQL database.
                            </blockquote>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xl">
                                <span style="color: red;"><strike>NGN 75,000</strike></span> <span style="font-weight: bolder; font-size: 30px; color: cornflowerblue;">NGN <em id="price" runat="server"></em></span>
                            </div>
                        </div>
                        <div style="width: 100%;">
                            <button type="button" class="u-btn" style="display: inline-block;" id="order">
                                Order Now !
                            </button>

                            <div id="contact">
                                <a href="tel:+234 818 3992 668" class="u-btn" style="display: inline-block; position: relative;">Call Us! : 08183993668
                                </a>

                                <a href="mailto:onukwilip@gmail.com" class="u-btn" style="display: inline-block; position: relative;">Email Us!
                                </a>
                            </div>
                            <script>
                                var order = document.getElementById("order");

                                order.onclick = function () {
                                    document.getElementById("contact").style.display = "inline-block";
                                    document.getElementById("contact").style.opacity = 1;
                                    document.getElementById("order").style.display = "none";
                                }
                            </script>
                        </div>
                    </section>

                    <section style="padding: 20px; color: white;" class="u-grey-80">

                        <h5 class="u-custom-font u-font-montserrat u-text u-text-default u-text-1"><b>Web Development Package</b> </h5>
                        <ul>
                            <li>Use of HTML, CSS and Javascript to cteate responsive front-end websites.</li>
                            <li>Use of PHP and MySQL database to create backend for website.</li>
                            <li>Ecommerce functionability.</li>
                            <li>Uploadable contents.</li>
                            <li>Source code included.</li>
                            <li>Customizable contents. </li>
                        </ul>

                        <h5 class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Requirements </h5>
                        <ul>
                            <li>The document (If you want us to edit existing one).</li>
                            <li>The description of your project (What do you want us to do).</li>
                            <li>The time frame in which you want it delivered.</li>
                            <b>(N.B: Revisions are available).</b>
                        </ul>
                    </section>
                    <section class="row u-grey-80" style="padding: 10px 30px; height: auto" id="details">
                        <h2>Description</h2>
                        <div class="col-xl-12 ">
                            <label>
                                Project name:<br />
                                <input type="text" placeholder="E.g GOIT..." id="name" runat="server" />
                                <asp:Label Visible="false" runat="server" ID="errorName" CssClass="error" />
                            </label>
                            <br />
                            <label>
                                Domain name:<br />
                                <input type="text" placeholder="E.g goit.com..." id="domain" runat="server" />
                                <asp:Label Visible="false" runat="server" ID="errorDomain" CssClass="error" />
                            </label>
                            <br />
                            <label>
                                Number of pages:<br />
                                <input type="number" required min="1" value="" id="pages" runat="server" max="10" />
                                <asp:Label Visible="false" runat="server" ID="errorPages" CssClass="error" />
                            </label>
                            <br />
                            <label>
                                Date to be delivered:<br />
                                <input type="date" id="date" runat="server" />
                                <asp:Label Visible="false" runat="server" ID="errorDate" CssClass="error" />
                            </label>
                            <br />
                            <label>
                                Project description:<br />
                                <textarea placeholder="Description..." id="description" runat="server"></textarea>
                                <asp:Label Visible="false" runat="server" ID="errorDesc" CssClass="error" />
                            </label>
                            <br />

                            <label>
                                Project features:<br />
                                <textarea placeholder="Features..." id="features" runat="server"></textarea>
                                <asp:Label Visible="false" runat="server" ID="errorFeatures" CssClass="error" />
                            </label>
                            <br />

                            <label>
                                Attachment1:
                                <asp:FileUpload ID="attach1" runat="server" />
                                <asp:Label ID="a1error" CssClass="error" runat="server" Text="*File must not be more than 5mb..." Visible="false"></asp:Label>
                            </label>
                            <br />
                            <label>
                                Attachment2:
                                <asp:FileUpload ID="attach2" runat="server" />
                                <asp:Label ID="a2error" CssClass="error" runat="server" Text="*File must not be more than 5mb..." Visible="false"></asp:Label>
                            </label>
                            <br />
                            <label>
                                Attachment3:
                                <asp:FileUpload ID="attach3" runat="server" />
                                <asp:Label ID="a3error" CssClass="error" runat="server" Text="*File must not be more than 5mb..." Visible="false"></asp:Label>
                            </label>
                            <br />
                            <label>
                                Upload any file/folder in .zip format only, or any existing project you want us to work with e.g Themes, templates, etc...
                                <asp:FileUpload ID="zipfile" runat="server" />
                                <asp:Label ID="errorZip" CssClass="error" runat="server" Text="*File must be in zip format only..." Visible="false"></asp:Label>
                            </label>
                        </div>
                    </section>

                    <section class="row" style="padding: 10px 30px;">
                        <h2>EXTRAS</h2>
                        <div class="col-xl-12">
                            <label>
                                <input type="checkbox" id="extrapage" value="Extra page" onchange="extrapages()" runat="server" />
                                Extra page &nbsp;&nbsp;&nbsp;+NGN <span id="page_price" runat="server">2500</span>&nbsp;&nbsp;&nbsp;<input type="number" style="display: none; width: 100%" min="1" value="1" id="pageqty" onchange="qty()" runat="server" />
                            </label>
                            <br />
                            <label>
                                <input type="checkbox" id="extrafunction" value="Extra functionality" onchange="extrafunc()" runat="server" />
                                Extra functionality &nbsp;&nbsp;&nbsp;+NGN <span id="func_price" runat="server">10000</span>
                            </label>
                            <br />
                            <textarea id="functionality" style="width: 100%; height: 150px; display: none" onchange="funcChange()" runat="server"></textarea>

                            <h6 id="errorFunction" class="error" runat="server" style="display: none;"></h6>

                            <label>
                                <input type="checkbox" id="extradata" value="Extra database" onchange="extradbase()" runat="server" />
                                Extra database &nbsp;&nbsp;&nbsp;+NGN <span id="dbase_price" runat="server">5000</span>
                            </label>
                            <br />
                            <textarea id="database" style="width: 100%; height: 150px; display: none" onchange="dbaseChange()" runat="server"></textarea>

                            <h6 id="errorDbase" class="error" runat="server" style="display: none;"></h6>

                            <label>
                                <input type="checkbox" id="hosting" value="Extra hosting" onchange="extrahost()" runat="server" />
                                Hosting site (more than 2GB) &nbsp;&nbsp;&nbsp;+NGN <span id="host_price" runat="server">15000</span>
                            </label>
                            <br />
                            <br />

                            <h3 class="col-xl-12">Total amount: NGN<input type="text" id="tryTotal" runat="server" value="55000" readonly /><input type="text" id="initial" runat="server" value="55000" readonly style="display: none" />
                            </h3>

                            <label class="col-xl-12">
                                <asp:Button CssClass="u-btn u-btn-submit-container" Text="Submit" runat="server" OnClick="Submit" />
                            </label>


                            <script>
                                var initial = Number(document.getElementById("initial").value);
                                var hostP = Number(document.getElementById("host_price").innerHTML);
                                var funcP = Number(document.getElementById("func_price").innerHTML);
                                var dbaseP = Number(document.getElementById("dbase_price").innerHTML);
                                var pageP = Number(document.getElementById("page_price").innerHTML);

                                function extrahost() {
                                    var host = document.getElementById("hosting");
                                    if (host.checked == true) {
                                        var total = Number(document.getElementById("tryTotal").value);
                                        document.getElementById("tryTotal").value = total + hostP;
                                        document.getElementById("initial").value = Number(document.getElementById("initial").value) + hostP;
                                    }

                                    else if (host.checked == false) {
                                        var total = Number(document.getElementById("tryTotal").value);
                                        document.getElementById("tryTotal").value = total - hostP;
                                        document.getElementById("initial").value = Number(document.getElementById("initial").value) - hostP;
                                    }
                                }

                                function extradbase() {
                                    var dbase = document.getElementById("extradata");
                                    if (dbase.checked == true) {
                                        document.getElementById("database").style.display = "block";
                                        var total = Number(document.getElementById("tryTotal").value);
                                        document.getElementById("tryTotal").value = total + dbaseP;
                                        document.getElementById("initial").value = Number(document.getElementById("initial").value) + dbaseP;
                                    }

                                    else if (dbase.checked == false) {
                                        document.getElementById("database").style.display = "none";

                                        var total = Number(document.getElementById("tryTotal").value);
                                        document.getElementById("tryTotal").value = total - dbaseP;
                                        document.getElementById("initial").value = Number(document.getElementById("initial").value) - dbaseP;
                                        document.getElementById("errorDbase").style.display = "none";
                                    }
                                }

                                function extrafunc() {
                                    var func = document.getElementById("extrafunction");
                                    if (func.checked == true) {
                                        document.getElementById("functionality").style.display = "block";
                                        var total = Number(document.getElementById("tryTotal").value);
                                        document.getElementById("tryTotal").value = total + funcP;
                                        document.getElementById("initial").value = Number(document.getElementById("initial").value) + funcP;
                                    }

                                    else if (func.checked == false) {
                                        document.getElementById("functionality").style.display = "none";

                                        var total = Number(document.getElementById("tryTotal").value);
                                        document.getElementById("tryTotal").value = total - funcP;
                                        document.getElementById("initial").value = Number(document.getElementById("initial").value) - funcP;

                                        document.getElementById("errorFunction").style.display = "none";
                                    }
                                }

                                function extrapages() {
                                    var qty = document.getElementById("pageqty");
                                    var check = document.getElementById("extrapage");

                                    var total = Number(document.getElementById("tryTotal").value);
                                    amount = Number(qty.value) * pageP;

                                    if (check.checked == true) {
                                        document.getElementById("pageqty").style.display = "block";
                                        document.getElementById("tryTotal").value = Number(document.getElementById("initial").value) + amount;
                                    }


                                    else if (check.checked == false) {
                                        document.getElementById("pageqty").style.display = "none";
                                        document.getElementById("tryTotal").value = total - amount;
                                    }
                                }

                                function qty() {
                                    var qty = document.getElementById("pageqty");
                                    const total = Number(document.getElementById("tryTotal").value);
                                    amount = Number(qty.value) * pageP;
                                    document.getElementById("tryTotal").value = Number(document.getElementById("initial").value) + amount;
                                }

                                function dbaseChange() {

                                }

                                function funcChange() {

                                }


                            </script>
                        </div>
                    </section>

                    <div style="width: 100%;" align="center">
                        <hr style="width: 95%; align-content: center;" />
                    </div>

                    <section class="u-align-center u-clearfix u-section-10" id="carousel_9296">
                        <div class="u-clearfix u-sheet u-sheet-1">
                            <h6 class="u-custom-font u-font-montserrat u-text u-text-1">Location</h6>
                            <p class="u-custom-font u-font-montserrat u-text u-text-2">214 Ayobo-Ipaja Road, Akinyele Bus-Stop.</p>
                            <div class="u-border-10 u-border-palette-1-base u-line u-line-horizontal u-line-1"></div>
                            <p class="u-text u-text-3">
                                Office hours: 8am - 6pm.<br>
                                Monday - Friday.
                            </p>
                        </div>
                    </section>
                    <section class="u-align-center u-clearfix u-image u-section-11" id="carousel_2104" data-image-width="1529" data-image-height="1080">
                        <div class="u-clearfix u-sheet u-sheet-1">
                            <div class="u-container-style u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-group u-radius-50 u-shape-round u-white u-group-1" data-animation-name="zoomIn" data-animation-duration="2000" data-animation-direction="">
                                <div class="u-container-layout u-container-layout-1">
                                    <h2 class="u-align-center u-custom-font u-font-montserrat u-text u-text-1">Contact Us</h2>
                                    <div class="u-form u-form-1">
                                        <label>
                                            Name*<br />
                                            <input type="text" id="_name" runat="server" placeholder="Enter name..." /><asp:Label Visible="false" runat="server" ID="_errorName" CssClass="error" />
                                        </label>
                                        <br />
                                        <br />
                                        <label>
                                            Phone*<br />
                                            <input type="tel" id="_phone" runat="server" placeholder="Enter phone number..." /><asp:Label Visible="false" runat="server" ID="_errorPhone" CssClass="error" />
                                        </label>
                                        <br />
                                        <br />
                                        <label>
                                            Subject*<br />
                                            <input type="text" id="_subject" runat="server" placeholder="Enter email subject..." /><asp:Label Visible="false" runat="server" ID="_errorSubject" CssClass="error" />
                                        </label>
                                        <br />
                                        <br />
                                        <label>
                                            Message*<br />
                                            <textarea id="_message" runat="server" placeholder="Message..." class="message"></textarea><asp:Label Visible="false" runat="server" ID="_errorMessage" CssClass="error" />
                                        </label>
                                        <br />
                                        <div>
                                            <asp:Button ID="reset" runat="server" CssClass="u-btn" Text="Reset" Style="float: left" OnClick="reset_Click" />
                                            <asp:Button ID="submit" runat="server" CssClass="u-btn" Text="Submit" Style="float: right" OnClick="submit_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-0b4b">
                        <div class="u-clearfix u-sheet u-sheet-1">
                            <p class="u-small-text u-text u-text-variant u-text-1">Copyright &copy; 2021 GO IT store.</p>
                        </div>
                    </footer>

                </td>
            </tr>
        </table>
    </form>

    <span style="height: 64px; width: 64px; margin-left: 0px; margin-right: auto; margin-top: 0px; background-image: none; right: 20px; bottom: 20px" class="u-back-to-top u-icon u-icon-circle u-opacity u-opacity-85 u-palette-1-base u-spacing-15" data-href="#">
        <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 551.13 551.13">
            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1d98"></use></svg>
        <svg class="u-svg-content" enable-background="new 0 0 551.13 551.13" viewBox="0 0 551.13 551.13" xmlns="http://www.w3.org/2000/svg" id="svg-1d98">
            <path d="m275.565 189.451 223.897 223.897h51.668l-275.565-275.565-275.565 275.565h51.668z"></path></svg>
    </span>
</body>
</html>
