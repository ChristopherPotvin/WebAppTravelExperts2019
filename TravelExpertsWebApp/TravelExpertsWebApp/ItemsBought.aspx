<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemsBought.aspx.cs" Inherits="TravelExpertsWebApp.ItemsBought" %>

<!DOCTYPE html>

<html><head>
    <!-- Making the page responsive!-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Travel Experts</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- PLEASE DO NOT TOUCH ANYTHING BETWEEN THESE COMMENTS-->
    <!-- Bootstrap CSS-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome and Pixeden Icon Stroke icon fonts-->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet">
    <!-- Google fonts - Roboto-->
    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet">
    <!-- lightbox-->
    <link href="css/lightbox.min.css" rel="stylesheet">
    <!-- theme stylesheet-->
    <link id="theme-stylesheet" href="css/style.default.css" rel="stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link href="css/custom.css" rel="stylesheet">
    <!-- Favicon-->
    <link href="favicon.png" rel="shortcut icon">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- PLEASE DO NOT TOUCH ANYTHING BETWEEN THESE COMMENTS-->

  </head>
<body>
     <!-- start of navigation bar in the header (done) -->
    <header class="header">
      <div class="navbar navbar-default" role="navigation">
        <div class="container">
          <div class="navbar-header"><a class="navbar-brand" href="HomePage.aspx">Travel Experts</a>
            <div class="navbar-buttons">
              <button class="navbar-toggle navbar-btn" type="button" data-target=".navbar-collapse" data-toggle="collapse">Menu<i class="fa fa-align-justify"></i></button>
            </div>
          </div>
          <div class="collapse navbar-collapse navbar-right" id="navigation">
            <ul class="nav navbar-nav">
              <li class="active"><a href="HomePage.aspx">Home</a></li>
              <li><a href="CustomerRegistration.aspx">Register</a></li> <!-- This could be a button to a new Customer Registration page, setting it to a blank target until we decide-->

              <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Book<b class="caret"></b></a>
                <ul class="dropdown-menu"> 
                  <li><a href="ItemsBought.aspx">Book a Travel Package</a></li>
                  <li><a href="ItemsBought.aspx">Browse Current Travel Packages</a></li>
                  <li><a href="ItemsBought.aspx">Modify a Current Booking</a></li>
                  <li><a href="ItemsBought.aspx">Cancel a Booking</a></li>
                </ul>
              </li>
              <li><a href="ContactPage.aspx">Contact</a></li>
            </ul><a class="btn navbar-btn btn-ghost" href="#" data-target="#login-modal" data-toggle="modal"><i class="fa fa-sign-in"></i>Log in</a>
          </div>
        </div>
      </div>
    </header>
    <!-- end of navigation bar (done) -->
    <!-- login modal (done) -->
    <div tabindex="-1" class="modal fade" id="login-modal" role="dialog" aria-hidden="true" aria-labelledby="Login">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
            <h4 class="modal-title" id="Login">Customer login</h4>
          </div>
          <div class="modal-body">
            <form action="customer-orders.html" method="post">
              <div class="form-group">
                <input class="form-control" id="email_modal" type="text" placeholder="email">
              </div>
              <div class="form-group">
                <input class="form-control" id="password_modal" type="password" placeholder="password">
              </div>
              <p class="text-center">
                <button class="btn btn-primary" type="button"><i class="fa fa-sign-in"></i> Log in</button>
              </p>
            </form>
            <p class="text-center text-muted">Not registered yet?</p>
            <p class="text-center text-muted"><a href="CustomerRegistration.aspx"><strong>Register now</strong></a>! It is easy and done in 1&nbsp;minute and gives you access to special discounts and much more!</p>
          </div>
        </div>
      </div>
    </div>
    <!-- login modal end (done) -->
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="odsItemsBought">
                <AlternatingItemTemplate>
                    <span style="">Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    TravelerCount:
                    <asp:Label ID="TravelerCountLabel" runat="server" Text='<%# Eval("TravelerCount") %>' />
<br />Destination:
                    <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' />
                    <br />
                    TripStart:
                    <asp:Label ID="TripStartLabel" runat="server" Text='<%# Eval("TripStart") %>' />
                    <br />
                    TripEnd:
                    <asp:Label ID="TripEndLabel" runat="server" Text='<%# Eval("TripEnd") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="">Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    TravelerCount:
                    <asp:TextBox ID="TravelerCountTextBox" runat="server" Text='<%# Bind("TravelerCount") %>' />
                    <br />
                    Destination:
                    <asp:TextBox ID="DestinationTextBox" runat="server" Text='<%# Bind("Destination") %>' />
                    <br />
                    TripStart:
                    <asp:TextBox ID="TripStartTextBox" runat="server" Text='<%# Bind("TripStart") %>' />
                    <br />
                    TripEnd:
                    <asp:TextBox ID="TripEndTextBox" runat="server" Text='<%# Bind("TripEnd") %>' />
                    <br />
                    Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /><br /></span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />TravelerCount:
                    <asp:TextBox ID="TravelerCountTextBox" runat="server" Text='<%# Bind("TravelerCount") %>' />
                    <br />
                    Destination:
                    <asp:TextBox ID="DestinationTextBox" runat="server" Text='<%# Bind("Destination") %>' />
                    <br />
                    TripStart:
                    <asp:TextBox ID="TripStartTextBox" runat="server" Text='<%# Bind("TripStart") %>' />
                    <br />
                    TripEnd:
                    <asp:TextBox ID="TripEndTextBox" runat="server" Text='<%# Bind("TripEnd") %>' />
                    <br />
                    Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /><br /></span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="">Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    TravelerCount:
                    <asp:Label ID="TravelerCountLabel" runat="server" Text='<%# Eval("TravelerCount") %>' />
