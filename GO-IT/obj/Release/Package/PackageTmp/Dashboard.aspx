<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GO_IT.Dashboard" %>

<!DOCTYPE html>

<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="IT Services, ​Preparing For Your Success Provide Best IT Solutions., Development Services, About Us, Testimonials, Meet The Team, Contact Us">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Dashboard</title>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    
    
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/ca3c956e1057b5ce2863c5f0a21c09e3.png"
}</script>

      <script type="text/javascript">
          
          var dboard = new document.getElementById("dashboard");
          var order = new document.getElementById("orders");
          var closed = new document.getElementById("finish");
          var cancel = new document.getElementById("cancelled");
          var notifications = new document.getElementById("notifications");

          function MyDashboard()
          {
              document.getElementById("orders").style.display = "none";
              document.getElementById("dashboard").style.display = "block";
              document.getElementById("finish").style.display = "none";
              document.getElementById("cancelled").style.display = "none";
              document.getElementById("notifications").style.display = "none";
              document.getElementById("details").style.display = "none";
              document.getElementById("change").value = "dashboard";

              document.getElementById("revisions").style.display = "none";
              document.getElementById("transactions").style.display = "none";
          }

          function MyOrder()
          {
              document.getElementById("orders").style.display = "block";
              document.getElementById("dashboard").style.display = "none";
              document.getElementById("finish").style.display = "none";
              document.getElementById("cancelled").style.display = "none";
              document.getElementById("notifications").style.display = "none";
              document.getElementById("details").style.display = "none";
              document.getElementById("change").value = "order";

              document.getElementById("revisions").style.display = "none";
              document.getElementById("transactions").style.display = "none";
          }

          function MyClosed() {
             
              document.getElementById("orders").style.display = "none";
              document.getElementById("dashboard").style.display = "none";
              document.getElementById("finish").style.display = "block";
              document.getElementById("cancelled").style.display = "none";
              document.getElementById("notifications").style.display = "none";
              document.getElementById("details").style.display = "none";
              document.getElementById("change").value = "closed";

              document.getElementById("revisions").style.display = "none";
              document.getElementById("transactions").style.display = "none";
          }

          function MyCancel() {
             
              document.getElementById("orders").style.display = "none";
              document.getElementById("dashboard").style.display = "none";
              document.getElementById("finish").style.display = "none";
              document.getElementById("cancelled").style.display = "block";
              document.getElementById("notifications").style.display = "none";
              document.getElementById("details").style.display = "none";
              document.getElementById("change").value = "cancel";

              document.getElementById("revisions").style.display = "none";
              document.getElementById("transactions").style.display = "none";
          }

          function MyNotify() {
            
              document.getElementById("orders").style.display = "none";
              document.getElementById("dashboard").style.display = "none";
              document.getElementById("finish").style.display = "none";
              document.getElementById("cancelled").style.display = "none";
              document.getElementById("notifications").style.display = "block";
              document.getElementById("details").style.display = "none";
              document.getElementById("change").value = "notify";

              document.getElementById("revisions").style.display = "none";
              document.getElementById("transactions").style.display = "none";
          }

          function MyDetails() {

              document.getElementById("orders").style.display = "none";
              document.getElementById("dashboard").style.display = "none";
              document.getElementById("finish").style.display = "none";
              document.getElementById("cancelled").style.display = "none";
              document.getElementById("notifications").style.display = "none";
              document.getElementById("details").style.display = "block";
              document.getElementById("change").value = "details";

              document.getElementById("revisions").style.display = "none";
              document.getElementById("transactions").style.display = "none";

              document.getElementById("fname").value = document.getElementById("firstname").value;
              document.getElementById("lname").value = document.getElementById("lastname").value;
              document.getElementById("tel").value = document.getElementById("phone").value;
              document.getElementById("email2").value = document.getElementById("email").value;
          }

          function MyRevision()
          {
              document.getElementById("orders").style.display = "none";
              document.getElementById("dashboard").style.display = "none";
              document.getElementById("finish").style.display = "none";
              document.getElementById("cancelled").style.display = "none";
              document.getElementById("notifications").style.display = "none";
              document.getElementById("details").style.display = "none";
              document.getElementById("change").value = "revisions";

              document.getElementById("revisions").style.display = "block";
              document.getElementById("transactions").style.display = "none";
          }

          function MyTransaction()
          {
              document.getElementById("orders").style.display = "none";
              document.getElementById("dashboard").style.display = "none";
              document.getElementById("finish").style.display = "none";
              document.getElementById("cancelled").style.display = "none";
              document.getElementById("notifications").style.display = "none";
              document.getElementById("details").style.display = "none";
              document.getElementById("change").value = "transactions";

              document.getElementById("revisions").style.display = "none";
              document.getElementById("transactions").style.display = "block";
          }

          function readFile() {
              var reader = new FileReader();
              var file = document.getElementById('fileupload').files[0];

              reader.onload = function (e) {
                  document.getElementById('result').src = e.target.result;
              }

              reader.readAsDataURL(file);
          }

          function cancel()
          {
              document.getElementById("content").style.display = "none";
              document.getElementById("Modal").style.width = "0px";
              document.getElementById("Modal").style.boxShadow = "0px 0px 0px 0px";
              document.getElementById("overlay").style.opacity = "0";
              document.getElementById("overlay").style.display = "none";
          }

          function show() {
              document.getElementById("Modal").style.width = "250px";
              document.getElementById("Modal").style.boxShadow = "0px 0px 20px 2px";
              document.getElementById("content").style.display = "block";
              document.getElementById("overlay").style.opacity = "0.7";
              document.getElementById("overlay").style.display = "block";
          }

          function tab_order()
          {
              document.getElementById('order_tab').style.display = "block"
              document.getElementById('function_tab').style.display = "none";

              document.getElementById('a_order').style.borderBottom = "4px"; //a_function
              document.getElementById('a_order').style.borderBottomColor = "blue";
              document.getElementById('a_order').style.borderBottomStyle = "solid";

              document.getElementById('a_function').style.borderBottomStyle = "none";
          }

          function tab_function() {
              document.getElementById('order_tab').style.display = "none";
              document.getElementById('function_tab').style.display = "block";

              document.getElementById('a_function').style.borderBottom = "4px"; //a_function
              document.getElementById('a_function').style.borderBottomColor = "blue";
              document.getElementById('a_function').style.borderBottomStyle = "solid";

              document.getElementById('a_order').style.borderBottomStyle = "none";
          }

          function Tab(evt, tabname, linkname)
          {
              var i, tabcontent, tablinks;
              tabcontent = document.getElementsByName("tabcontent");
              for (i = 0; i < tabcontent.length; i++) {
                  tabcontent[i].style.display = "none";
              }

              tablinks = document.getElementsByName("tablinks");
              for (i = 0; i < tablinks.length; i++) {
                  //tablinks[i].className = tablinks[i].className.replace("active", "");
                  tablinks[i].style.borderBottom = "none";
              }

              document.getElementById(tabname).style.display = "block";
              //evt.currentTarget.className += " active";
              document.getElementById(linkname).style.borderBottom = "4px solid blue";
          }

          function Tab2(evt, tabname, linkname)
          {
              var i, tabcontent, tablinks;
              tabcontent = document.getElementsByName("tabcontent2");
              for (i = 0; i < tabcontent.length; i++) {
                  tabcontent[i].style.display = "none";
              }

              tablinks = document.getElementsByName("tablinks2");
              for (i = 0; i < tablinks.length; i++) {
                  //tablinks[i].className = tablinks[i].className.replace("active", "");
                  tablinks[i].style.borderBottom = "none";
              }

              document.getElementById(tabname).style.display = "block";
              //evt.currentTarget.className += " active";
              document.getElementById(linkname).style.borderBottom = "4px solid blue";
          }
      </script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">
      <!--u-sticky u-sticky-1702-->
      <style>

          /*Sidebar*/
          *{font-family:Montserrat; word-wrap:break-word; word-break:break-word}
          a{text-decoration:none;}
          label{width:100%; display:block}

          /*Contents*/

         /* input[type=search]
          {
              width:100%;
              /*height:40px;*
              background:transparent;
              border:none;
              border-bottom:1px solid black;
              padding:2px 10px;
              font-size:16px; 
          } */

          input[type=search]:focus
          {
              outline:none;
          }

          .body-section
          {
              display:flex; 
              justify-content:center; 
              align-content:center; 
              background:url(images/3c47732aa688823b96f857f8b37921b6.png); 
              background-repeat:no-repeat; 
              background-size:cover; 
              height:auto; 
              padding:20px;
          }

        .submenu
        {
            background-color:white; 
            /*padding:30px;*/ 
            height:650px; 
            top:10%; 
            border-radius:10px;
            box-shadow:1px 1px 2px 1px gray; 
            width:20%
        }

        .contain
        {
            width:75%;
            height:650px;
            background-color:white; 
           /* padding:30px; */
            top:10%; 
            border-radius:10px;
            box-shadow:1px 1px 2px 1px gray;  
            left:20px;
        }

        .submenu a
        {
            padding:16px 16px;
            background-color:transparent;
            display:block;
            top:0px;
        }

        .submenu a:hover
        {
            background-color:lightblue;
            color:white;
        }

        .contain div.sections
        {
            width:100%;
            height:100%;
            border-radius:10px;
            background-color:transparent;
            overflow-y:auto;
        }

        .i-edit
        {
            width:30px; 
            height:30px; 
            border-radius:50%; 
            margin-left:-20px;
            transition:0.5s;
            background-color:cornflowerblue;
            padding:5px;
            opacity:0.8;
        }

        .i-edit:hover
        {
            width:35px; 
            height:35px; 
        }

        .button
        {
            float:right;
            text-align:center;
            border:none;
            border-radius:0px;
            background-color:cornflowerblue;
            color:white;
            padding:10px 30px;
            cursor:pointer;
        }

        .button:hover
        {
            background-color:Highlight;
        }

        .edit
        {
            width:20px; 
            height:20px; 
            border-radius:100px;
            /*border:solid 1px black;*/
            position:absolute relative;
            transition-duration:0.5s;
        }

        .edit:hover
        {
            width:25px;
            height:25px;
            position:absolute;
            /*box-shadow:1px 1px 3px 2px black;*/
        }

        .contain .myprofile
        {
           width:49%; 
           height:auto; 
           background:white; 
           display:inline-block; 
           margin-top:20px; 
           box-shadow:-1px 1px 5px 1px black; 
           padding:10px;
        }

        .contain .profile-2
        {
            width:50%; 
            height:auto; 
            background:white; 
            display:inline-block; 
            margin-top:20px; 
            position:relative; 
            border:0px solid black; 
            float:right;
        }

        .show{display:none;}

        .details{display:none; max-width:35px; cursor:pointer;}

        .details div
        {
            width:25px;
            height:2px;
            background-color:white;
            margin:6px 0px;
        }

        .overlay
        {
            position:fixed;
            width:100%;
            height:100%;
            background-color:black;
            opacity:0;
            z-index:2;
            display:none;
            transition:0.5s;
        }

        .editmodal
        {
            position:fixed;
            z-index:3;
            width:0px;
            height:100%;
            background-color:white;
            transition:0.5s;
            box-shadow:0px 0px 0px 0px;
        }

        .content
        {
            display:none;
        }

        .editmodal a
        {
            padding:16px 16px;
            background-color:transparent;
            display:block;
            top:0px;
        }

        .editmodal a:hover
        {
            background-color:lightblue;
            color:white;
        }

        .cancel{float:right; display:block; font-size:20px; padding:20px;}

         .editmodal2
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
       
        .overlay2{
            position:fixed;
            width:100%;
            height:100%;
            z-index:2;
            opacity:0.4;
            background-color:black;
            
        }

        .editmodal2 label
        {
            font-family:Montserrat;
            padding-bottom:10px;
            width:100%;
        }

        .editmodal2 input[type=text]
        {
            width:100%;
            height:40px;
            background:transparent;
            border:none;
            border-bottom:1px solid black;
            padding:10px;
        }

        .editmodal2 .date
        {
            width:100%;
            height:40px;
            background:transparent;
            border:none;
            border-bottom:1px solid black;
            padding:10px;
        }

        .editmodal2 input[type=submit]
        {
            text-align:center;
            border:none;
            border-radius:0px;
            background-color:cornflowerblue;
            color:white;
            padding:10px 30px;
        }

        .editmodal2 input[type=submit]:hover
        {
            background-color:Highlight;
        }

        .editmodal2 textarea
        {
            padding:10px;
            width:100%;
        }

        .cancel2{float:right; font-size:30px; cursor:pointer; text-decoration:none; display:block}

        .editmodal2 input:focus{outline:none;}
        .error{color:orangered; display:block;}

        /*Delete modal*/

         .editmodal3
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
       
        .overlay3{
            position:fixed;
            width:100%;
            height:100%;
            z-index:2;
            opacity:0.4;
            background-color:black;
            
        }

        .editmodal3 label
        {
            font-family:Montserrat;
            padding-bottom:10px;
            width:100%;
        }

        .editmodal3 input[type=text], input[type=password]
        {
            width:100%;
            height:40px;
            background:transparent;
            border:none;
            border-bottom:1px solid black;
            padding:10px;
        }

        .editmodal3 input[type=date]
        {
            width:100%;
            height:40px;
            background:transparent;
            border:none;
            border-bottom:1px solid black;
            padding:10px;
        }

        .editmodal3 input[type=submit]
        {
            text-align:center;
            border:none;
            border-radius:0px;
            background-color:cornflowerblue;
            color:white;
            padding:10px 30px;
        }
        
        .editmodal3 input:focus{outline:none;}

        .tab-list
        {
           display:block;
           list-style:none;
           margin:0;
           padding:0;
           height:auto;
           box-sizing:border-box;
           background-color:transparent;
        }

        .tab-list li
        {
           padding:5px 7px;
           margin:0;
           background-color:transparent;
           display:inline-block;
           box-sizing:border-box;
           border:0px solid black;             
        }

        .tab-list li.tab-active{border-bottom:4px solid blue; }

        .tab-list-content
        {
            display:block;
            height:auto;
        }

        .tab-list-pane
        {
            display:none;
            border:1px solid gray;
            border-radius:5px;
            padding:10px;
            height:550px;
            overflow-y:auto;
            overflow-x:hidden;
            box-sizing:border-box;
        }

        .tab-list-active
        {
            display:block;
            border:1px solid gray;
            border-radius:5px;
            padding:10px;
            height:550px;
            overflow-y:auto;
            overflow-x:hidden;
            box-sizing:border-box;
        }

        .tab
        {
           display:block;
           list-style:none;
           margin:0;
           padding:0;
           height:auto;
           box-sizing:border-box;
           background-color:transparent;
        }

        .tab li
        {
           padding:5px 7px;
           margin:0;
           background-color:transparent;
           display:inline-block;
           box-sizing:border-box;
           border:0px solid black;   
        }

        .tab li.active
        {
           border-bottom:4px solid blue;
        }

        .tabcontent
        {
            display:none;
            border:1px solid gray;
            border-radius:5px;
            padding:10px;
            height:550px;
            overflow-y:auto;
            overflow-x:hidden;
            box-sizing:border-box;
        }
        
        .my-tab-content
        {
            display:block;
            height:auto;
        }

        .my-tab-content div.active
        {
            display:block;
        }
        
        .badge
        {
            background-color:cornflowerblue;
             z-index:3; 
             color:white; 
             padding:5px 5px; 
             font-size:12px; 
             border-radius:50%; 
             box-sizing:border-box;
        }
        
        .zip-contain
        {
            display:block; 
            border-radius:5px; 
            border:3px double black; 
            padding:10px; 
            background-color:beige; 
            width:65%; 
            box-shadow:0px 0px 5px 0px black;
            color:black; 
        }

        .zip-img
        {
            width:40px;
            height:auto;
        }

        @media only screen and (max-width: 1000px)
        {
            /* For tablets: */
            .modal-login
            {
                width: 70%;
            }

            .mybody
            {
                width:98%;
            }

            .submenu{display:none;}
            .contain{width:100%; margin-left:-20px;}
            .contain .myprofile{width:100%; display:block;}
            .contain .profile-2{width:100%; display:block;}
            .show{display:block;}
            .details{display:block;}
            .body-section{display:block; align-content:center; align-items:center}
            .editmodal2{width:400px;}
            .editmodal3{width:400px;}
        }

        @media only screen and (max-width: 620px)
        {
            /* For mobile phones: */
            
           .contain .myprofile{width:100%; display:block;}
           .contain .profile-2{width:100%; display:block;}
        }

      </style>
  </head>
  <body data-home-page="Dashboard.aspx" data-home-page-title="Dashboard" class="u-body u-xl-mode" id="body">
      <form id="form1" runat="server">
          <div id="overlay" class="overlay" onclick="cancel()" runat="server"></div>
            <div id="Modal" class="editmodal">
                <div class="content" id="content">
                    <span class="cancel" onclick="cancel()">&times;</span><br /><br />
                    <div>
                     <!-- <a name="dashboard" href="#dashboard" onclick="MyDashboard()">Dashboard</a>
                      <a name="orders" href="#orders" onclick="MyOrder()">Orders</a>
                      <a name="finish" href="#finish" onclick="MyClosed()">Finished Orders</a>
                      <a name="cancelled" href="#cancelled" onclick="MyCancel()">Cancelled orders</a>
                      <a name="Notifications" href="#notifications" onclick="MyNotify()">Notifications</a>
                      <a name="Details" href="#details" onclick="MyDetails()">User details</a>
                      <asp:LinkButton ID="LinkButton1" runat="server" OnClick="logout_Click">Logout</asp:LinkButton>
                   </div> -->
                        <a style="border-top-left-radius:10px; border-top-right-radius:10px;" name="dashboard" href="#dashboard" onclick="MyDashboard()">
                              Dashboard
                          </a>
                          <a name="orders" href="#orders" onclick="MyOrder()">
                              Orders <sup><asp:Label Visible="false" runat="server" ID="open_order_badge" class="cart-badge"></asp:Label></sup>
                          </a>
                          <a name="finish" href="#finish" onclick="MyClosed()">
                              Finished Orders <sup><asp:Label Visible="false" runat="server" ID="closed_order_badge" class="cart-badge"></asp:Label></sup>
                          </a>
                          <a name="cancelled" href="#cancelled" onclick="MyCancel()">
                              Cancelled orders <sup><asp:Label Visible="false" runat="server" ID="deleted_order_badge" class="cart-badge"></asp:Label></sup>
                          </a>
                          <a name="revisions" href="#revisions" onclick="MyRevision()">
                              Revisions <sup><asp:Label Visible="false" runat="server" ID="revision_badge" class="cart-badge"></asp:Label></sup>
                          </a>
                          <a name="transactions" href="#transactions" onclick="MyTransaction()">
                              Transactions <sup><asp:Label Visible="false" runat="server" ID="transaction_badge" class="cart-badge"></asp:Label></sup>
                          </a>
                          <a name="Notifications" href="#notifications" onclick="MyNotify()">
                              Notifications <sup><asp:Label Visible="false" runat="server" ID="notify_badge" class="cart-badge"></asp:Label></sup>
                          </a>
                          <a name="Details" href="#details" onclick="MyDetails()">
                              User details
                          </a>
                    </div>
                </div>
            </div>

          <!--Open Order Dialog-->

          <asp:Panel ID="overlay2" CssClass="overlay2" runat="server" Visible="false"></asp:Panel>
    <asp:Panel ID="EditModal" CssClass="editmodal2" runat="server" Visible="false">
       <asp:LinkButton runat="server" CssClass="cancel2" OnClick="cancel">&times;</asp:LinkButton><br /><br />
        <asp:Panel runat="server" Visible="true" style="padding:7px; color:darkgreen; background-color:rgba(182, 255, 0, .7); border:1px double darkgreen; border-radius:15px;" ID="warning">
           <li id="warnText" runat="server">N.B All changes made to this order will be recieved as revisions, which will have to be approved before being commited...</li>
        </asp:Panel><br />
        <div>
            <label>
                Order ID:<br />
                <input type="text" id="ID" placeholder="Project id..." readonly runat="server" />
            </label><br />
            <label>
                Project Name:<br />
                <input type="text" id="projectName" placeholder="Project name..." runat="server" />
                <asp:Label ID="errorName" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />
            <label>
                Date ordered:<br />
                <asp:TextBox TextMode="SingleLine" runat="server" ID="o_Date" Visible="true" ReadOnly="true"></asp:TextBox>
            </label><br />
            <label>
                Date expected:<br />
               <asp:TextBox TextMode="Date" ID="date" runat="server" CssClass="date"></asp:TextBox>
                <asp:Label ID="errorDate" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />
            <label>
                Project Description:<br />
                <textarea id="description" rows="10" placeholder="Project description..." runat="server" ></textarea>
                <asp:Label ID="errorDesc" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />
                
            <label>
                Project Features:<br />
                <textarea id="features" rows="10" placeholder="Project features..." runat="server" ></textarea>
                <asp:Label ID="errorFeature" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />

            <label>
                Attachment1: <asp:LinkButton ID="A1" runat="server" OnClick="A1_Click"></asp:LinkButton> <asp:FileUpload runat="server" ID="A1Upload" />
                <asp:Label ID="A1Error" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />

            <label>
                Attachment2: <asp:LinkButton ID="A2" runat="server" OnClick="A2_Click"></asp:LinkButton> <asp:FileUpload runat="server" ID="A2Upload" />
                <asp:Label ID="A2Error" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />

            <label>
                Attachment3: <asp:LinkButton ID="A3" runat="server" OnClick="A3_Click"></asp:LinkButton> <asp:FileUpload runat="server" ID="A3Upload" />
                <asp:Label ID="A3Error" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />

            <label>
                <asp:LinkButton ID="zipfile" runat="server" OnClick="zipfile_Click" CssClass="zip-contain">
                   <img src="images/285629_zip_file_icon.png" class="zip-img" /> Download project file...  
                </asp:LinkButton><br />
                Change existing project file (Items must be in .zip format only) <asp:FileUpload runat="server" ID="zipUpload" />
                <asp:Label ID="zipError" runat="server" Visible="false" CssClass="error"></asp:Label>
            </label><br />

            <div>
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
                                        <asp:LinkButton runat="server" ID="funcsave" style="text-decoration:none" OnClick="funcsave_Click" >Save</asp:LinkButton>&nbsp; 
                                        <asp:LinkButton runat="server" ID="funcdelete" OnClick="funcdelete_Click"><img src="images/icons8-garbage-30.png" style="width:20px; height:20px;" /></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-12">
                                    <asp:TextBox TextMode="MultiLine" style="width:100%; height:120px;" runat="server" id="funcDescribe" Text='<%#Eval("Description")%>'></asp:TextBox>
                                    <asp:Label ID="error" runat="server" Visible="false" style="color:orangered; display:block;"></asp:Label>
                                </div>
                                <asp:Label style="font-size:14px; color:blue" ID="funcWarn" runat="server"><li>Make sure you save every edited function, else it won't be saved as a revision. Do NOT delete any function unless needed because there will NOT be any refunds...</li></asp:Label>
                            </div>
                            <hr />
                        </div> 
                    </ItemTemplate>
                </asp:datalist>
            </div>
            <br />
            <div align="right"><asp:Button runat="server" Text="Save changes" ID="saveRevision" OnClick="saveRevision2" /> </div>
        </div>
    </asp:Panel>

          <!--Delete Dialog-->

    <asp:Panel ID="overlay3" CssClass="overlay3" runat="server" Visible="false"></asp:Panel>
    <asp:Panel ID="editmodal3" CssClass="editmodal3" runat="server" Visible="false">
       <asp:LinkButton runat="server" CssClass="cancel2" OnClick="cancel2">&times;</asp:LinkButton><br /><br />
        <div>
            <asp:Panel runat="server" Visible="true" style="padding:7px; color:darkgreen; background-color:rgba(182, 255, 0, .7); border:1px double darkgreen; border-radius:15px;">
              <li runat="server">Please verify your password before deleting this order, to confirm it is you</li>
            </asp:Panel><br />

            <label>
                Order ID:
                <asp:Label ID="DelID" runat="server"></asp:Label>
            </label><br />

            <div class="row">
                <label class="col-xl-12">
                    Please whats the reason for deleting this order
                    <asp:TextBox ID="reason" TextMode="MultiLine" style="width:100%; height:150px" runat="server"></asp:TextBox>
                </label>
                <asp:Label ID="errorReason" runat="server" Visible="false" CssClass="error"></asp:Label>
            </div>
            
            <div class="row">
                <label class="col-xl-12">
                    <input id="pword_del" type="password" runat="server" placeholder="Verify your password here!" />
                </label>
                <asp:Label ID="errorPword" runat="server" Visible="false" CssClass="error"></asp:Label>
            </div>
                        
            <br />
            <div align="right"><asp:Button runat="server" Text="Delete order" ID="confirm_delete" OnClick="confirm_delete_Click" /> </div>
        </div>
    </asp:Panel>
          <!--Finished view-->
    <asp:Panel ID="f_overlay" CssClass="overlay2" runat="server" Visible="false"></asp:Panel>
    <asp:Panel ID="f_viewModal" CssClass="editmodal2" runat="server" Visible="false" style="word-wrap:break-word;">
       <asp:LinkButton runat="server" CssClass="cancel2" OnClick="f_cancel">&times;</asp:LinkButton><br /><br />
        <div>
            <label>
                <b>Order ID:</b><br />
                <asp:Label ID="f_ID" runat="server" Visible="true"></asp:Label> 
            </label><br />
            <label>
                <b>Service Name:</b><br />
               <asp:Label ID="f_serviceName" runat="server" Visible="true"></asp:Label> 
            </label><br />
            <label>
                <b>Quantity Ordered:</b><br />
               <asp:Label ID="f_quantity" runat="server" Visible="true"></asp:Label> 
            </label><br />
            <label>
                <b>Total Amount:</b><br />
               <asp:Label ID="f_totalAmount" runat="server" Visible="true"></asp:Label> 
            </label><br />
            <label>
                <b>Project Name:</b><br />
               <asp:Label ID="f_ProjectName" runat="server" Visible="true"></asp:Label> 
            </label><br />
            <label>
                <b>Date Ordered:</b><br />
               <asp:Label ID="f_dateOrdered" runat="server" Visible="true"></asp:Label> 
            </label><br />
            <label>
                <b>Date expected:</b><br />
               <asp:Label ID="f_dateExpected" runat="server" Visible="true"></asp:Label> 
            </label><br />
            <label>
                <b id="delete_complete" runat="server">Date completed:</b><br />
               <asp:Label ID="f_dateCompleted" runat="server" Visible="true"></asp:Label> 
            </label><br />
            <label>
                <b>Project Description:</b><br />
                <asp:Label ID="f_description" runat="server" Visible="true"></asp:Label>
            </label><br />
                
            <label>
                <b>Project Features:</b><br />
                <asp:Label ID="f_features" runat="server" Visible="true"></asp:Label>
            </label><br />

            <label>
                <b>Attachment1:</b> <asp:LinkButton ID="f_A1" runat="server" OnClick="f_A1_Click"></asp:LinkButton>
            </label><br />

            <label>
                <b>Attachment2:</b> <asp:LinkButton ID="f_A2" runat="server" OnClick="f_A2_Click"></asp:LinkButton> 
            </label><br />

            <label>
                <b>Attachment3:</b> <asp:LinkButton ID="f_A3" runat="server" OnClick="f_A3_Click"></asp:LinkButton> 
            </label><br />

            <label>
                <asp:LinkButton ID="f_zipfile" runat="server" OnClick="f_zipfile_Click" CssClass="zip-contain">
                   <img src="images/285629_zip_file_icon.png" class="zip-img" /> Download project file...  
                </asp:LinkButton>
            </label><br />

            <div>
                <asp:datalist id="f_extralist" runat="server" RepeatColumns="1" RepeatDirection="Vertical" style="width:100%;">
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
                                <div style="width:100%">
                                    <b><asp:Label ID="funcName" runat="server" Text='<%#Eval("Name")%>'></asp:Label></b>
                                    <asp:Label ID="funcID" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-12">
                                    <asp:Label runat="server" id="funcDescribe" style="word-break:break-word;" Text='<%#Eval("Description")%>'></asp:Label>
                                </div>
                            </div>
                            <hr />
                        </div> 
                    </ItemTemplate>
                </asp:datalist>
            </div>
        </div>
    </asp:Panel>

          <!-- GENERAL DIALOG-->

    <asp:Panel ID="g_overlay" CssClass="overlay3" runat="server" Visible="false"></asp:Panel>
    <asp:Panel ID="g_editmodal" CssClass="editmodal3" runat="server" Visible="false">
       <asp:LinkButton runat="server" CssClass="cancel2" OnClick="cancel3">&times;</asp:LinkButton><br /><br />

        <!--Restore function-->

        <div runat="server" id="restore_container" style="display:none;">
            <asp:Panel runat="server" Visible="true" style="padding:7px; color:darkgreen; background-color:rgba(182, 255, 0, .7); border:1px double darkgreen; border-radius:15px;" ID="func_info">
              <li runat="server" id="func_exist">Please verify your password before restoring this function, to confirm it is you</li>
            </asp:Panel><br />

            <label>
                Function ID:
                <asp:Label ID="func_ID" runat="server"></asp:Label>
            </label><br />

            <label>
                Order ID:
                <asp:Label ID="func_order_ID" runat="server"></asp:Label>
            </label><br />

            <div class="row">
                <label class="col-xl-12">
                    Please whats the reason for restoring this function
                    <asp:TextBox ID="func_reason" TextMode="MultiLine" style="width:100%; height:150px" runat="server"></asp:TextBox>
                </label>
                <asp:Label ID="func_error_reason" runat="server" Visible="false" CssClass="error"></asp:Label>
            </div>
            
            <div class="row">
                <label class="col-xl-12">
                    <input id="func_pword" type="password" runat="server" placeholder="Verify your password here!" />
                </label>
                <asp:Label ID="func_error_pword" runat="server" Visible="false" CssClass="error"></asp:Label>
            </div>
                        
            <br />
            <div id="restore_bad" runat="server" style="border-radius:7px; color:white; background-color:orangered; border:1px solid red; display:none; padding:10px;">
                <li>Sorry, but this function cannot be restored because the order has either been completed or deleted...</li>
            </div>
            <div align="right" id="restore_good" runat="server" style="display:none;">
                <asp:Button runat="server" Text="Restore function" ID="confirm_func_restore" OnClick="confirm_func_restore_Click" /> 
            </div>
        </div>

        <!--Revision order(edit)-->

        <div id="revision_order_container" style="display:none;" runat="server">
            <div id="rev_o_success_contain" style="display:none" runat="server">
                <asp:Panel runat="server" Visible="false" style="padding:7px; color:darkgreen; background-color:rgba(182, 255, 0, .7); border:1px double darkgreen; border-radius:15px;" ID="rev_o_success">
                    <li runat="server" id="rev_o_successText">Revision updated successfully...</li>
                </asp:Panel><br />
            </div>
            
            <label>
                Order ID:<br />
                <input type="text" id="rev_o_ID" placeholder="Project id..." readonly runat="server" />
            </label><br />
            <label>
                Project Name:<br />
                <input type="text" id="rev_o_ProjectName" placeholder="Project name..." runat="server" />
                <asp:Label ID="rev_o_ProjectNameError" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />
            <label>
                Date ordered:<br />
                <asp:TextBox TextMode="SingleLine" runat="server" ID="rev_o_DateOrdered" Visible="true" readonly></asp:TextBox>
            </label><br />
            <label>
                Date expected:<br />
               <asp:TextBox TextMode="Date" ID="rev_o_DateExpected" runat="server" CssClass="date"></asp:TextBox>
                <asp:Label ID="rev_o_DateExpectedError" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />
            <label>
                Project Description:<br />
                <textarea id="rev_o_Description" style="width:100%" rows="10" placeholder="Project description..." runat="server" ></textarea>
                <asp:Label ID="rev_o_DescriptionError" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />
                
            <label>
                Project Features:<br />
                <textarea style="width:100%" id="rev_o_Features" rows="10" placeholder="Project features..." runat="server" ></textarea>
                <asp:Label ID="rev_o_FeaturesError" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />

            <label>
                Attachment1: <asp:LinkButton ID="rev_o_A1" runat="server" OnClick="rev_o_A1_Click"></asp:LinkButton> <asp:FileUpload runat="server" ID="rev_o_A1Upload" />
                <asp:Label ID="rev_o_A1Error" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />

            <label>
                Attachment2: <asp:LinkButton ID="rev_o_A2" runat="server" OnClick="rev_o_A2_Click"></asp:LinkButton> <asp:FileUpload runat="server" ID="rev_o_A2Upload" />
                <asp:Label ID="rev_o_A2Error" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />

            <label>
                Attachment3: <asp:LinkButton ID="rev_o_A3" runat="server" OnClick="rev_o_A3_Click"></asp:LinkButton> <asp:FileUpload runat="server" ID="rev_o_A3Upload" />
                <asp:Label ID="rev_o_A3Error" runat="server" Visible="false" CssClass="error"></asp:Label> 
            </label><br />

            <label>
                <asp:LinkButton ID="rev_o_zipfile" runat="server" OnClick="rev_o_zipfile_Click" CssClass="zip-contain">
                   <img src="images/285629_zip_file_icon.png" class="zip-img" /> Download project file...  
                </asp:LinkButton><br />
                Change existing project file (Items must be in .zip format only) <asp:FileUpload runat="server" ID="rev_o_zipUpload" />
                <asp:Label ID="rev_o_zipError" runat="server" Visible="false" CssClass="error"></asp:Label>
            </label><br />

            <div>
                <asp:datalist id="rev_o_ExtraFunctionlList" runat="server" RepeatColumns="1" RepeatDirection="Vertical" style="width:100%;">
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
                                        <asp:LinkButton runat="server" ID="rev_o_funcsave" style="text-decoration:none" OnClick="rev_o_funcsave_Click">Save</asp:LinkButton>&nbsp; 
                                        <asp:LinkButton runat="server" ID="rev_o_funcdelete" OnClick="rev_o_funcdelete_Click"><img src="images/icons8-garbage-30.png" style="width:20px; height:20px;" /></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-12">
                                    <asp:TextBox TextMode="MultiLine" style="width:100%; height:120px;" runat="server" id="funcDescribe" Text='<%#Eval("Description")%>'></asp:TextBox>
                                    <asp:Label ID="error" runat="server" Visible="false" style="color:orangered; display:block;"></asp:Label>
                                </div>
                                <asp:Label style="font-size:14px; color:blue" ID="funcWarn" runat="server"><li>Make sure you save every edited function, else it won't be updated as a revision. Do NOT delete any function unless needed because it can't be reversed...</li></asp:Label>
                            </div>
                            <hr />
                        </div> 
                    </ItemTemplate>
                </asp:datalist>
            </div>
            <br />
            <div align="right"><asp:Button runat="server" Text="Save changes" ID="rev_o_Save" OnClick="rev_o_Save_Click" /> </div>
        </div>

        <!--Revision order(delete)-->

        <div id="revision_delete_order_container" runat="server" style="display:none;">
            <asp:Panel runat="server" Visible="true" style="padding:7px; color:darkgreen; background-color:rgba(182, 255, 0, .7); border:1px double darkgreen; border-radius:15px;">
              <li runat="server">Please verify your password before deleting this revision, to confirm it is you</li>
            </asp:Panel><br />

            <label>
                Order ID:
                <asp:Label ID="rev_o_del_ID" runat="server"></asp:Label>
            </label><br />

            <div class="row">
                <label class="col-xl-12">
                    Please whats the reason for deleting this revision
                    <asp:TextBox ID="rev_o_del_reason" TextMode="MultiLine" style="width:100%; height:150px" runat="server"></asp:TextBox>
                </label>
                <asp:Label ID="rev_o_del_reasonError" runat="server" Visible="false" CssClass="error"></asp:Label>
            </div>
            
            <div class="row">
                <label class="col-xl-12">
                    <input id="rev_o_del_pword" type="password" runat="server" placeholder="Verify your password here!" />
                </label>
                <asp:Label ID="rev_o_del_pwordError" runat="server" Visible="false" CssClass="error"></asp:Label>
            </div>
                        
            <br />
            <div align="right"><asp:Button runat="server" Text="Delete order" ID="rev_o_del_ConfirmDelete" OnClick="rev_o_del_ConfirmDelete_Click" /> </div>
        </div>

        <!--Revision function(edit)-->

        <div id="rev_func_container" class="container-fluid" style="display:none" runat="server">
            <div id="rev_func_success_container" style="display:none" runat="server">
                <asp:Panel runat="server" Visible="false" style="padding:7px; color:darkgreen; background-color:rgba(182, 255, 0, .7); border:1px double darkgreen; border-radius:15px;" ID="rev_func_success">
                    <li runat="server" id="rev_func_successText">Function updated successfully...</li>
                </asp:Panel><br />
            </div>
            <label>
                <b>Function ID:</b>
                <asp:Label ID="rev_func_id" runat="server"></asp:Label>
            </label>
            <strong><asp:Label ID="rev_func_name" runat="server"></asp:Label></strong>
            <label>
                <textarea id="rev_func_describe" runat="server" style="width:100%" rows="10"></textarea>
            </label>
            <label>
                <asp:Label ID="rev_func_describe_error" Visible="false" CssClass="error" runat="server"></asp:Label>
            </label>
            <div align="right">
                <asp:Button ID="rev_func_save" runat="server" Text="Save changes..." OnClick="rev_func_save_Click" />
            </div>
        </div>

        <!--Revision function(delete)-->

        <div runat="server" id="rev_func_del_container" style="display:none;">
            <asp:Panel runat="server" Visible="true" style="padding:7px; color:darkgreen; background-color:rgba(182, 255, 0, .7); border:1px double darkgreen; border-radius:15px;" ID="rev_func_del_warn">
              <li runat="server" id="rev_func_del_warnText">Please verify your password before deleting this function, to confirm it is you</li>
            </asp:Panel><br />

            <label>
                Function ID:
                <asp:Label ID="rev_func_del_ID" runat="server"></asp:Label>
            </label><br />

            <div class="row">
                <label class="col-xl-12">
                    Please whats the reason for deleting this function
                    <asp:TextBox ID="rev_func_del_reason" TextMode="MultiLine" style="width:100%; height:150px" runat="server"></asp:TextBox>
                </label>
                <asp:Label ID="rev_func_del_reasonError" runat="server" Visible="false" CssClass="error" Text="*This field must not be lass than 20 characters..."></asp:Label>
            </div>
            
            <div class="row">
                <label class="col-xl-12">
                    <input id="rev_func_del_pword" type="password" runat="server" placeholder="Verify your password here!" />
                </label>
                <asp:Label ID="rev_func_del_pwordError" runat="server" Visible="false" CssClass="error" Text="*Password is incorrect"></asp:Label>
            </div>
            
            <div align="right">
                <asp:Button runat="server" Text="Delete function" ID="rev_func_confirmDelete" OnClick="rev_func_confirmDelete_Click" /> 
            </div>
        </div>
    </asp:Panel>
          <table width="100%">
              <tr>
                  <td>
                      <header class="u-clearfix u-header u-header" id="sec-a2c0" style="box-shadow:1px 1px 4px 1px black;">
                      <script src="https://apps.elfsight.com/p/platform.js" defer></script>
                      <div class="elfsight-app-6f4e400a-f035-4353-8590-8933c21c23d1"></div>
                      <div class="u-clearfix u-sheet u-sheet-1">
                          <a href="Index.aspx" class="u-image u-logo u-image-1" data-image-width="363" data-image-height="176">
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
                                          <a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-black u-text-hover-palette-2-base" href="Help.aspx" style="padding: 10px;"> <i class="fa-solid fa-circle-info"></i> Help</a>
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
                                                  <a class="u-button-style u-nav-link" href="Index.aspx" style="padding: 10px;"> <i class="fa-solid fa-house"></i>  Home</a>
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
                                                  <a class="u-button-style u-nav-link" href="Help.aspx" style="padding: 10px;"><i class="fa-solid fa-circle-info"></i> Help</a>
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
                  </td>
              </tr>
              <tr>
                  <td>
                      <input type="text" id="change" runat="server" style="display:none" />
                      <section class="body-section"> 
                          <div onclick="show()" class="details">
                              <div></div>
                              <div></div>
                              <div></div>
                          </div><br />
              <div class="submenu" id="submenu" runat="server">
                  <a style="border-top-left-radius:10px; border-top-right-radius:10px;" name="dashboard" href="#dashboard" onclick="MyDashboard()">
                      Dashboard
                  </a>
                  <a name="orders" href="#orders" onclick="MyOrder()">
                      Orders <sup><asp:Label Visible="false" runat="server" ID="new_order" class="cart-badge"></asp:Label></sup>
                  </a>
                  <a name="finish" href="#finish" onclick="MyClosed()">
                      Finished Orders <sup><asp:Label Visible="false" runat="server" ID="new_finish" class="cart-badge"></asp:Label></sup>
                  </a>
                  <a name="cancelled" href="#cancelled" onclick="MyCancel()">
                      Cancelled orders <sup><asp:Label Visible="false" runat="server" ID="new_cancel" class="cart-badge"></asp:Label></sup>
                  </a>
                  <a name="revisions" href="#revisions" onclick="MyRevision()">
                      Revisions <sup><asp:Label Visible="false" runat="server" ID="new_revision" class="cart-badge"></asp:Label></sup>
                  </a>
                  <a name="transactions" href="#transactions" onclick="MyTransaction()">
                      Transactions <sup><asp:Label Visible="false" runat="server" ID="new_transaction" class="cart-badge"></asp:Label></sup>
                  </a>
                  <a name="Notifications" href="#notifications" onclick="MyNotify()">
                      Notifications <sup><asp:Label Visible="false" runat="server" ID="new_notify" class="cart-badge"></asp:Label></sup>
                  </a>
                  <a name="Details" href="#details" onclick="MyDetails()">
                      User details
                  </a>
                  <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click">Logout</asp:LinkButton>
              </div>

              <!--Tab pages-->

              <div class="contain">

                  <!--Dashboard-->

                  <div id="dashboard" style="background:transparent; padding:20px; overflow-y:auto;" class="sections" runat="server">
                      <div style="height:150px; vertical-align:bottom" align="center">
                          <img src="images/05StudioSouthBrandIdentityProjectBrochureonBPOmin1.jpg" style="width:150px; height:150px; border-radius:100px;" alt="Image not found" id="profile" runat="server" />
                          <img src="images/icons8-edit-48.png" alt="Image not found" class="i-edit" onclick="MyDetails()" />
                     </div> 
                    
                      <div class=" myprofile" style="box-shadow:0px 0px 5px 1px black" runat="server" id="profile1" ><!--style="width:49%; height:auto; background:white; display:inline-block; margin-top:20px; box-shadow:-1px 1px 5px 1px black; padding:10px;">-->
                                      <p>USER DETAILS&nbsp;&nbsp;<img src="images/icons8-edit-48.png" alt="Image not found" onclick="MyDetails()" class="edit" /></p>
                                      <hr style="width:100%;" />
                                      <label for="firstname">
                                          Firstname:<br />
                                          <input type="text" id="firstname" placeholder="E.g John" style="height:40px; width:100%" runat="server" disabled />
                                      </label>
                                      <label for="lastname">
                                          Lastname:<br />
                                          <input type="text" id="lastname" placeholder="E.g Doe" style="height:40px; width:100%" runat="server" disabled />
                                      </label>
                                      <label for="phone">
                                          Phone:<br />
                                          <input type="tel" id="phone" placeholder="E.g 09071589571" style="height:40px; width:100%" runat="server" disabled />
                                      </label>
                                      <label for="email">
                                          Email:<br />
                                          <input type="email" id="email" placeholder="E.g someone@example.com" style="height:40px; width:100%" disabled runat="server" />
                                      </label><br /><br />
                               
                      </div>
                      
                      <div class=" profile-2" runat="server" id="profile2" ><!--style="width:50%; height:auto; background:white; display:inline-block; margin-top:20px; position:relative; border:0px solid black; float:right;">-->
                          <div style="width:100%; height:auto; background:white; box-shadow:-1px 1px 5px 1px black; padding:10px;">
                                <label>Change Password</label><hr />
                              
                              <table width="100%" border="0" style="border-spacing:0px;">
                                  <tr>
                                      <td>
                                          <label for="old">
                                          Old password:</label>
                                      </td>
                                      <td>
                                          <input type="password" id="old" placeholder="Enter old password here..." style="height:30px; width:100%;" runat="server" />
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <label for="new">
                                          New Password:</label>
                                      </td>
                                      <td>
                                           <input type="password" id="mynew" placeholder="Enter new password here..." style="height:30px; margin-top:5px; width:100%;" runat="server" />
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <label for="confirm">
                                          Confirm password:</label>
                                      </td>
                                      <td>
                                          <input type="password" id="confirm" placeholder="Confirm new password here..." style="height:30px; margin-top:5px; width:100%;" runat="server" />
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:LinkButton ID="forgot" runat="server" OnClick="forgot_Click">Forgot Password?</asp:LinkButton>
                                      </td>
                                      <td align="right">
                                          <asp:LinkButton ID="savepword" runat="server" OnClick="savepword_Click">Save Changes...</asp:LinkButton>
                                      </td>
                                  </tr>
                              </table>
                          </div>
                          <div style="width:100%; height:200px; background:white; margin-top:15px; box-shadow:-1px 1px 5px 1px black; padding:10px;">
                            <label>Report</label>
                              <hr />
                              <table border="0" width="100%">
                                  <tr>
                                      <td>
                                         <asp:Label Text="Total Open Orders" runat="server" />
                                      </td>
                                      <td>
                                         <asp:Label runat="server" ID="TotalOpen"/>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                         <asp:Label Text="Total Finished Orders" runat="server" />
                                      </td>
                                      <td>
                                         <asp:Label Text="0" runat="server" ID="TotalClosed"/>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:Label Text="Total Cancelled Orders" runat="server" />
                                      </td>
                                      <td>
                                          <asp:Label Text="0" runat="server" ID="TotalCancelled"/>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:Label Text="Total Amount Spent" runat="server" />
                                      </td>
                                      <td>
                                         <asp:Label Text="0" runat="server" ID="TotalAmount"/>
                                      </td>
                                  </tr>
                              </table>
                          </div>
                      </div>
                  </div>

                  <!--Open Orders-->

                  <div id="orders" style="display:none; background:transparent; padding:20px; overflow-y:auto;" runat="server" class="sections">
                      
                      <div style="font-family:Montserrat;" class="row">
                          <h5 style="font-family:Montserrat; background-color:transparent; padding-bottom:10px;" class="col-xl-4">
                              &nbsp;&nbsp;Total open orders: <em style="text-decoration:none; font-style:normal" id="Topen" runat="server"></em>
                          </h5>
                          
                          <div style="background-color:transparent; padding-bottom:10px;" class="col-xl-4">
                              <asp:TextBox TextMode="search" ID="search" placeholder="Search orders..." runat="server" OnTextChanged="o_searched" style="width:80%; height:40px;"></asp:TextBox> 
                              <asp:LinkButton ID="go" runat="server" OnClick="go_Click" ><img style="width:30px; height:auto;" src="images/icons8-search-512.png" alt="search" /></asp:LinkButton>
                              <asp:Button style="display:none" ID="no" runat="server"/>
                          </div>

                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                              <b>Search by:</b> 
                              <select name="searchby" id="o_searchby" runat="server" style="height:40px; width:50%;">
                                  <option value="orderid" runat="server">OrderID</option>
                                  <option value="servicename" runat="server">Service name</option>
                                  <option value="projectname" runat="server">Project name</option>
                              </select>
                          </div>      
                      </div>    
                      <hr />
                      <asp:Panel runat="server" ID="searchnull" >
                           <div align="center">
                              <img src="images/no-results.png" alt="image not found" style="width:200px; height:auto;" />
                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" id="searchtext" runat="server"></p>
                          </div>
                      </asp:Panel>
                      <asp:Panel runat="server" ID="ordernull">
                          <div align="center">
                              <img src="images/gift.png" alt="image not found" style="width:200px; height:auto;" />
                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Sorry you've not made any orders yet...</p>
                              <a href="index.aspx#carousel_c70b" target="_self"><input type="button" value="Make an order now!" class="u-btn" /></a>
                          </div>
                      </asp:Panel>
                      <asp:Panel Visible="true" runat="server" ID="orderyes">
                          <asp:DataList ID="orderlist" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" Width="100%" style="background-color:transparent;" >
                                <ItemTemplate>
                                    <div class="container-fluid">
                                        <div class="row" style="background-color:transparent; padding:10px 0px; box-sizing:border-box;">
                                            <div class="col-xl-2" style="background-color:transparent; height:auto;">
                                                <img src='<%#Eval("image")%>' style="width:100px; height:100px;" />
                                            </div>
                                            <div class="col-xl-4" style="background-color:transparent; height:auto; ">
                                                <asp:Label ID="servicename" runat="server" Text='<%#"<b>Service:</b> "+Eval("ServiceName")%>'></asp:Label><br /><br />
                                               
                                                <label>
                                                    <b>Features:</b>
                                                    <asp:Label ID="features" runat="server" Text='<%#Eval("Features").ToString().Length>20?Eval("Features").ToString().Substring(0,20) + "...":Eval("Features").ToString()%>' ></asp:Label>
                                                    <br /><br />
                                                </label>                                             

                                                <label style="display:none;">
                                                    <asp:Label ID="id" runat="server" Text='<%#"<b>OrderID:</b> "+Eval("OrderID")%>'></asp:Label><br /><br />
                                                </label>
                                            </div>
                                            <div class="col-xl-3" style="background-color:transparent; height:auto; ">
                                                <asp:Label ID="pName" runat="server" Text='<%#"<b>Project:</b> "+Eval("ProjectName")%>'></asp:Label><br /><br />
                                                <label>
                                                    <b>Description:</b>
                                                    <asp:Label ID="Description" runat="server" Text='<%#Eval("Description").ToString().Length>20?Eval("Description").ToString().Substring(0,20) + "...":Eval("Description").ToString()%>' ></asp:Label>
                                                    <br /><br />
                                                </label>
                                            </div>
                                            <div class="col-xl-2" style="background-color:transparent; height:auto;">
                                                <label>
                                                    <b>Quantity:</b>
                                                    <asp:Label ID="qty" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                                                </label><br />

                                                <label>
                                                    <b>Total:</b>
                                                   <span>N</span> <asp:Label ID="Total" runat="server" Text='<%#Eval("TotalAmount") %>' />
                                                </label>
                                            </div>
                                            <div class="col-xl-1" style="background-color:transparent; height:auto;">
                                                <div style="float:right;">
                                                    <asp:LinkButton ID="view" runat="server" OnClick="view_Click"><img style="width:20px; height:auto;" src="images/view.png" alt="view" /></asp:LinkButton>
                                                    <asp:LinkButton ID="delete" runat="server" OnClick="delete_Click"><img style="width:20px; height:auto;" src="images/icons8-garbage-30.png" alt="delete" /></asp:LinkButton>
                                                    <asp:Label CssClass="badge" Text="New" Visible='<%#Eval("Badge").ToString()=="New"?true:false%>' runat="server"></asp:Label> 
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                    </div>
                        
                                </ItemTemplate>      
                          </asp:DataList>
                      </asp:Panel>
                  </div>

                  <!--Finished Orders-->

                  <div id="finish" style="display:none; background:transparent; padding:20px;" runat="server" class="sections">
                      <div style="font-family:Montserrat;" class="row">
                          <h5 style="font-family:Montserrat; background-color:transparent; padding-bottom:7px" class="col-xl-4">
                            &nbsp; Total finished orders: <em style="text-decoration:none; font-style:normal" id="TFinished" runat="server"></em>
                          </h5>
                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                              <asp:TextBox TextMode="search" ID="f_search" placeholder="Search orders..." runat="server" OnTextChanged="f_searched" style="width:80%; height:40px"></asp:TextBox> 
                              <asp:LinkButton ID="f_go" runat="server" OnClick="f_go_Click"><img style="width:30px; height:auto;" src="images/icons8-search-512.png" alt="search" /></asp:LinkButton>
                          </div>
                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                              <b>Search by:</b> 
                              <select name="searchby" id="f_searchby" runat="server" style="height:40px; width:50%;">
                                  <option value="orderid" runat="server">OrderID</option>
                                  <option value="servicename" runat="server">Service name</option>
                                  <option value="projectname" runat="server">Project name</option>
                              </select>
                          </div>      
                      </div>    
                      <hr />
                      <asp:Panel runat="server" ID="f_searchnull" >
                           <div align="center">
                              <img src="images/no-results.png" alt="image not found" style="width:200px; height:auto;" />
                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" id="f_searchtext" runat="server"></p>
                          </div>
                      </asp:Panel>
                      <asp:Panel runat="server" ID="finishnull">
                          <div align="center" style="overflow-y:auto;">
                              <img src="images/gift.png" alt="image not found" style="width:200px; height:auto;" />
                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Sorry you've no completed orders yet...</p>
                              <a href="index.aspx#carousel_c70b" target="_self"><input type="button" value="Make an order now!" class="u-btn" /></a>
                          </div>
                      </asp:Panel>
                      <asp:Panel Visible="true" runat="server" ID="finishyes">
                          <asp:DataList ID="finishlist" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" Width="100%" style="background-color:transparent;" >
                                <ItemTemplate>
                                    <div class="container-fluid">
                                        <div class="row" style="background-color:transparent; padding:10px 0px; box-sizing:border-box;">
                                            <div class="col-xl-2" style="background-color:transparent; height:auto;">
                                                <img src='<%#Eval("image")%>' style="width:100px; height:100px;" />
                                            </div>
                                            <div class="col-xl-4" style="background-color:transparent; height:auto; ">
                                                <asp:Label ID="servicename" runat="server" Text='<%#"<b>Service:</b> "+Eval("ServiceName")%>'></asp:Label><br /><br />
                                               
                                                <label>
                                                    <b>Features:</b>
                                                    <asp:Label ID="features" runat="server" Text='<%#Eval("Features").ToString().Length>20?Eval("Features").ToString().Substring(0,20) + "...":Eval("Features").ToString()%>' ></asp:Label>
                                                    <br /><br />
                                                </label>                                             

                                                <label style="display:none;">
                                                    <asp:Label ID="id" runat="server" Text='<%#"<b>OrderID:</b> "+Eval("OrderID")%>'></asp:Label><br /><br />
                                                </label>
                                            </div>
                                            <div class="col-xl-3" style="background-color:transparent; height:auto; ">
                                                <asp:Label ID="pName" runat="server" Text='<%#"<b>Project:</b> "+Eval("ProjectName")%>'></asp:Label><br /><br />
                                                <label>
                                                    <b>Description:</b>
                                                    <asp:Label ID="Description" runat="server" Text='<%#Eval("Description").ToString().Length>20?Eval("Description").ToString().Substring(0,20) + "...":Eval("Description").ToString()%>' ></asp:Label>
                                                    <br /><br />
                                                </label>
                                            </div>
                                            <div class="col-xl-2" style="background-color:transparent; height:auto;">
                                                <label>
                                                    <b>Quantity:</b>
                                                    <asp:Label ID="qty" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                                                </label><br />

                                                <label>
                                                    <b>Total:</b>
                                                   <span>N</span> <asp:Label ID="Total" runat="server" Text='<%#Eval("TotalAmount") %>' />
                                                </label>
                                            </div>
                                            <div class="col-xl-1" style="background-color:transparent; height:auto;">
                                                <div style="float:right;">
                                                    <asp:LinkButton ID="view" runat="server" OnClick="finishedView"><img style="width:20px; height:auto;" src="images/view.png" alt="view" /></asp:LinkButton>
                                                    <asp:Label CssClass="badge" Text="New" Visible='<%#Eval("Badge").ToString()=="New"?true:false%>' runat="server"></asp:Label> 
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                    </div>
                        
                                </ItemTemplate>      
                          </asp:DataList>
                      </asp:Panel>
                  </div>

                  <!--Cancelled Orders-->

                  <div id="cancelled" style="display:none; background:transparent; padding:0px;" runat="server" class="sections">
                      <div class="container-fluid">
                              <ul id="myTab" class="tab-list">
                                  <li class="tab-active" id="a_order">
                                      <a href="#order_tab" onclick="tab_order()">
                                          Deleted orders
                                          <sup><asp:Label Visible="false" runat="server" ID="new_del_order" class="cart-badge"></asp:Label></sup>
                                       </a> 
                                      </li>
                                  <li id="a_function">
                                      <a href="#function_tab" onclick="tab_function()">
                                          Deleted functions
                                          <sup><asp:Label Visible="false" runat="server" ID="new_del_function" class="cart-badge"></asp:Label></sup>
                                      </a>
                                  </li>
                              </ul>
                              <div id="myTabContent" class="tab-list-content">

                                  <!--Deleted Order Tab-->

                                  <div id="order_tab" class="tab-list-active">
                                      <div style="font-family:Montserrat;" class="row">
                                          <h5 style="font-family:Montserrat; background-color:transparent; padding-bottom:7px" class="col-xl-4">
                                            &nbsp; Total cancelled orders: <em style="text-decoration:none; font-style:normal" id="TCanclled" runat="server"></em>
                                          </h5>
                                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                              <asp:TextBox TextMode="search" ID="c_search" placeholder="Search orders..." runat="server" style="width:80%; height:40px" OnTextChanged="c_search_TextChanged"></asp:TextBox> 
                                              <asp:LinkButton ID="c_go" runat="server" OnClick="c_go_Click"><img style="width:30px; height:auto;" src="images/icons8-search-512.png" alt="search" /></asp:LinkButton>
                                          </div>
                                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                              <b>Search by:</b> 
                                              <select name="searchby" id="c_searchby" runat="server" style="height:40px; width:50%;">
                                                  <option value="orderid" runat="server">OrderID</option>
                                                  <option value="servicename" runat="server">Service name</option>
                                                  <option value="projectname" runat="server">Project name</option>
                                              </select>
                                          </div>      
                                      </div>
                                      <hr />
                                      <asp:Panel runat="server" ID="c_searchnull" >
                                           <div align="center">
                                              <img src="images/no-results.png" alt="image not found" style="width:200px; height:auto;" />
                                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" id="c_searchtext" runat="server"></p>
                                          </div>
                                      </asp:Panel>
                                      <asp:Panel runat="server" ID="cancelnull">
                                          <div align="center">
                                              <img src="images/gift.png" alt="image not found" style="width:200px; height:auto;" />
                                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Sorry you've not cancelked any orders yet...</p>
                                              <a href="index.aspx#carousel_c70b" target="_self"><input type="button" value="Make an order now!" class="u-btn" /></a>
                                          </div>
                                      </asp:Panel>
                                      <asp:Panel runat="server" ID="cancelyes">
                                          <asp:DataList ID="cancelledlist" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" Width="100%" style="background-color:transparent;" >
                                                        <ItemTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row" style="background-color:transparent; padding:10px 0px; box-sizing:border-box;">
                                                                <div class="col-xl-2" style="background-color:transparent; height:auto;">
                                                                    <img src='<%#Eval("image")%>' style="width:100px; height:100px;" />
                                                                </div>
                                                                <div class="col-xl-4" style="background-color:transparent; height:auto; ">
                                                                    <asp:Label ID="servicename" runat="server" Text='<%#"<b>Service:</b> "+Eval("ServiceName")%>'></asp:Label><br /><br />
                                               
                                                                    <label>
                                                                        <b>Features:</b>
                                                                        <asp:Label ID="features" runat="server" Text='<%#Eval("Features").ToString().Length>20?Eval("Features").ToString().Substring(0,20) + "...":Eval("Features").ToString()%>' ></asp:Label>
                                                                        <br /><br />
                                                                    </label>                                             

                                                                    <label style="display:none;">
                                                                        <asp:Label ID="id" runat="server" Text='<%#"<b>OrderID:</b> "+Eval("OrderID")%>'></asp:Label><br /><br />
                                                                    </label>
                                                                </div>
                                                                <div class="col-xl-3" style="background-color:transparent; height:auto; ">
                                                                    <asp:Label ID="pName" runat="server" Text='<%#"<b>Project:</b> "+Eval("ProjectName")%>'></asp:Label><br /><br />
                                                                    <label>
                                                                        <b>Description:</b>
                                                                        <asp:Label ID="Description" runat="server" Text='<%#Eval("Description").ToString().Length>20?Eval("Description").ToString().Substring(0,20) + "...":Eval("Description").ToString()%>' ></asp:Label>
                                                                        <br /><br />
                                                                    </label>
                                                                </div>
                                                                <div class="col-xl-2" style="background-color:transparent; height:auto;">
                                                                    <label>
                                                                        <b>Quantity:</b>
                                                                        <asp:Label ID="qty" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                                                                    </label><br />

                                                                    <label>
                                                                        <b>Total:</b>
                                                                       <span>N</span> <asp:Label ID="Total" runat="server" Text='<%#Eval("TotalAmount") %>' />
                                                                    </label>
                                                                </div>
                                                                <div class="col-xl-1" style="background-color:transparent; height:auto;">
                                                                    <div style="float:right;">
                                                                        <asp:LinkButton ID="view" runat="server" OnClick="cancelview"><img style="width:20px; height:auto;" src="images/view.png" alt="view" /></asp:LinkButton>
                                                                        <asp:Label CssClass="badge" Text="New" Visible='<%#Eval("Badge").ToString()=="New"?true:false%>' runat="server"></asp:Label> 
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <hr />
                                                        </div>
                        
                                                </ItemTemplate>      
                                           </asp:DataList>     
                                      </asp:Panel>
                                  </div>

                                  <!--Deleted function tab-->

                                  <div id="function_tab" class="tab-list-pane">
                                     <div style="font-family:Montserrat;" class="row">
                                          <h5 style="font-family:Montserrat; background-color:transparent; padding-bottom:7px" class="col-xl-4">
                                            &nbsp; Total cancelled functions: <em style="text-decoration:none; font-style:normal" id="TCancelled2" runat="server"></em>
                                          </h5>
                                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                              <asp:TextBox TextMode="search" ID="c_search2" placeholder="Search functions..." runat="server" style="width:80%; height:40px" OnTextChanged="c_search2_TextChanged"></asp:TextBox> 
                                              <asp:LinkButton ID="c_go2" runat="server" OnClick="c_go2_Click"><img style="width:30px; height:auto;" src="images/icons8-search-512.png" alt="search" /></asp:LinkButton>
                                          </div>
                                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                              <b>Search by:</b> 
                                              <select name="searchby" id="c_searchby2" runat="server" style="height:40px; width:50%;">
                                                  <option value="orderid" runat="server">OrderID</option>
                                                  <option value="funcid" runat="server">FunctionID</option>
                                              </select>
                                          </div>      
                                      </div>
                                      <hr />
                                      <asp:Panel runat="server" ID="c_searchnull2" >
                                           <div align="center">
                                              <img src="images/no-results.png" alt="image not found" style="width:200px; height:auto;" />
                                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" id="c_searchtext2" runat="server"></p>
                                          </div>
                                      </asp:Panel>
                                      <asp:Panel runat="server" ID="cancelnull2">
                                          <div align="center">
                                              <img src="images/gift.png" alt="image not found" style="width:200px; height:auto;" />
                                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Sorry you've not cancelled any functions yet...</p>
                                              <a href="index.aspx#carousel_c70b" target="_self"><input type="button" value="Make an order now!" class="u-btn" /></a>
                                          </div>
                                      </asp:Panel>
                                      <asp:Panel runat="server" ID="cancelyes2">
                                          <asp:datalist id="cancelledlist2" runat="server" RepeatColumns="1" RepeatDirection="Vertical" style="width:100%;">
                                            <ItemTemplate>
                                                <div class="container-fluid" style="padding:0px 10px;">
                                                     <div class="row" style="padding:10px 0px; margin-top:-15px;">
                                                        <div style="width:90%">
                                                            <b><asp:Label ID="funcName" runat="server" Text='<%#Eval("Name")%>'></asp:Label></b>
                                                            <asp:Label ID="funcID" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:Label>
                                                        </div>
                                                         <div align="right" style="width:10%">
                                                             <asp:LinkButton runat="server" ID="restore_function" OnClick="restore_function_Click"><img src="images/view.png" style="width:20px; height:20px;" /></asp:LinkButton>
                                                             <asp:Label CssClass="badge" Text="New" Visible='<%#Eval("Badge").ToString()=="New"?true:false%>' runat="server"></asp:Label> 
                                                         </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xl-12">
                                                            <asp:Label runat="server" id="funcDescribe" style="word-break:break-word;" Text='<%#Eval("Description")%>'></asp:Label>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                </div> 
                                            </ItemTemplate>
                                        </asp:datalist>     
                                      </asp:Panel>
                                  </div>
                              </div>
                          </div>                    
                      
                  </div>

                  <!--Revisions-->

                  <div id="revisions" style="display:none; background:transparent; padding:0px; margin:0;" runat="server" class="sections">               
                      <div class="container-fluid">
                          <ul class="tab">
                              <li class="tablinks active" id="order_link" name="tablinks" onclick="Tab('event', 'rev_orders', 'order_link')">
                                  <a href="#rev_orders">
                                      Revision(Orders)
                                      <sup><asp:Label Visible="false" runat="server" ID="new_rev_order" class="cart-badge"></asp:Label></sup>
                                  </a>
                              </li>
                              <li class=" tablinks" id="func_link" name="tablinks" onclick="Tab('event', 'rev_functions', 'func_link')">
                                  <a href="#rev_functions">
                                      Revision(Functions)
                                      <sup><asp:Label Visible="false" runat="server" ID="new_rev_function" class="cart-badge"></asp:Label></sup>
                                  </a>
                              </li>
                          </ul>
                          <div class="my-tab-content">
                              <div class="tabcontent active" name="tabcontent" id="rev_orders">
                                  <!--Revision Head-->
                          <div style="font-family:Montserrat;" class="row">
                                              <h5 style="font-family:Montserrat; background-color:transparent; padding-bottom:7px" class="col-xl-4">
                                                &nbsp; Total revisions(orders): <asp:Label style="text-decoration:none; font-style:normal" ID="Trevisions1" runat="server"></asp:Label>
                                              </h5>
                                              <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                                  <asp:TextBox TextMode="search" ID="r_search1" placeholder="Search orders..." runat="server" style="width:80%; height:40px" OnTextChanged="r_search1_TextChanged"></asp:TextBox> 
                                                  <asp:LinkButton ID="r_go1" runat="server" OnClick="r_go1_Click"><img style="width:30px; height:auto;" src="images/icons8-search-512.png" alt="search" /></asp:LinkButton>
                                              </div>
                                              <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                                  <b>Search by:</b> 
                                                  <select name="searchby" id="r_searchby1" runat="server" style="height:40px; width:50%;">
                                                      <option value="orderid" runat="server">OrderID</option>
                                                      <option value="servicename" runat="server">Service name</option>
                                                      <option value="projectname" runat="server">Project name</option>
                                                  </select>
                                              </div>      
                                          </div>
                                          <hr />
                          <!--Revision Searchnull-->
                          <asp:Panel runat="server" ID="r_searchnull1" >
                                               <div align="center">
                                                  <img src="images/no-results.png" alt="image not found" style="width:200px; height:auto;" />
                                                  <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" id="r_searchtext1" runat="server"></p>
                                              </div>
                                          </asp:Panel>
                          <!--Revision empty-->
                          <asp:Panel runat="server" ID="revision_null">
                              <div align="center">
                                  <img src="images/gift.png" alt="image not found" style="width:200px; height:auto;" />
                                  <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Sorry you've no revisions...</p>
                                  <a href="index.aspx#carousel_c70b" target="_self"><input type="button" value="Make an order now!" class="u-btn" /></a>
                              </div>
                          </asp:Panel>
                          <!--Revision available-->
                          <asp:Panel Visible="true" runat="server" ID="revision_yes">
                              <asp:DataList ID="revisionOrderList" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" Width="100%" style="background-color:transparent;" >
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row" style="background-color:transparent; padding:10px 0px; box-sizing:border-box;">
                                                <div class="col-xl-2" style="background-color:transparent; height:auto;">
                                                    <img src='<%#Eval("image")%>' style="width:100px; height:100px;" />
                                                </div>
                                                <div class="col-xl-4" style="background-color:transparent; height:auto; ">
                                                    <asp:Label ID="servicename" runat="server" Text='<%#"<b>Service:</b> "+Eval("ServiceName")%>'></asp:Label><br /><br />
                                               
                                                    <label>
                                                        <b>Features:</b>
                                                        <asp:Label ID="features" runat="server" Text='<%#Eval("Features").ToString().Length>20?Eval("Features").ToString().Substring(0,20) + "...":Eval("Features").ToString()%>' ></asp:Label>
                                                        <br /><br />
                                                    </label>                                             

                                                    <label style="display:none;">
                                                        <asp:Label ID="id" runat="server" Text='<%#"<b>OrderID:</b> "+Eval("OrderID")%>'></asp:Label><br /><br />
                                                    </label>
                                                </div>
                                                <div class="col-xl-3" style="background-color:transparent; height:auto; ">
                                                    <asp:Label ID="pName" runat="server" Text='<%#"<b>Project:</b> "+Eval("ProjectName")%>'></asp:Label><br /><br />
                                                    <label>
                                                        <b>Description:</b>
                                                        <asp:Label ID="Description" runat="server" Text='<%#Eval("Description").ToString().Length>20?Eval("Description").ToString().Substring(0,20) + "...":Eval("Description").ToString()%>' ></asp:Label>
                                                        <br /><br />
                                                    </label>
                                                </div>
                                                <div class="col-xl-2" style="background-color:transparent; height:auto;">
                                                    <label>
                                                        <b>Quantity:</b>
                                                        <asp:Label ID="qty" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                                                    </label><br />

                                                    <label>
                                                        <b>Total:</b>
                                                       <span>N</span> <asp:Label ID="Total" runat="server" Text='<%#Eval("TotalAmount") %>' />
                                                    </label>
                                                </div>
                                                <div class="col-xl-1" style="background-color:transparent; height:auto;">
                                                    <div style="float:right;">
                                                        <asp:LinkButton ID="r_view1" runat="server" OnClick="r_view1_Click"><img style="width:20px; height:auto;" src="images/view.png" alt="view" /></asp:LinkButton>
                                                        <asp:LinkButton ID="r_delete1" runat="server" OnClick="r_delete1_Click"><img style="width:20px; height:auto;" src="images/icons8-garbage-30.png" alt="delete" /></asp:LinkButton>
                                                        <asp:Label CssClass="badge" Text="New" Visible='<%#Eval("Badge").ToString()=="New"?true:false%>' runat="server"></asp:Label> 
                                                    </div>
                                                </div>
                                            </div>
                                            <hr />
                                        </div>
                        
                                    </ItemTemplate>      
                              </asp:DataList>
                          </asp:Panel>
                              </div>
                              <!--Revision Functions-->
                              <div class="tabcontent" id="rev_functions" name="tabcontent">
                                  <!--Revision Functions Head-->
                                  <div style="font-family:Montserrat;" class="row">
                                          <h5 style="font-family:Montserrat; background-color:transparent; padding-bottom:7px" class="col-xl-4">
                                            &nbsp; Total revisions(functions): <asp:Label style="text-decoration:none; font-style:normal" ID="Trevisions2" runat="server"></asp:Label>
                                          </h5>
                                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                              <asp:TextBox TextMode="search" ID="r_search2" placeholder="Search functions..." runat="server" style="width:80%; height:40px" OnTextChanged="r_search2_TextChanged"></asp:TextBox> 
                                              <asp:LinkButton ID="r_go2" runat="server" OnClick="r_go2_Click"><img style="width:30px; height:auto;" src="images/icons8-search-512.png" alt="search" /></asp:LinkButton>
                                          </div>
                                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                              <b>Search by:</b> 
                                              <select name="searchby" id="r_searchby2" runat="server" style="height:40px; width:50%;">
                                                  <option value="orderid" runat="server">OrderID</option>
                                                  <option value="funcid" runat="server">FunctionID</option>
                                              </select>
                                          </div>      
                                      </div>
                                      <hr />
                                  <!--Revision Functions searchnull-->
                                      <asp:Panel runat="server" ID="r_searchnull2" >
                                           <div align="center">
                                              <img src="images/no-results.png" alt="image not found" style="width:200px; height:auto;" />
                                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" id="r_searchtext2" runat="server"></p>
                                          </div>
                                      </asp:Panel>
                                  <!--Revision Functions empty-->
                                      <asp:Panel runat="server" ID="revision_null2">
                                          <div align="center">
                                              <img src="images/gift.png" alt="image not found" style="width:200px; height:auto;" />
                                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Sorry you've not cancelled any functions yet...</p>
                                              <a href="index.aspx#carousel_c70b" target="_self"><input type="button" value="Make an order now!" class="u-btn" /></a>
                                          </div>
                                      </asp:Panel>
                                  <!--Revision Functions available-->
                                      <asp:Panel runat="server" ID="revision_yes2">
                                          <asp:datalist id="revisionFunctionList" runat="server" RepeatColumns="1" RepeatDirection="Vertical" style="width:100%;">
                                            <ItemTemplate>
                                                <div class="container-fluid" style="padding:0px 10px;">
                                                     <div class="row" style="padding:10px 0px; margin-top:-15px;">
                                                        <div style="width:90%">
                                                            <b><asp:Label ID="funcName" runat="server" Text='<%#Eval("Name")%>'></asp:Label></b>
                                                            <asp:Label ID="funcID" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:Label>
                                                        </div>
                                                         <div align="right" style="width:10%">
                                                             <asp:LinkButton runat="server" ID="rev_func_edit" OnClick="rev_func_edit_Click"><img src="images/view.png" style="width:20px; height:20px;" /></asp:LinkButton>
                                                             <asp:LinkButton runat="server" ID="rev_func_delete" OnClick="rev_func_delete_Click"><img src="images/icons8-garbage-30.png" style="width:20px; height:20px;" /></asp:LinkButton>
                                                             <asp:Label CssClass="badge" Text="New" Visible='<%#Eval("Badge").ToString()=="New"?true:false%>' runat="server"></asp:Label> 
                                                         </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xl-12">
                                                            <asp:Label runat="server" id="funcDescribe" style="word-break:break-word;" Text='<%#Eval("Description")%>'></asp:Label>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                </div> 
                                            </ItemTemplate>
                                        </asp:datalist>     
                                      </asp:Panel>
                              </div>
                          </div>
                      </div>
                  </div>
                                    
                  <!--Transactions-->

                  <div id="transactions" style="display:none; background:transparent; padding:0px; margin:0;" runat="server" class="sections">
                      <div class="container-fluid">
                          <ul class="tab">
                              <li class="tablinks active" name="tablinks2" id="transacton_link" onclick="Tab2('event', 'transactions_tab', 'transacton_link')">
                                  <a href="#transactions_tab">
                                      Transactions
                                      <sup><asp:Label Visible="false" runat="server" ID="new_transactions2" class="cart-badge"></asp:Label></sup>
                                  </a>
                              </li>
                              <li class="tablinks" id="refunds_link" name="tablinks2" onclick="Tab2('event', 'refunds_tab', 'refunds_link')">
                                  <a href="#refunds_tab">
                                      Pending refunds
                                      <sup><asp:Label Visible="false" runat="server" ID="new_refunds" class="cart-badge"></asp:Label></sup>
                                  </a>
                              </li>
                          </ul>
                          <div class="my-tab-content">
                              <!--Transactions tab-->
                              <div class="tabcontent active" name="tabcontent2" id="transactions_tab">
                                   <!--Transactions head-->
                                   <div style="font-family:Montserrat;" class="row">
                                          <h5 style="font-family:Montserrat; background-color:transparent; padding-bottom:7px" class="col-xl-4">
                                            &nbsp; Total transactions: <asp:Label style="text-decoration:none; font-style:normal" ID="Ttransactions" runat="server"></asp:Label>
                                          </h5>
                                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                              <asp:TextBox TextMode="search" ID="t_search" placeholder="Search transactions..." OnTextChanged="t_search_TextChanged" runat="server" style="width:80%; height:40px"></asp:TextBox> 
                                              <asp:LinkButton ID="t_go" runat="server" OnClick="t_go_Click"><img style="width:30px; height:auto;" src="images/icons8-search-512.png" alt="search" /></asp:LinkButton>
                                          </div>
                                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                              <b>Search by:</b> 
                                              <select name="searchby" id="t_searchby" runat="server" style="height:40px; width:50%;">
                                                  <option value="transactionID" runat="server">Transaction ID</option>
                                                  <option value="orderid" runat="server">OrderID</option>
                                              </select>
                                          </div>      
                                      </div>
                                      <hr />
                                   <!--Transactions searchnull-->
                                  <asp:Panel runat="server" ID="t_searchnull" >
                                           <div align="center">
                                              <img src="images/no-results.png" alt="image not found" style="width:200px; height:auto;" />
                                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" id="t_searchnulltext" runat="server"></p>
                                          </div>
                                      </asp:Panel>
                                  <!--Transactions null-->
                                  <asp:Panel runat="server" ID="transaction_null">
                                      <div align="center">
                                          <img src="images/gift.png" alt="image not found" style="width:200px; height:auto;" />
                                          <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Sorry you've not made any transactions yet...</p>
                                          <a href="index.aspx#carousel_c70b" target="_self"><input type="button" value="Make an order now!" class="u-btn" /></a>
                                      </div>
                                  </asp:Panel>
                                  <!--Transactions available-->
                                  <asp:Panel Visible="true" runat="server" ID="transaction_yes">
                                      <asp:DataList ID="transactionsList" RepeatDirection="Vertical" RepeatColumns="1" runat="server" style="width:100%; background-color:transparent">
                                          <ItemTemplate>
                                              <div class="container-fluid" style="width:100%;">
                                                  <div class="row" style="padding:10px 0px; background-color:transparent; width:100%;">
                                                  <div class="col-xl-3" style="background-color:transparent">
                                                      <label>
                                                          <b>Transaction ID:</b>
                                                          <asp:Label ID="id" runat="server" Text='<%#Eval("TransactionID")%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                      <label>
                                                          <b>Total Amount </b>
                                                          <asp:Label ID="totalAmt" runat="server" Text='<%#Eval("TotalAmount")%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                  </div>
                                                  <div class="col-xl-3" style="background-color:transparent">
                                                      <label>
                                                          <b>Amount Paid:</b>
                                                          <asp:Label ID="amtPaid" runat="server" Text='<%#Eval("AmountPaid")%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                      <label>
                                                          <b>Amount Remain:</b>
                                                          <asp:Label ID="amtRemain" runat="server" Text='<%#Eval("AmountRemain")%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                  </div>
                                                  <div class="col-xl-3" style="background-color:transparent">
                                                      <label>
                                                          <b>Date Paid:</b>
                                                          <asp:Label ID="datePaid" runat="server" Text='<%#Eval("DatePaid").ToString()%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                      <label>
                                                          <b>Description:</b>
                                                          <asp:Label ID="description" runat="server" Text='<%#Eval("Description").ToString()==""||Eval("Description").ToString()==null?"Null":Eval("Description")%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                  </div>
                                                  <div class="col-xl-2" style="background-color:transparent">
                                                      <label>
                                                          <b>OrderID:</b>
                                                          <asp:Label ID="Label1" runat="server" Text='<%#Eval("OrderID")%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                  </div>
                                                  <div class="col-xl-1">
                                                      <asp:LinkButton runat="server" OnClick="transactions_view"><img src="images/view.png" style="width:20px; height:20px;" /></asp:LinkButton>
                                                      <asp:Label CssClass="badge" Text="New" Visible='<%#Eval("Badge").ToString()=="New"?true:false%>' runat="server"></asp:Label> 
                                                  </div>
                                              </div>
                                              </div>
                                              <hr />
                                          </ItemTemplate>
                                      </asp:DataList>
                                  </asp:Panel>
                              </div>
                              <!--Refunds tab-->
                              <div class="tabcontent" name="tabcontent2" id="refunds_tab">
                                  <!--Refunds head-->
                                   <div style="font-family:Montserrat;" class="row">
                                          <h5 style="font-family:Montserrat; background-color:transparent; padding-bottom:7px" class="col-xl-4">
                                            &nbsp; Total refunds: <asp:Label style="text-decoration:none; font-style:normal" ID="Trefunds" runat="server"></asp:Label>
                                          </h5>
                                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                              <asp:TextBox TextMode="search" ID="refunds_search" OnTextChanged="refunds_search_TextChanged" placeholder="Search refunds..." runat="server" style="width:80%; height:40px"></asp:TextBox> 
                                              <asp:LinkButton ID="refunds_go" runat="server" OnClick="refunds_go_Click"><img style="width:30px; height:auto;" src="images/icons8-search-512.png" alt="search" /></asp:LinkButton>
                                          </div>
                                          <div style="background-color:transparent; padding-bottom:10px" class="col-xl-4">
                                              <b>Search by:</b> 
                                              <select name="searchby" id="refunds_searchby" runat="server" style="height:40px; width:50%;">
                                                  <option value="refundID" runat="server">Refund ID</option>
                                                  <option value="orderid" runat="server">OrderID</option>
                                              </select>
                                          </div>      
                                      </div>
                                      <hr />
                                   <!--Refunds searchnull-->
                                  <asp:Panel runat="server" ID="refunds_searchnull" >
                                           <div align="center">
                                              <img src="images/no-results.png" alt="image not found" style="width:200px; height:auto;" />
                                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1" id="refunds_searchnullText" runat="server"></p>
                                          </div>
                                      </asp:Panel>
                                  <!--Refunds null-->
                                  <asp:Panel runat="server" ID="refunds_null">
                                      <div align="center">
                                          <img src="images/gift.png" alt="image not found" style="width:200px; height:auto;" />
                                          <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Sorry you've not made any transactions yet...</p>
                                          <a href="index.aspx#carousel_c70b" target="_self"><input type="button" value="Make an order now!" class="u-btn" /></a>
                                      </div>
                                  </asp:Panel>
                                  <!--Refunds available-->
                                  <asp:Panel Visible="true" runat="server" ID="refunds_yes">
                                      <asp:DataList ID="refundsList" RepeatDirection="Vertical" RepeatColumns="1" runat="server" style="width:100%; background-color:transparent">
                                          <ItemTemplate>
                                              <div class="container-fluid" style="width:100%;">
                                                  <div class="row" style="padding:10px 0px; background-color:transparent; width:100%;">
                                                  <div class="col-xl-3" style="background-color:transparent">
                                                      <label>
                                                          <b>Refund ID:</b>
                                                          <asp:Label ID="id" runat="server" Text='<%#Eval("ID")%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                  </div>
                                                  <div class="col-xl-3" style="background-color:transparent">
                                                      <label>
                                                          <b>Amount:</b>
                                                          <asp:Label ID="amount" runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                  </div>
                                                  <div class="col-xl-3" style="background-color:transparent">
                                                      <label>
                                                          <b>Date requested:</b>
                                                          <asp:Label ID="datePaid" runat="server" Text='<%#Eval("DateRequested")%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                  </div>
                                                  <div class="col-xl-2" style="background-color:transparent">
                                                      <label>
                                                          <b>OrderID:</b>
                                                          <asp:Label ID="Label1" runat="server" Text='<%#Eval("OrderID")%>'></asp:Label>
                                                      </label>
                                                      <br />
                                                  </div>
                                                  <div class="col-xl-1">
                                                      <asp:LinkButton runat="server" OnClick="refunds_view"><img src="images/view.png" style="width:20px; height:20px;" /></asp:LinkButton>
                                                      <asp:Label CssClass="badge" Text="New" Visible='<%#Eval("Badge").ToString()=="New"?true:false%>' runat="server"></asp:Label> 
                                                  </div>
                                              </div>
                                              </div>
                                              <hr />
                                          </ItemTemplate>
                                      </asp:DataList>
                                  </asp:Panel>
                              </div>
                          </div>
                      </div>
                  </div>

                  <!--Notifications-->

                  <div id="notifications" style="display:none; background:transparent; padding:20px;" runat="server" class="sections">
                      <!--Notifications head-->
                      <div class="row">
                          <h3 class="col-xl" style="font-family:Montserrat; padding-left:5px;">Notifications</h3>
                      </div>
                      <hr />
                      <!--Notifications searchnull-->
                      <asp:Panel ID="n_searchnull" runat="server" Visible="false"><asp:Label ID="Tnotify" runat="server" Visible="false"></asp:Label></asp:Panel>
                      <!--Notifications null-->
                      <asp:Panel runat="server" ID="notifications_null">
                          <div align="center">
                              <img src="images/gift.png" alt="image not found" style="width:200px; height:auto;" />
                              <p class="u-custom-font u-font-montserrat u-text u-text-default u-text-1">Sorry you have no notifications...</p>
                          </div>
                      </asp:Panel>
                      <!--Notifications available-->
                      <asp:Panel Visible="true" runat="server" ID="notifications_yes">
                          <asp:DataList ID="notificationsList" RepeatColumns="1" RepeatDirection="Vertical" style="width:100%" runat="server">
                              <ItemTemplate>
                                  <div class="container-fluid" style="padding:10px 0px;">
                                      <div class="row">
                                          <div class="col-xl">
                                                <div style="display:inline-block; width:45%">
                                                    <b><asp:Label ID="Topic" runat="server" Text='<%#Eval("Topic")%>'></asp:Label></b> <asp:Label ID="id" runat="server" Visible="false" Text='<%#Eval("ID")%>'></asp:Label>
                                                </div>
                                                <div style="display:inline-block; width:50%" align="right">
                                                    <asp:Label ID="Date" runat="server" Text='<%#Eval("DateSent")%>'></asp:Label>&nbsp;
                                                    <asp:LinkButton runat="server" OnClick="notify_view"><img src="images/view.png" style="width:20px; height:20px;" /></asp:LinkButton>
                                                    <asp:Label style="background-color:cornflowerblue; z-index:3; color:white; padding:5px 5px; font-size:12px; border-radius:50%; box-sizing:border-box;" Text="New" Visible='<%#Eval("Badge").ToString()=="New"?true:false%>' runat="server"></asp:Label> 
                                                </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-xl">
                                              <asp:Label ID="Message" style="word-break:break-word;" runat="server" Text='<%#Eval("Message")%>'></asp:Label>
                                          </div>
                                      </div>
                                  </div>
                                  <hr />
                              </ItemTemplate>
                          </asp:DataList>
                      </asp:Panel>
                  </div>

                  <!--User Details-->

                  <div id="details" style="display:none; background:transparent; padding:0px;" runat="server" class="sections">
                      <div style="width:100%; height:inherit; background:white; display:inline-block; margin-top:0px; box-shadow:-1px 1px 5px 1px black; padding:10px;">
                                      <p>EDIT DETAILS</p>
                                      <hr style="width:100%;" />
                          <div style="height:auto; vertical-align:bottom" align="center">
                               <img src="images/05StudioSouthBrandIdentityProjectBrochureonBPOmin1.jpg" id="result" style="width:150px; height:150px; border-radius:500px;" alt="Image not found" /><br /><asp:FileUpload ID="fileupload" runat="server" onchange="readFile()" />
                          </div> 
                                      <label for="firstname">
                                          Firstname:<br />
                                          <input type="text" id="fname" placeholder="E.g John" style="height:40px; width:100%" runat="server" />
                                      </label>
                                      <label for="lastname">
                                          Lastname:<br />
                                          <input type="text" id="lname" placeholder="E.g Doe" style="height:40px; width:100%" runat="server" />
                                      </label>
                                      <label for="phone">
                                          Phone:<br />
                                          <input type="tel" id="tel" placeholder="E.g 09071589571" style="height:40px; width:100%" runat="server" />
                                      </label>
                                      <label for="email">
                                          Email:<br />
                                          <input type="email" id="email2" placeholder="E.g someone@example.com" style="height:40px; width:100%" disabled runat="server" />
                                      </label><br /><br />
                                      <asp:Button ID="saved" Text="Save changes..." runat="server" CssClass="button" OnClick="saved_Click" />
                      </div>
                  </div>
              </div>
                          
    <!--My Modal ends-->
          </section>
                  </td>
              </tr>
              <tr>
                  <td>
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
        <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 551.13 551.13"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1d98"></use></svg>
        <svg class="u-svg-content" enable-background="new 0 0 551.13 551.13" viewBox="0 0 551.13 551.13" xmlns="http://www.w3.org/2000/svg" id="svg-1d98"><path d="m275.565 189.451 223.897 223.897h51.668l-275.565-275.565-275.565 275.565h51.668z"></path></svg>
    </span>
  </body>
</html>
