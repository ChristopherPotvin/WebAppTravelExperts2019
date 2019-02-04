<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="TravelExpertsWebApp.ContactPage" %>

<%@ Register Src="~/HeadLinks.ascx" TagPrefix="uc1" TagName="HeadLinks" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>


<!DOCTYPE html>

<html>
<uc1:HeadLinks runat="server" ID="HeadLinks" />
    <body>
    <form runat="server">
    <!-- start of navbar (done) -->
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
    <!-- ond of login model, can we attach SQL authentication to this? -->

    <!-- start of contact UI (done) -->
    <section class="background-gray-lightest">
      <div class="container">
        <div class="breadcrumbs">
          <ul class="breadcrumb">
            <li><a href="HomePage.aspx">Home</a></li>
            <li>Contact</li>
          </ul>
        </div>
        <h1 class="heading">Contact</h1>
        <p class="lead"><strong>What are you waiting for? Start booking the next trip of a lifetime. Here at Travel Experts we have  
            a dedicated team of professionals just waiting in the wings to begin planning your next memorable trip.
        </strong></p>
      </div>
    </section>
    <!-- end of contact UI (done)
    <!-- start of 2nd half of UI(done)-->
    <section>  
      <div class="container" id="contact">
        <div class="row">
          <div class="col-lg-4">
            <div class="box-simple">
              <div class="icon"><i class="pe-7s-map-2"></i></div>
              <h4 class="heading margin-bottom">Address</h4><br />
              <p>123 7th Ave SW, Calgary AB B1C 3F4<br>Calgary, Alberta<br /><strong>Canada</strong></p>
            </div>
            <div class="box-simple">
              <div class="icon"><i class="pe-7s-phone"></i></div>
              <h4 class="heading margin-bottom">Feel free to contact us</h4><br />
              <br /><p class="text-muted">This number is toll free, leave us a voicemail if you don't get through to us the first time.</p>
              <br /><p><strong>14031234567</strong></p>
            </div>
            <div class="box-simple">
              <div class="icon"><i class="pe-7s-mail-open"></i></div>
              <h4 class="heading margin-bottom">Email</h4>
              <p class="text-muted">Please feel free to write an email to us, we try to respond within the same day.</p>
              <ul>
                <li><strong><a href="mailto: https://accounts.google.com/signin/v2/sl/pwd?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin"">TravelExperts@gmail.com</a></strong></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-7 col-lg-offset-1">
            <div class="icon"><i class="pe-7s-pen"></i></div>
            <h4 class="heading margin-bottom">Contact form</h4> 
            <p class="text-muted">Reach out to us if you have any further questions or inquiries.</p>
              <!-- Possible ASP contact form to register new customers-->
              <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="firstname">Firstname</label>
                      <asp:TextBox class="form-control" ID="txtCustFirstName" runat="server" ></asp:TextBox>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="lastname">Lastname</label>
                    <asp:TextBox class="form-control" ID="txtCustLastName" runat="server" ></asp:TextBox>
                  </div>
                </div>
                  <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RegularExpressionValidator ID="RegexFirstName" runat="server" ControlToValidate="txtCustFirstName" Display="Dynamic" ErrorMessage="Please enter a valid first name" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]{1,50}"></asp:RegularExpressionValidator>
                      <asp:RequiredFieldValidator ID="RequiredFirstName" runat="server" ControlToValidate="txtCustFirstName" Display="Dynamic" ErrorMessage="First name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                  </div>
                </div>
                  <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RegularExpressionValidator ID="RegexLastName" runat="server" ControlToValidate="txtCustLastName" Display="Dynamic" ErrorMessage="Please enter a valid last name" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]{1,50}"></asp:RegularExpressionValidator>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustLastName" ErrorMessage="Last name is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="email">Email</label>
                    <asp:TextBox class="form-control" ID="txtEmail" runat="server" ></asp:TextBox>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Your email is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter a valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="subject">Subject</label>
                    <asp:TextBox class="form-control" ID="txtSubject" runat="server" ></asp:TextBox>
                  </div>
                </div>
                  <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RequiredFieldValidator ID="RequiredSubject" runat="server" ControlToValidate="txtSubject" ErrorMessage="A subject is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="col-sm-12">
                  <div class="form-group">
                    <label for="message">Message</label>
                    <asp:TextBox class="form-control" ID="txtMessage" runat="server" ></asp:TextBox>
                  </div>
                </div>
                  <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RequiredFieldValidator ID="RequiredMessage" runat="server" ControlToValidate="txtMessage" ErrorMessage="A message is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="col-sm-12"><br />
                  <asp:Button class="btn btn-primary" ID="btnSubmit" runat="server" Text="Send a message" CausesValidation="False" OnClick="btnSubmit_Click" Height="32px" Width="245px" />
                </div>                
                  <div class="col-sm-12"><br />
                      <asp:Button class="btn btn-secondary" ID="btnReset" runat="server" Height="32px" Text="Reset" Width="245px" OnClick="btnReset_Click1" />
                      <br />
                  </div>                
                <div class="col-sm-12"><br />
                    <asp:Button class="btn btn-danger" ID="btnCancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click" Height="32px" Width="245px" />
                </div>
              </div>
              <!-- Possible ASP contact form to register new customers-->
          </div>
        </div>
      </div>
    </section>
        </form>
    <!-- end of 2nd half of UI(done)-->
    <!-- start of map UI LeafLet (Done) Sait location showing-->
    <div tabindex="0" class="leaflet-container leaflet-touch leaflet-fade-anim leaflet-grab leaflet-touch-drag leaflet-touch-zoom" id="mapid" style="width: 1800px; height: 500px; position: relative;"><div class="leaflet-pane leaflet-map-pane" style="transform: translate3d(0px, 0px, 0px);"><div class="leaflet-pane leaflet-tile-pane"><div class="leaflet-layer " style="z-index: 1; opacity: 1;"><div class="leaflet-tile-container leaflet-zoom-animated" style="z-index: 18; transform: translate3d(0px, 0px, 0px) scale(1);"><img class="leaflet-tile leaflet-tile-loaded" role="presentation" style="width: 256px; height: 256px; opacity: 1; transform: translate3d(56px, -91px, 0px);" alt="" src="https://api.tiles.mapbox.com/v4/mapbox.streets/13/4093/2723.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw"><img class="leaflet-tile leaflet-tile-loaded" role="presentation" style="width: 256px; height: 256px; opacity: 1; transform: translate3d(312px, -91px, 0px);" alt="" src="https://api.tiles.mapbox.com/v4/mapbox.streets/13/4094/2723.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw"><img class="leaflet-tile leaflet-tile-loaded" role="presentation" style="width: 256px; height: 256px; opacity: 1; transform: translate3d(56px, 165px, 0px);" alt="" src="https://api.tiles.mapbox.com/v4/mapbox.streets/13/4093/2724.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw"><img class="leaflet-tile leaflet-tile-loaded" role="presentation" style="width: 256px; height: 256px; opacity: 1; transform: translate3d(312px, 165px, 0px);" alt="" src="https://api.tiles.mapbox.com/v4/mapbox.streets/13/4094/2724.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw"><img class="leaflet-tile leaflet-tile-loaded" role="presentation" style="width: 256px; height: 256px; opacity: 1; transform: translate3d(-200px, -91px, 0px);" alt="" src="https://api.tiles.mapbox.com/v4/mapbox.streets/13/4092/2723.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw"><img class="leaflet-tile leaflet-tile-loaded" role="presentation" style="width: 256px; height: 256px; opacity: 1; transform: translate3d(568px, -91px, 0px);" alt="" src="https://api.tiles.mapbox.com/v4/mapbox.streets/13/4095/2723.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw"><img class="leaflet-tile leaflet-tile-loaded" role="presentation" style="width: 256px; height: 256px; opacity: 1; transform: translate3d(-200px, 165px, 0px);" alt="" src="https://api.tiles.mapbox.com/v4/mapbox.streets/13/4092/2724.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw"><img class="leaflet-tile leaflet-tile-loaded" role="presentation" style="width: 256px; height: 256px; opacity: 1; transform: translate3d(568px, 165px, 0px);" alt="" src="https://api.tiles.mapbox.com/v4/mapbox.streets/13/4095/2724.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw"></div></div></div><div class="leaflet-pane leaflet-shadow-pane"></div><div class="leaflet-pane leaflet-overlay-pane"></div><div class="leaflet-pane leaflet-marker-pane"></div><div class="leaflet-pane leaflet-tooltip-pane"></div><div class="leaflet-pane leaflet-popup-pane"></div><div class="leaflet-proxy leaflet-zoom-animated" style="transform: translate3d(1.04805e+006px, 697379px, 0px) scale(4096);"></div></div><div class="leaflet-control-container"><div class="leaflet-top leaflet-left"><div class="leaflet-control-zoom leaflet-bar leaflet-control"><a title="Zoom in" class="leaflet-control-zoom-in" role="button" aria-label="Zoom in" href="#">+</a><a title="Zoom out" class="leaflet-control-zoom-out" role="button" aria-label="Zoom out" href="#">−</a></div></div><div class="leaflet-top leaflet-right"></div><div class="leaflet-bottom leaflet-left"></div><div class="leaflet-bottom leaflet-right"><div class="leaflet-control-attribution leaflet-control"></div></div></div></div>
        <script>

            var mymap = L.map('mapid').setView([51.064202, -114.088617], 13);

            var marker = L.marker([51.064202, -114.088617]).addTo(mymap);

	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		maxZoom: 18,
		id: 'mapbox.streets'
	}).addTo(mymap);

        </script>
    <!-- end of map UI LeafLet (done)-->
   <!-- start of the footer (done)-->
   <uc1:Footer runat="server" ID="Footer" />
</form>
</body>
</html>
