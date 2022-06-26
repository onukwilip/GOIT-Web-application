<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Changepassword.aspx.cs" Inherits="GO_IT.Changepassword" %>

<!DOCTYPE html>

<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="IT Services, ​Preparing For Your Success Provide Best IT Solutions., Development Services, About Us, Testimonials, Meet The Team, Contact Us">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Confirm</title>
      <link rel="icon" type="image/x-icon" href="images/myfav.png">
    <link rel="stylesheet" href="nicepage.css" media="screen">
    <link rel="stylesheet" href="Our-Products.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.4.3, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="fontawesome-free-6.1.1-web/fontawesome-free-6.1.1-web/css/fontawesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="fontawesome-free-6.1.1-web/fontawesome-free-6.1.1-web/css/fontawesome.css" type="text/css" />
    <link href="~/MyStyle.css" rel="stylesheet" type="text/css" />
    <script src="https://kit.fontawesome.com/b9b88d2319.js" crossorigin="anonymous"></script>
    
    
    
    
    
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/ca3c956e1057b5ce2863c5f0a21c09e3.png"
}</script>

      <script type="text/javascript">
          function MyCancel() {
              document.getElementById('modal').style.display = 'none';
              document.getElementById('modal2').style.display = 'none';
          }

          function MyLogin() {
              document.getElementById('modal').style.display = 'block';
              document.getElementById('modal2').style.display = 'block';
          }

          var Mymodal = document.getElementById("modal");

          window.onclick = function (event) {
              if (event.target == modal) {
                  //Mymodal.style.display = "none";
                  document.getElementById("modal2").style.display = "none";
                  document.getElementById("modal").style.display = "none";
              }

          }

          function Signin() {
              document.getElementById("login_form").style.display = "block";
              document.getElementById("form_signup").style.display = "none";

              document.getElementById("login").style.borderBottomStyle = "solid";
              document.getElementById("login").style.borderBottomWidth = "3px";
              document.getElementById("login").style.borderBottomColor = "Green";

              document.getElementById("signup").style.borderBottomStyle = "none";
          }

          function MySignup() {
              document.getElementById("login_form").style.display = "none";
              document.getElementById("form_signup").style.display = "block";

              document.getElementById("signup").style.borderBottomStyle = "solid";
              document.getElementById("signup").style.borderBottomWidth = "3px";
              document.getElementById("signup").style.borderBottomColor = "Green";

              document.getElementById("login").style.borderBottomStyle = "none";
             /* document.getElementById("form_signup").style.display = "block";
              document.getElementById("login_form").style.display = "none";*/
          }
      </script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">
      <!--u-sticky u-sticky-1702-->
      <style>
         
        .myfix
        {
            position:fixed;
            z-index:5;
            width:100%;
            top:0px;
            left:0px;
        }

        .mybody
        {
            position:absolute;
            top:120px;
            z-index:4;
            width:99%;
        }

        nav span
        {
            float:right;
            padding-right:20px;
            cursor:pointer
        }

        /* MODAL-PLUGIN */

        .modal-login
        {
           
            width:auto;
            height:auto;
            padding:30px;
            background-color:white;
            box-sizing:border-box;
            box-shadow:1px 1px 4px 1px black;
            z-index:1; 
            /*margin:0px auto; */
           /* left:50%;
            top:50%;
            transform:translate(-50%, -50%);*/
            margin-top:50px;
            margin-bottom:50px;
            overflow-y:auto;
            display:block;
            border-radius:10px;
        }

        .animate
        {
            animation:animatefade 1s;
        }

        @keyframes animatefade
        {
            from {opacity:0;}
            to {opacity:1;}
        }

        .modal-login form label
        {
            /*font-family:'Arial Rounded MT';*/
            font-size:16px;
        }

        .modal-login form span a
        {
            /*font-family:'Arial Rounded MT';*/
            font-size:16px;
            text-decoration:underline;
            color:blue;
            cursor:pointer;
        }

        .modal-login input[type=text], input[type=password]
        {
            width:100%;
            height:40px;
        }

        .modal-login input[type=email], input[type=password]
        {
            width:100%;
            height:40px;
        }

        .modal-login input[type=submit]
        {
            text-align:center;
            border:none;
            border-radius:0px;
            background-color:cornflowerblue;
            color:white;
            padding:10px 30px;
        }

        .modal-login input[type=submit]:hover
        {
            background-color:Highlight;
        }

        .modal-div
        {
            margin:0px auto;
            text-align:center;
        }

        .modal-div img
        {
            width:100px;
            height:auto;
            border-radius:100px;
        }

        .google
        {
            width:100%;
            height:35px;
            background:Green;
            color:white;
            border:none;
            border-radius:5px;
        }

        .google:hover
        {
            background:lightgreen;
            color:darkgreen;
        }

         .f-b:hover
        {
            background:lightblue;
            color:darkblue;
        }

        .f-b
        {
            width:100%;
            height:35px;
            background:blue;
            color:white;
            border:none;
            border-radius:5px;
        }

        .modal-bg
        {
            position:fixed;
            z-index:6;
            top:0px;
            left:0px;
            background-color:lightgray;
            width:100%;
            height:100%;
            opacity:0.7;
            display:none;
        }

        .dimage:hover
        {
            box-shadow:2px 2px 2px 2px black;
        }

        .times
        {
            /*font-family:'Arial Rounded MT';*/
            font-size:20px;
        }

        .login
        {
            cursor:pointer;
            padding:5px 10px;
            /*font-family:'Arial Rounded MT';*/
        }

        .signup
        {
            cursor:pointer;
            padding:5px 10px;
            /*font-family:'Arial Rounded MT';*/
        }

        .active{border-bottom:solid 3px Darkgreen;}

        .big-block
        {
            width:100%;
            height:700px;
            background-image:url("../images/backgrounds/bg-2.jpg");
        }

        @media only screen and (max-width: 620px)
        {
            /* For mobile phones: */
            .modal-login
            {
                width: 70%;
            }

            .mybody
            {
                width:98%;
            }
        }
      </style>
  </head>
  <body data-home-page="index.html" data-home-page-title="Index" class="u-body u-xl-mode">
      <form id="form1" runat="server">
          <header class="u-clearfix u-header u-header" id="sec-a2c0" style="box-shadow:1px 1px 4px 1px black;">
                      <script src="https://apps.elfsight.com/p/platform.js" defer></script>
                      <div class="elfsight-app-6f4e400a-f035-4353-8590-8933c21c23d1"></div>
                      <div class="u-clearfix u-sheet u-sheet-1">
                          <a href="index.html" class="u-image u-logo u-image-1" data-image-width="363" data-image-height="176">
                              <img src="images/logo2.png" class="u-logo-image u-logo-image-1" style="width:100%; height:auto;">
                          </a>
                          <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
                              <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px; font-weight: 700;">
                                  <a class="u-button-style u-custom-active-border-color u-custom-border u-custom-border-color u-custom-borders u-custom-hover-border-color u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
                                      <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
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
                                          <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="index.aspx" style="padding: 10px;"> <i class="fa-solid fa-house"></i> Home</a>
                                      </li>
                                      <li class="u-nav-item">
                                          <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="#" style="padding: 10px;"> <i class="fa-solid fa-file-lines"></i> Pages</a><div class="u-nav-popup">
                                              <ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-2">
                                                  <li class="u-nav-item">
                                                      <a class="u-button-style u-nav-link u-white" href="index.aspx#carousel_2104" data-page-id="2743630793"> <i class="fa-solid fa-phone"></i> Contact Us</a>
                                                  </li>
                                                  <li class="u-nav-item">
                                                      <a class="u-button-style u-nav-link u-white" href="index.aspx#carousel_c70b" data-page-id="2743630793"> <i class="fa-solid fa-bag-shopping"></i> Our Services</a>
                                                  </li>
                                                  <li class="u-nav-item">
                                                      <a class="u-button-style u-nav-link u-white" href="index.aspx#carousel_f5c7" data-page-id="2743630793"> <i class="fa-solid fa-user"></i> About</a>
                                                  </li>
                                              </ul>
                                          </div>
                                      </li>
                                      <li class="u-nav-item">
                                          <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" style="padding: 10px;" href="#"> <i class="fa-solid fa-gift"></i> Products</a><div class="u-nav-popup">
                                              <ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-3">
                                                  <li class="u-nav-item">
                                                      <a class="u-button-style u-nav-link u-white" href="ASP web application.aspx"> <i class="fa-solid fa-wifi"></i> ASP.NET Web App</a>
                                                  </li>
                                                  <li class="u-nav-item">
                                                      <a class="u-button-style u-nav-link u-white" href="Window application.aspx"> <i class="fa-solid fa-window-restore"></i> Windows application</a>
                                                  </li>
                                                  <li class="u-nav-item">
                                                      <a class="u-button-style u-nav-link u-white" href="Web development.aspx"> <i class="fa-brands fa-internet-explorer"></i> Web development</a>
                                                  </li>
                                                  <li class="u-nav-item">
                                                      <a class="u-button-style u-nav-link u-white" href="Web design.aspx"> <i class="fa-brands fa-firefox"></i> Web designing</a>
                                                  </li>
                                                  <li class="u-nav-item">
                                                      <a class="u-button-style u-nav-link u-white" href="Graphics design.aspx"> <i class="fa-solid fa-brush"></i> Graphics designing</a>
                                                  </li>
                                                  <li class="u-nav-item">
                                                      <a class="u-button-style u-nav-link u-white" href="Word processing.aspx"> <i class="fa-solid fa-book"></i> Desktop publishing</a>
                                                  </li>
                                              </ul>
                                          </div>
                                      </li>
                                      <li class="u-nav-item">
                                          <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="Privacy policy.aspx" style="padding: 10px;"> <i class="fa-solid fa-circle-info"></i> Privacy policy</a>
                                      </li>
                                      
                                      <asp:Panel ID="login" runat="server" CssClass="u-nav-item">
                                          <li class="u-nav-item">
                                            <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="Register.aspx" style="padding: 10px;"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
                                          </li>
                                      </asp:Panel>
                                      
                                      <asp:Panel ID="user" runat="server" CssClass="u-nav-item" Visible="false">
                                          <li class="u-nav-item">
                                            <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" style="padding: 10px;" id="name" runat="server"></a>
                                          </li>
                                      </asp:Panel>
                                      <li class="u-nav-item">
                                            <a id="cart" runat="server" style="float:right" class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="Register.aspx"><i class="fa-solid fa-cart-arrow-down"></i> Cart</a>
                                      </li>
                                  </ul>
                              </div>
                              <div class="u-custom-menu u-nav-container-collapse">
                                  <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                                      <div class="u-inner-container-layout u-sidenav-overflow">
                                          <div class="u-menu-close"></div>
                                          <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-4">
                                              <li class="u-nav-item">
                                                  <a class="u-button-style u-nav-link" href="index.html" style="padding: 10px;"> <i class="fa-solid fa-house"></i>  Home</a>
                                              </li>
                                              <li class="u-nav-item">
                                                  <a class="u-button-style u-nav-link" href="#" style="padding: 10px;"> <i class="fa-solid fa-file-lines"></i> Pages</a><div class="u-nav-popup">
                                                      <ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-5">
                                                          <li class="u-nav-item">
                                                              <a class="u-button-style u-nav-link" href="Our-Products.html#carousel_2104" data-page-id="2743630793"><i class="fa-solid fa-phone"></i> Contact Us</a>
                                                          </li>
                                                          <li class="u-nav-item">
                                                              <a class="u-button-style u-nav-link" href="Our-Products.html#carousel_c70b" data-page-id="2743630793"><i class="fa-solid fa-bag-shopping"></i>  Our Services</a>
                                                          </li>
                                                          <li class="u-nav-item">
                                                              <a class="u-button-style u-nav-link" href="Our-Products.html#carousel_f5c7" data-page-id="2743630793"> <i class="fa-solid fa-user"></i> About</a>
                                                          </li>
                                                      </ul>
                                                  </div>
                                              </li>
                                              <li class="u-nav-item">
                                                  <a class="u-button-style u-nav-link" style="padding: 10px;" href="#"><i class="fa-solid fa-gift"></i> Products</a><div class="u-nav-popup">
                                                      <ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-6">
                                                          <li class="u-nav-item">
                                                              <a class="u-button-style u-nav-link" href="ASP web application.aspx"> <i class="fa-solid fa-wifi"></i> ASP.NET Web App</a>
                                                          </li>
                                                          <li class="u-nav-item">
                                                              <a class="u-button-style u-nav-link" href="Window application.aspx"> <i class="fa-solid fa-window-restore"></i> Windows application</a>
                                                          </li>
                                                          <li class="u-nav-item">
                                                              <a class="u-button-style u-nav-link" href="Web development.aspx"> <i class="fa-brands fa-internet-explorer"></i> Web development</a>
                                                          </li>
                                                          <li class="u-nav-item">
                                                              <a class="u-button-style u-nav-link" href="Web design.aspx"> <i class="fa-brands fa-firefox"></i> Web designing</a>
                                                          </li>
                                                          <li class="u-nav-item">
                                                              <a class="u-button-style u-nav-link" href="Graphics design.aspx"> <i class="fa-solid fa-brush"></i> Graphics designing</a>
                                                          </li>
                                                          <li class="u-nav-item">
                                                              <a class="u-button-style u-nav-link" href="Word processing.aspx"><i class="fa-solid fa-book"></i>  Desktop publishing</a>
                                                          </li>
                                                      </ul>
                                                  </div>
                                              </li>
                                              <li class="u-nav-item">
                                                  <a class="u-button-style u-nav-link" href="Privacy policy.aspx" style="padding: 10px;"><i class="fa-solid fa-circle-info"></i> Privacy policy</a>
                                              </li>
                                              
                                              <asp:Panel ID="login2" runat="server" CssClass="u-nav-item">
                                                  <li class="u-nav-item">
                                                    <a class="u-button-style u-nav-link" href="Register.aspx" style="padding: 10px;"> <i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
                                                  </li>
                                              </asp:Panel>
                                      
                                              <asp:Panel ID="user2" runat="server" CssClass="u-nav-item" Visible="false">
                                                  <li class="u-nav-item">
                                                    <a class="u-button-style u-nav-link" style="padding: 10px;" id="name2" runat="server"></a>
                                                  </li>
                                              </asp:Panel>

                                              <li class="u-nav-item">
                                                  <a class="u-button-style u-nav-link" href="Cart.aspx" id="cart2" runat="server" style="padding: 10px;"><i class="fa-solid fa-cart-arrow-down"></i> Cart</a>
                                              </li>
                                          </ul>
                                      </div>
                                  </div>
                                  <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
                              </div>
                          </nav>
                      </div>
                  </header>

          <section style="display:flex; justify-content:center; align-content:center; background:url(images/32e1d1d559de737257f125559608f6f5.jpeg); background-repeat:no-repeat; background-size:cover;"> 
              <div class="modal-login animate" id="modal2">
                
                <div name="modal-form" id="login_form">
                    <h1 class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" >CHANGE YOUR PASSWORD HERE</h1>

                    <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" runat="server" id="context">Enter and confirm your password into their respective fields</p>

                    <label for="Username">
                        
                        <input type="password" id="password" runat="server" placeholder="Enter new password here" />
                    </label>
                    <br /><br />
                    <label for="Username">
                        
                        <input type="password" id="confirm" runat="server" placeholder="Confirm password here" />
                    </label>
                   
                       <div align="center"> 
                           <asp:Button ID="confirmation" runat="server" CssClass="u-btn" Text="Submit" OnClick="confirmation_Click"/>
                     </div>
                </div>

               </div>
    <!--My Modal ends-->
          </section>
          
          <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-0b4b">
                      <div class="u-clearfix u-sheet u-sheet-1">
                          <p class="u-small-text u-text u-text-variant u-text-1">Copyright &copy; 2021 GO IT store.</p>
                      </div>
                  </footer>
      </form>
      
    <span style="height: 64px; width: 64px; margin-left: 0px; margin-right: auto; margin-top: 0px; background-image: none; right: 20px; bottom: 20px" class="u-back-to-top u-icon u-icon-circle u-opacity u-opacity-85 u-palette-1-base u-spacing-15" data-href="#">
        <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 551.13 551.13"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1d98"></use></svg>
        <svg class="u-svg-content" enable-background="new 0 0 551.13 551.13" viewBox="0 0 551.13 551.13" xmlns="http://www.w3.org/2000/svg" id="svg-1d98"><path d="m275.565 189.451 223.897 223.897h51.668l-275.565-275.565-275.565 275.565h51.668z"></path></svg>
    </span>
  </body>
</html>