<br />Destination:
                    <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' />
                    <br />
                    TripStart:
                    <asp:Label ID="TripStartLabel" runat="server" Text='<%# Eval("TripStart") %>' />
                    <br />
                    TripEnd:
                    <asp:Label ID="TripEndLabel" runat="server" Text='<%# Eval("TripEnd") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="">Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    TravelerCount:
                    <asp:Label ID="TravelerCountLabel" runat="server" Text='<%# Eval("TravelerCount") %>' />
<br />Destination:
                    <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' />
                    <br />
                    TripStart:
                    <asp:Label ID="TripStartLabel" runat="server" Text='<%# Eval("TripStart") %>' />
                    <br />
                    TripEnd:
                    <asp:Label ID="TripEndLabel" runat="server" Text='<%# Eval("TripEnd") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsItemsBought" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetItemsBought" TypeName="TravelExpertsWebApp.App_Code.ItemsBoughtDB"></asp:ObjectDataSource>
        </div>
    </form>
        <!-- start of the footer (done)-->
    <footer class="footer">
      <div class="footer__block">
        <div class="container">
          <div class="row">
            <div class="col-md-8 col-sm-12">
              <h4 class="heading">About Us</h4>
              <p>We're a collection of travel agents who promise to make your travel dreams a reality.</p>
              <p>Since 2014, we've been incorporating a leading edge experience in customer service and an easy, care-free customer approach to booking our travel packages.</p>
            </div>
            <div class="col-md-4 col-sm-12">
              <h4 class="heading,">Our Offices</h4><br />
              <h5>Calgary, Alberta</h5>
              <p>Main Office<br>123 7th Ave SW, Calgary AB B1C 3F4<br>15871234567</p>
              <h5>Vancouver, British Columbia</h5>
              <p>Burrard Station A, Vancouver BC V6C 2N6<br>14031234567</p>
            </div>
          </div>
          <div class="row">
            <div class="col-md-4 col-sm-6">
              <h4 class="heading">Like us on Facebook, Twitter or send us an Email</h4>
              <p class="social social--big"><a class="external facebook" href="https://www.facebook.com/" data-animate-hover="pulse"><i class="fa fa-facebook"></i></a>
                  <a class="external twitter" href="https://twitter.com/" data-animate-hover="pulse"><i class="fa fa-twitter"></i></a>
                  <a class="email" href="https://accounts.google.com/signin/v2/sl/pwd?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a></p>
            </div>
            <div class="col-md-4 col-sm-12">
              <h4 class="heading">News and Updates</h4>
              <p>Sign up to get access to our newest travel deals and discounts on our travel packages</p>
              <form class="footer__newsletter">
                <div class="input-group">
                  <input class="form-control" type="text" placeholder="Enter your email address"><span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-send"></i></button></span>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="footer__copyright">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <p>©2019 Travel Experts</p>
            </div>
            <div class="col-md-6">
              <p class="credit">Template by <a class="external" href="https://bootstrapious.com/free-templates">Bootstrapious.com</a></p>
              <!-- Please do not remove the backlink to us unless you support us at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
            </div>
              <div class="col-md-6">
                <p>Images by Pexels.com</p>
                  <p>Icons by Icons8.com</p>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- End of the footer (done) -->
     <!-- Javascript files, PLEASE DON'T TOUCH THESE-->
    <script src="//www.google-analytics.com/analytics.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"> </script>
    <script src="js/lightbox.min.js"></script><div class="lightboxOverlay" id="lightboxOverlay" style="display: none;"></div><div class="lightbox" id="lightbox" style="display: none;"><div class="lb-outerContainer"><div class="lb-container"><img class="lb-image" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="><div class="lb-nav"><a class="lb-prev" href=""></a><a class="lb-next" href=""></a></div><div class="lb-loader"><a class="lb-cancel"></a></div></div></div><div class="lb-dataContainer"><div class="lb-data"><div class="lb-details"><span class="lb-caption"></span><span class="lb-number"></span></div><div class="lb-closeContainer"><a class="lb-close"></a></div></div></div></div>
    <script src="js/front.js"></script>
    <!-- Javascript files, PLEASE DON'T TOUCH THESE-->

    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID.-->
    <!---->
    <script>
      (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
      function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
      e=o.createElement(i);r=o.getElementsByTagName(i)[0];
      e.src='//www.google-analytics.com/analytics.js';
      r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
      ga('create','UA-XXXXX-X');ga('send','pageview');
    </script>
</body>
</html>
