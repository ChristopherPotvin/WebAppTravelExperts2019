<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemsBought.aspx.cs" Inherits="TravelExpertsWebApp.ItemsBought" %>

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
                  <li><a href="ItemsBought.aspx">Purchase History</a></li>
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
             </form>
            <p class="text-center text-muted">Not registered yet?</p>
            <p class="text-center text-muted"><a href="CustomerRegistration.aspx"><strong>Register now</strong></a>! It is easy and done in 1&nbsp;minute and gives you access to special discounts and much more!</p>
          </div>
        </div>
      </div>
     </div>
    <!-- login modal end (done) -->
    <br />
        <!-- start of Items bought UI (done) -->
    <section class="background-gray-lightest">
      <div class="container">
        <div class="breadcrumbs">
          <ul class="breadcrumb">
            <li><a href="HomePage.aspx">Home</a></li>
            <li>Products and Vacation Packages Purchased</li>
          </ul>
        </div>
        <h1 class="heading">Purchase History</h1>
        <p class="lead"><strong>This page will allow you to review all the purchases you've made since joining us. Should you have any questions or concerns, please contact us and we will be happy to assist you.
        </strong></p>
      </div>
    </section>
    <!-- end of items bought UI (done)
    <!-- start of 2nd half of UI(done)-->
    <section>  
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
    <br />
        <div class="container">
            <asp:ObjectDataSource ID="odsItemsBought" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetItemsBought" TypeName="TravelExpertsWebApp.App_Code.ItemsBoughtDB">
                <SelectParameters>
                    <asp:SessionParameter Name="customerId" SessionField="customerId" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <!-- start of the footer (done)-->
        <uc1:Footer runat="server" ID="Footer" />
   </form>
</body>
</html>
