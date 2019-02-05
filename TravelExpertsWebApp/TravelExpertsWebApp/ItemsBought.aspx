<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemsBought.aspx.cs" Inherits="TravelExpertsWebApp.ItemsBought" %>

<%@ Register Src="~/HeadLinks.ascx" TagPrefix="uc1" TagName="HeadLinks" %>


<!DOCTYPE html>

<html>
<uc1:HeadLinks runat="server" ID="HeadLinks" />
<body>
    <form runat="server">
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
                </ul>
              </li>
              <li><a href="ContactPage.aspx">Contact</a></li>
              <li class="dropdown"><a runat="server" class="dropdown-toggle" data-toggle="dropdown" id="custLogged"><i class="fa fa-user"></i><asp:Label ID="customerLogged" runat="server" Text=""></asp:Label></a>
                <ul class="dropdown-menu"> 
                  <li><a href="UpdatePage.aspx">Update Information</a></li>
                  <li><a href="#">Purchase History</a></li>
                  <li class="divider"></li>
                  <li><a runat="server" href="HomePage.aspx" onserverclick="Logout" CausesValidation="False"><i class="fa fa-sign-out"></i>Log out</a></li>
                </ul>
              </li>
            </ul><a runat="server" class="btn navbar-btn btn-ghost" href="#" data-target="#login-modal" data-toggle="modal" id="mainBtnLogin"><i class="fa fa-sign-in"></i>Log in</a>
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
            </div>
              <div class="form-group">
                <asp:TextBox class="form-control" type="email" ID="txtModalCustEmail" placeholder="Email" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="requiredLoginModalEmail" runat="server" Display="Dynamic" ErrorMessage="Please enter your email" ForeColor="Red" ControlToValidate="txtModalCustEmail" ValidationGroup="ModalLoginValidation"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="ValidateModalEmail" runat="server" ControlToValidate="txtModalCustEmail" Display="Dynamic" ErrorMessage="Please enter a valid email" ValidationGroup="ModalLoginValidation" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
              </div>
              <div class="form-group">
                <asp:TextBox class="form-control" type="password" ID="txtModalCustPassword" placeholder="Password" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="requiredLoginModalPswd" runat="server" Display="Dynamic" ErrorMessage="Please enter your password" ForeColor="Red" ControlToValidate="txtModalCustPassword" ValidationGroup="ModalLoginValidation"></asp:RequiredFieldValidator>
              </div>
              <p class="text-center">
                <button runat="server" class="btn btn-primary" type="button" id="subBtnLogin" onserverclick="LoginButton" ValidationGroup="ModalLoginValidation"><i class="fa fa-sign-in"></i> Log in</button>
              </p>
            <p class="text-center text-muted">Not registered yet?</p>
            <p class="text-center text-muted"><a href="CustomerRegistration.aspx"><strong>Register now</strong></a>! It is easy and done in 1&nbsp;minute and gives you access to special discounts and much more!</p>
          </div>
        </div>
      </div>
    </div>
    <!-- login modal end (done) -->
    <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="odsItemsBought">
            <Columns>
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="TravelerCount" HeaderText="TravelerCount" SortExpression="TravelerCount" />
                <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                <asp:BoundField DataField="TripStart" HeaderText="TripStart" SortExpression="TripStart" />
                <asp:BoundField DataField="TripEnd" HeaderText="TripEnd" SortExpression="TripEnd" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>
    </form>
    <br />
        <div class="container">
            <asp:ObjectDataSource ID="odsItemsBought" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetItemsBought" TypeName="TravelExpertsWebApp.App_Code.ItemsBoughtDB"></asp:ObjectDataSource>
        </div>
    <div class="comments">
              <h4>2 comments</h4>
              <div class="row comment">
                <div class="col-sm-3 col-md-2 text-center-xs">
                  <p><img class="img-responsive img-circle" alt="" src="img/blog-avatar2.jpg"></p>
                </div>
                <div class="col-sm-9 col-md-10">
                  <h5>Andrew Moss</h5>
                  <p class="posted"><i class="fa fa-clock-o"></i> September 23, 2011 at 12:00 am</p>
                  <p class="text-gray">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                  <p class="reply"><a href="#"><i class="fa fa-reply"></i> Reply</a></p>
                </div>
              </div>
              <!-- /.comment-->
              <div class="row comment last">
                <div class="col-sm-3 col-md-2 text-center-xs">
                  <p><img class="img-responsive img-circle" alt="" src="img/blog-avatar.jpg"></p>
                </div>
                <div class="col-sm-9 col-md-10">
                  <h5>Peter Oganwu</h5>
                  <p class="posted"><i class="fa fa-clock-o"></i> September 23, 2012 at 12:00 am</p>
                  <p class="text-gray">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                  <p class="reply"><a href="#"><i class="fa fa-reply"></i> Reply</a></p>
                </div>
              </div>
              <!-- /.comment-->
            </div>
        <!-- start of the footer (done)-->
    <footer class="footer">
      <div class="footer__block">
        <div class="container">
          <div class="row">
            <div class="col-md-8 col-sm-12">
              <h4 class="heading">About Use customer approach to booking our travel packages.</p>
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
