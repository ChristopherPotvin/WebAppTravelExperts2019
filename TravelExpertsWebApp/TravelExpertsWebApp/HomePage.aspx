<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="TravelExpertsWebApp.HomePage" %>

<%@ Register Src="~/HeadLinks.ascx" TagPrefix="uc1" TagName="HeadLinks" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>



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
            <form action="customer-orders.html" method="post">
              <div class="form-group">
                <input runat="server" class="form-control" id="email_modal" type="text" placeholder="email">
              </div>
              <div class="form-group">
                <input runat="server" class="form-control" id="password_modal" type="password" placeholder="password">
              </div>
              <p class="text-center">
                <button runat="server" class="btn btn-primary" type="button" id="subBtnLogin" onserverclick="LoginButton" CausesValidation="False"><i class="fa fa-sign-in"></i> Log in</button>
              </p>
            </form>
            <p class="text-center text-muted">Not registered yet?</p>
            <p class="text-center text-muted"><a href="CustomerRegistration.aspx"><strong>Register now</strong></a>! It is easy and done in 1&nbsp;minute and gives you access to special discounts and much more!</p>
          </div>
        </div>
      </div>
    </div>
    <!-- login modal end (done) -->

   <!-- start of the jumbotron (done) -->
    <div class="jumbotron main-jumbotron">
      <div class="container">
        <div class="content">
          <h1>Travel Experts</h1>
          <p><a class="btn btn-white" href="ContactPage.aspx">Learn more</a></p>
        </div>
      </div>
    </div>
    <!-- end of jumbotron (done) -->
    <!-- start of about us section, home page (done)-->
    <section>
      <div class="container">
        <h2> What we do</h2>
        <p class="lead">We pride ourselves on delivering the most optimal travel packages and deals known to man</p>
        <p>Not only do we have a great assortment of travel packages but it also comes with a silky smooth booking and planning process from the moment you book your trip, to the moment you step out of
            of the plane. We guarantee 100 % satisfaction or your money back. 
        </p>
        <p><a class="btn btn-ghost" href="#">Read more</a></p> <!-- blank target on the read more button, can possibly go to the booking or register page-->
      </div>
    </section>
    <!-- end of about us section, home page (done)-->
    <!-- possible start of ASP form sections, read more buttons set to blank but can be set to booking -->
    <section class="background-gray-lightest">
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="post">
              <div class="image"><a href="#"><img class="img-responsive" alt="" src="img/blog4.jpg"></a></div>
              <h3><a href="#">Caribbean New Year</a></h3>
              <p class="post__intro">Cruise all around the caribbean and celebrate the New Year in style.</p>
              <p class="read-more"><a class="btn btn-ghost" href="#">Learn More    </a></p>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="post">
              <div class="image"><a href="#"><img class="img-responsive" alt="" src="img/blog5.jpg"></a></div>
              <h3><a href="#">Polynesian Paradise</a></h3>
              <p class="post__intro">This all travel package to Hawaii, includes air fare and an 8 day stay in an all inclusive 5 star resort.</p>
              <p class="read-more"><a class="btn btn-ghost" href="#">Learn More    </a></p>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="post">
              <div class="image"><a href="#"><img class="img-responsive" alt="" src="img/blog6.jpg"></a></div>
              <h3><a href="#">European Vacation</a></h3>
              <p class="post__intro">Enjoy a euro tour with a rail pass, starting in magestic Vienna, Italy and finishing in Paris, France. This package
                  is a two week trip with included travel insurance. 
              </p>
              <p class="read-more"><a class="btn btn-ghost" href="#">Learn More     </a></p>
            </div>
          </div>
        </div>
          </div>
    </section>
    <!-- end of ASP form sections, placeholders for now -->
    <!-- start of another possible ASP form section placeholder for now -->
    <section>
      <div class="container clearfix">
        <div class="row services">
          <div class="col-md-12">
            <h2 class="h1">Integrations</h2>
            <div class="row">
              <div class="col-sm-4">
                <div class="box box-services">
                  <div class="icon"><i class="pe-7s-alarm"></i></div>
                  <h4 class="heading">Webdesign</h4>
                  <p>Fifth abundantly made Give sixth hath. Cattle creature i be don't them.</p>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="box box-services">
                  <div class="icon"><i class="pe-7s-cloud"></i></div>
                  <h4 class="heading">Print</h4>
                  <p>Advantage old had otherwise sincerity dependent additions. It in adapted natural.</p>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="box box-services">
                  <div class="icon"><i class="pe-7s-coffee"></i></div>
                  <h4 class="heading">SEO and SEM</h4>
                  <p>Am terminated it excellence invitation projection as. She graceful shy. </p>
                </div>
              </div>
            </div>
            <h2 class="h1">Tools</h2>
            <div class="row">
              <div class="col-sm-4">
                <div class="box box-services">
                  <div class="icon"><i class="pe-7s-monitor"></i></div>
                  <h4 class="heading">Consulting</h4>
                  <p>Fifth abundantly made Give sixth hath. Cattle creature i be don't them.</p>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="box box-services">
                  <div class="icon"><i class="pe-7s-signal"></i></div>
                  <h4 class="heading">Email Marketing</h4>
                  <p>Advantage old had otherwise sincerity dependent additions. It in adapted natural.</p>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="box box-services">
                  <div class="icon"><i class="pe-7s-id"></i></div>
                  <h4 class="heading">UX &amp; UI</h4>
                  <p>Am terminated it excellence invitation projection as. She graceful shy. </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end of possible ASP section, placeholder for now-->
    <!-- start of image gallery (done)-->
    <section class="background-gray-lightest" id="portfolio">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="heading">Destination Gallery</h1>
            <p class="lead">Check out some of the most exciting places to visit in 2019</p>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row no-space">
          <div class="col-sm-4 col-xs-6">
            <div class="box"><a title="" href="img/portfolio-1.jpg" data-title="Santorini, Greece" data-lightbox="portfolio"><img class="img-responsive" alt="" src="img/portfolio-1.jpg"></a></div>
          </div>
          <div class="col-sm-4 col-xs-6">
            <div class="box"><a title="" href="img/portfolio-7.jpg" data-title="London, England" data-lightbox="portfolio"><img class="img-responsive" alt="" src="img/portfolio-7.jpg"></a></div>
          </div>
          <div class="col-sm-4 col-xs-6">
            <div class="box"><a title="" href="img/portfolio-3.jpg" data-title="The Great Wall of China, China" data-lightbox="portfolio"><img class="img-responsive" alt="" src="img/portfolio-3.jpg"></a></div>
          </div>
          <div class="col-sm-4 col-xs-6">
            <div class="box"><a title="" href="img/portfolio-5.jpg" data-title="Taj Mahal, India" data-lightbox="portfolio"><img class="img-responsive" alt="" src="img/portfolio-5.jpg"></a></div>
          </div>
          <div class="col-sm-4 col-xs-6">
            <div class="box"><a title="" href="img/portfolio-4.jpg" data-title="The Eiffel Tower, France" data-lightbox="portfolio"><img class="img-responsive" alt="" src="img/portfolio-4.jpg"></a></div>
          </div>
          <div class="col-sm-4 col-xs-6">
            <div class="box"><a title="" href="img/portfolio-6.jpg" data-title="San Francisco, USA" data-lightbox="portfolio"><img class="img-responsive" alt="" src="img/portfolio-6.jpg"></a></div>
          </div>
          <div class="col-sm-4 col-xs-6">
            <div class="box"><a title="" href="img/portfolio-2.jpg" data-title="Toronto, Canada" data-lightbox="portfolio"><img class="img-responsive" alt="" src="img/portfolio-2.jpg"></a></div>
          </div>
          <div class="col-sm-4 col-xs-6">
            <div class="box"><a title="" href="img/portfolio-8.jpg" data-title="Amafi Coast, Italy" data-lightbox="portfolio"><img class="img-responsive" alt="" src="img/portfolio-8.jpg"></a></div>
          </div>
          <div class="col-sm-4 col-xs-6">
            <div class="box"><a title="" href="img/portfolio-9.jpg" data-title="Prague, Czech Republic" data-lightbox="portfolio"><img class="img-responsive" alt="" src="img/portfolio-9.jpg"></a></div>
          </div>
        </div>
      </div>
    </section>
    <!-- end of image gallery (done)-->
      <!-- Testing a Stripe Api Payment Widget-->
      <form action="HomePage.aspx" method="POST">
  <script
    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
    data-key="pk_test_jkUlFVHsOiLghrCqtzYURt7X"
    data-amount="300000"
    data-name="Travel Experts"
    data-description="Please double check your details"
    data-image="https://img.icons8.com/ios/100/000000/card-security.png"
    data-locale="auto"
    data-zip-code="true"
    data-currency="cad">
  </script>
          </form>
      <!-- 4000001240000000 , Canadian Visa Credit Card number to test validation while in Stripe Test mode that validates it against a Canadian Postal Code -->
     <!-- Testing a Stripe Api Payment Widget-->
    <!-- start of the footer (done)-->
      <uc1:Footer runat="server" ID="Footer" />
  </form>
</body>

</html>
