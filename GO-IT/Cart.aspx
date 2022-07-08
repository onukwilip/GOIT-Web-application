<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="GO_IT.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="IT Services, ​Preparing For Your Success Provide Best IT Solutions., Development Services, About Us, Testimonials, Meet The Team, Contact Us">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Cart</title>
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
    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b9b88d2319.js" crossorigin="anonymous"></script>
    
    
    
    
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/ca3c956e1057b5ce2863c5f0a21c09e3.png"
}</script>
    <script type="text/javascript">
        function cancel()
        {
            document.getElementById("EditModal").style.display = "none";
            document.getElementById("overlay").style.display = "none";
        }

        function show()
        {
            document.getElementById("EditModal").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        }

        function mytry()
        {
            document.getElementById("show").innerHTML = document.getElementById("description").value;
        }

        function checkout()
        {
            window.location.replace = "~/Checkout.aspx";
        }

       tinymce.init({
            selector: '', width:'100%', height:'300px',
           /* plugins: [
              'a11ychecker', 'advlist', 'advcode', 'advtable', 'autolink', 'checklist', 'export',
              'lists', 'link', 'image', 'charmap', 'preview', 'anchor', 'searchreplace', 'visualblocks',
              'powerpaste', 'fullscreen', 'formatpainter', 'insertdatetime', 'media', 'table', 'help', 'wordcount'
            ],*/
            toolbar: 'undo redo | formatpainter casechange blocks | bold italic backcolor | ' +
              'alignleft aligncenter alignright alignjustify | ' +
              'bullist numlist checklist outdent indent | removeformat | a11ycheck code table help'
        }); 

    </script>
     
    <style>
         body{font-family:Montserrat;}

        .editmodal
        {
            position:fixed;
            padding:30px;
            box-sizing:border-box;
            background-color:white;
            width:500px;
            height:500px;
            z-index:3;
            border-radius:20px;
            left:50%;
            top:50%;
            transform:translate(-50%, -50%);
            overflow-y:auto;
        }
       
        .overlay{
            position:fixed;
            width:100%;
            height:100%;
            z-index:2;
            opacity:0.4;
            background-color:black;
            
        }

        .editmodal label
        {
            font-family:Montserrat;
            padding-bottom:10px;
            width:100%;
        }

        .editmodal input[type=text]
        {
            width:100%;
            height:40px;
            background:transparent;
            border:none;
            border-bottom:1px solid black;
            padding:10px;
        }

        .editmodal input[type=date]
        {
            width:100%;
            height:40px;
            background:transparent;
            border:none;
            border-bottom:1px solid black;
            padding:10px;
        }

        .editmodal input[type=submit]
        {
            text-align:center;
            border:none;
            border-radius:0px;
            background-color:cornflowerblue;
            color:white;
            padding:10px 30px;
        }

        input[type=number]
         {
            width:100px;
            height:auto;
            border:none;
            border-bottom:1px solid black;
        }   

        input[type=number]:focus{outline:none}

        .editmodal input[type=submit]:hover
        {
            background-color:Highlight;
        }

        .editmodal textarea
        {
            padding:10px;
            width:100%;
        }

        .cancel{float:right; font-size:30px; cursor:pointer; text-decoration:none;}

        .editmodal input:focus{outline:none;}

        .checkout
        {
            margin-top:60%;
            text-align:center;
            border:none;
            border-radius:0px;
            background-color:cornflowerblue;
            color:white;
            padding:10px 30px;
            width:100%;
        }

        .cart
        {
            width:70%; 
            display:inline-block; 
            background:transparent; 
            vertical-align:top; 
            padding:20px; 
            overflow-y:auto; 
            height:500px;
            font-family:Montserrat;
        }

        .cart-side
        {
            width:29%; 
            display:inline-block; 
            background:transparent; 
            height:500px; 
            box-shadow:1px 1px 5px black; 
            padding:20px;
        }

        .cart-items
        {
            width:100%; 
            box-shadow:1px 1px 5px black;
            padding:10px; 
            background-color:transparent; 
        }

        .cart-service
        {
            width:27%; 
            display:inline-block; 
            vertical-align:top; 
            background-color:transparent;
        }

        .cart-project
        {
            width:48%; 
            display:inline-block; 
            vertical-align:top; 
            background-color:transparent;
        }

        .cart-edit
        {
            width:8%; 
            display:inline-block; 
            vertical-align:top; 
            background-color:transparent;
        }

        @media only screen and (max-width:800px)
        {
            .editmodal
            {
                width:400px;
            }

            .cart{display:block; width:100%; overflow-y:hidden; height:auto;}

            .cart-side{display:block; width:100%; height:auto;}

            .checkout{margin:0px;}

            .cart-service{display:block; width:100%;}

            .cart-project{display:block; width:100%;}

            .cart-edit{display:block; width:100%;}
        }

        @media only screen and (max-width:1000px)
        {
            .editmodal
            {
                width:400px;
            }

            .cart{display:block; width:100%; overflow-y:hidden; height:auto;}

            .cart-side{display:block; width:100%; height:auto;}

            .checkout{margin:0px;}

            .cart-service{display:block; width:100%;}

            .cart-project{display:block; width:100%;}

            .cart-edit{display:block; width:100%;}
        }
    </style>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">
      <!--u-sticky u-sticky-1702 <!--<a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="#" style="padding: 10px;" runat="server"></a>  --> 
  </head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="overlay" CssClass="overlay" runat="server" Visible="false"></asp:Panel>
    <asp:Panel ID="EditModal" CssClass="editmodal" runat="server" Visible="false">
       <asp:LinkButton runat="server" CssClass="cancel" OnClick="cancel">&times;</asp:LinkButton>
        <div>
            <label>
                Order ID:<br />
                <input type="text" id="ID" placeholder="Project id..." readonly runat="server" />
            </label><br /><br />
            <label>
                Project Name:<br />
                <input type="text" id="projectName" placeholder="Project name..." runat="server" />
            </label><br /><br />
            <label>
                Date expected:<br />
                <input type="date" id="date" runat="server" />
            </label><br /><br />
            <label>
                Project Description:<br />
                <textarea id="description" rows="10" placeholder="Project description..." runat="server" ></textarea>
            </label><br /><br />
                
            <label>
                Project Features:<br />
                <textarea id="features" rows="10" placeholder="Project features..." runat="server" ></textarea>
            </label><br /><br />

            <div style="border-radius:10px; box-shadow:0px 0px 3px 1px black;">
                <asp:datalist id="extralist" runat="server" RepeatColumns="1" RepeatDirection="Vertical" style="width:100%;">
                    <HeaderTemplate>
                        <div class="container-fluid" style="padding:10px; font-size:25px;">
                            <div class="row">
                                <label class="col-xl-12">
                                    Extra functions
                                </label>
                            </div>
                            <div align="center"><hr /></div>
                        </div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="container-fluid" style="padding:0px 10px;">
                             <div class="row" style="padding:10px 0px; margin-top:-15px;">
                                <div style="width:70%">
                                    <asp:Label ID="funcName" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                                    <asp:Label ID="funcID" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:Label>
                                </div>
                                <div style="width:30%">
                                    <div style="float:right;">
                                        <asp:LinkButton runat="server" ID="funcsave" style="text-decoration:none" OnClick="funcsave_Click">Save</asp:LinkButton>&nbsp; <asp:LinkButton runat="server" OnClick="funcdelete_Click" ID="funcdelete"><img src="images/icons8-garbage-30.png" style="width:20px; height:20px;" /></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-12">
                                    <asp:TextBox TextMode="MultiLine" style="width:100%; height:120px;" runat="server" id="funcDescribe" Text='<%#Eval("Description")%>'></asp:TextBox>
                                    <asp:Label ID="error" runat="server" Visible="false" style="color:orangered; display:block;"></asp:Label>
                                </div>
                            </div>
                            <hr />
                        </div> 
                    </ItemTemplate>
                </asp:datalist>
            </div>
            <br />
            <div align="right"><asp:Button runat="server" Text="Save changes" OnClick="save" /> </div>
        </div>
    </asp:Panel>
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
                                            <a id="cart" runat="server" style="float:right" class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="Register.aspx"><i class="fa-solid fa-cart-arrow-down"></i> 
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
        <section style="width:100%;">
            <div class="cart">
                <h2 class="u-custom-font u-font-montserrat u-text u-text-default u-text-1"><img src="images/icons8-shopping-cart-promotion-20.png" style="width:30px; height:30px;" alt="">&nbsp;Cart</h2>
               
               <asp:Panel runat="server" ID="empty" Visible="false" CssClass="container-fluid">
                   <div class="row">
                       <div class="col-xl-12" style="display:flex; justify-content:center;">
                           <img src="images/empty-cart.png" style="width:30%; height:auto;" />
                       </div>
                       <div class="row">
                           <p class="col-xl-12" align="center">
                               Sorry you don't have any items in your cart!
                               <br />
                               <a href="index.aspx#carousel_c70b">Make an order now</a>
                           </p>
                       </div>
                   </div>
               </asp:Panel>
                <br />
                <asp:DataList ID="cartlist" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" Width="100%" style="background-color:transparent; border-radius:20px; box-shadow:0px 0px 7px 2px gray;" >
                    <ItemTemplate>
                        <div class="container-fluid">
                            <div class="row" style="background-color:transparent; padding:10px 0px; box-sizing:border-box;">
                                <div class="col-xl-2" style="background-color:transparent; height:auto;">
                                    <img src='<%#Eval("image")%>' style="width:100px; height:100px;" />
                                </div>
                                <div class="col-xl-4" style="background-color:transparent; height:auto; ">
                                    <asp:Label ID="servicename" runat="server" Text='<%#"<b>Service:</b> "+Eval("ServiceName")%>'></asp:Label><br /><br />
                                    <label>
                                        <b>Price:</b>
                                        <span>N</span> <asp:Label ID="price" runat="server" Text='<%#Eval("ServiceAmount")%>'></asp:Label>
                                    </label>
                                    <br /><br />
                                    <label style="display:none;">
                                        <asp:Label ID="id" runat="server" Text='<%#"<b>OrderID:</b> "+Eval("OrderID")%>'></asp:Label><br /><br />
                                    </label>
                                </div>
                                <div class="col-xl-3" style="background-color:transparent; height:auto; ">
                                    <asp:Label ID="pName" runat="server" Text='<%#"<b>Project:</b> "+Eval("ProjectName")%>'></asp:Label><br /><br />
                                    <label>
                                        <b>Quantity:</b>
                                        <asp:TextBox TextMode="Number" ID="qty" runat="server" min="1" Text='<%#Eval("Quantity") %>' OnTextChanged="qtychange"></asp:TextBox>
                                    </label><br /><br />
                                </div>
                                <div class="col-xl-2" style="background-color:transparent; height:auto;">
                                    <label>
                                        <b>Total:</b>
                                       <span>N</span> <asp:Label ID="Total" runat="server" Text='<%#Eval("TotalAmount") %>' />
                                    </label>
                                </div>
                                <div class="col-xl-1" style="background-color:transparent; height:auto;">
                                    <div style="float:right;">
                                        <asp:LinkButton runat="server" ID="edit" OnClick="edit_Click" OnClientClick="show()"><img src="images/icons8-edit-48.png" style="width:20px; height:20px;" /></asp:LinkButton>&nbsp; 
                                        <asp:LinkButton runat="server" ID="delete" OnClick="delete_Click"><img src="images/icons8-garbage-30.png" style="width:20px; height:20px;" /></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <hr />
                        </div>
                        
                    </ItemTemplate>
                    
                </asp:DataList> 
                <script type="text/javascript">
                    
                </script>
            </div>
            <div class="cart-side">
                <h3 class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Cart Total</h3>
                <hr />
                <h5 class="u-custom-font u-font-montserrat">Sub total: <em style="float:right;" id="subtotal" runat="server">200</em><em style="float:right;">N</em></h5>
                <hr />
                <h4 class="u-custom-font u-font-montserrat">Total: <em style="float:right;" id="allTotal" runat="server">200</em><em style="float:right;">N</em></h4>
                
              <a id="next" runat="server"><input type="button" class="checkout" value="Checkout" /></a><button style="display:none"></button>
                
            </div>
        </section>
        <br />
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
