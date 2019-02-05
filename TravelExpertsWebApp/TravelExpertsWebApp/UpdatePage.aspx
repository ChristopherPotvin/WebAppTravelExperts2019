<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePage.aspx.cs" Inherits="TravelExpertsWebApp.UpdatePage" %>

<%@ Register Src="~/HeadLinks.ascx" TagPrefix="uc1" TagName="HeadLinks" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>



<!DOCTYPE html>
<uc1:HeadLinks runat="server" ID="HeadLinks" />
<body>
    <form id="form1" runat="server">
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
              <li><a href="CustomerRegistration.aspx">Register</a></li> <!-- This could be a<a href="UpdatePage.aspx">UpdatePage.aspx</a> button to a new Customer Registration page, setting it to a blank target until we decide-->

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
                <input runat="server" class="form-control" id="email_modal" type="text" placeholder="email">
              </div>
              <div class="form-group">
                <input runat="server" class="form-control" id="password_modal" type="password" placeholder="password">
              </div>              
            <p class="text-center text-muted">Not registered yet?</p>
            <p class="text-center text-muted"><a href="CustomerRegistration.aspx"><strong>Register now</strong></a>! It is easy and done in 1&nbsp;minute and gives you access to special discounts and much more!</p>
          </div>
        </div>
      </div>
        <section>
        <div class="container" id="update">
            <div class="col-lg-7 col-lg-offset-1">
            <div class="icon"><i class="pe-7s-pen"></i></div>
            <h4 class="heading margin-bottom">Update Information</h4> 
            <p class="text-muted">If you want to update your password, <a href="#"  data-target="#password-modal" data-toggle="modal" id="passwordUpdate">click here</a></p>
                  <!-- Registration form for new customers-->
              <div class="row">
                  <!--one row -->
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="firstname">First Name</label>
                      <asp:TextBox class="form-control" type="text" ID="txtCustFirstName" runat="server"></asp:TextBox>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="lastname">Last Name</label>
                      <asp:TextBox class="form-control" type="text" ID="txtCustLastName" runat="server"></asp:TextBox>
                  </div>
                </div>
                  <!--one row -->
                <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RegularExpressionValidator ID="RegexFirstName" runat="server" ControlToValidate="txtCustFirstName" Display="Dynamic" ErrorMessage="Please enter a valid name" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]{1,50}"></asp:RegularExpressionValidator>
                      <asp:RequiredFieldValidator ID="RequiredFirstName" runat="server" ControlToValidate="txtCustFirstName" Display="Dynamic" ErrorMessage="First name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RequiredFieldValidator ID="RequiredLastName" runat="server" ControlToValidate="txtCustLastName" ErrorMessage="Last name is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegexLastName" runat="server" ControlToValidate="txtCustLastName" Display="Dynamic" ErrorMessage="Please enter a valid name" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]{1,50}"></asp:RegularExpressionValidator>
                  </div>
                </div>
                  <!--one row -->
                <div class="col-sm-12">
                  <div class="form-group">
                    <label for="address">Address</label>
                      <asp:TextBox class="form-control" type="text" ID="txtCustAddress" runat="server"></asp:TextBox>
                  </div>
                </div>
                  <!--one row -->
                <div class="col-sm-12">
                  <div class="form-group">
                      <asp:RequiredFieldValidator ID="RequiredAddress" runat="server" ControlToValidate="txtCustAddress" ErrorMessage="Address is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                </div>
                  <!--one row -->
                 <div class="col-sm-6">
                  <div class="form-group">
                    <label for="city">City</label>
                      <asp:TextBox  class="form-control" type="text" ID="txtCustCity" runat="server"></asp:TextBox>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="province">Province</label>
                      <asp:DropDownList class="form-control" ID="ddlCustProv" runat="server">
                          <asp:ListItem Value="">Select a province</asp:ListItem>
                          <asp:ListItem Value="AB">Alberta</asp:ListItem>
                          <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                          <asp:ListItem Value="MB">Manitoba</asp:ListItem>
                          <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                          <asp:ListItem Value="NL">Newfoundland and Labrador</asp:ListItem>
                          <asp:ListItem Value="NT">Northwest Territories</asp:ListItem>
                          <asp:ListItem Value="NS">Nova Scotia</asp:ListItem>
                          <asp:ListItem Value="NU">Nunavut</asp:ListItem>
                          <asp:ListItem Value="ON">Ontario</asp:ListItem>
                          <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                          <asp:ListItem Value="QC">Quebec</asp:ListItem>
                          <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                          <asp:ListItem Value="YT">Yukon</asp:ListItem>
                      </asp:DropDownList>
                  </div>
                </div>
                  <!--one row -->
                <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RequiredFieldValidator ID="RequiredCity" runat="server" Display="Dynamic" ErrorMessage="City is required" ForeColor="Red" ControlToValidate="txtCustCity"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegexLastName0" runat="server" ControlToValidate="txtCustCity" Display="Dynamic" ErrorMessage="Please enter a valid city name" ForeColor="Red" ValidationExpression="^[a-zA-Z\.\'\-_\s]{1,50}"></asp:RegularExpressionValidator>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RequiredFieldValidator ID="RequiredProvince" runat="server" ControlToValidate="ddlCustProv" ErrorMessage="Province is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                </div>
                  <!--one row -->
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="postal">Postal Code</label>
                      <asp:TextBox class="form-control" type="text" ID="txtCustPostal" runat="server"></asp:TextBox>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="country">Country</label>
                      <asp:TextBox class="form-control" type="text" ID="txtCustCountry" runat="server" ReadOnly="True">Canada</asp:TextBox>
                  </div>
                </div>
                  <!--one row -->
                <div class="col-sm-12">
                  <div class="form-group">
                      <asp:RegularExpressionValidator ID="RegexPostal" runat="server" ControlToValidate="txtCustPostal" Display="Dynamic" ErrorMessage="Please enter a valid postal code" ForeColor="Red" ValidationExpression="^([A-Za-z]\d[A-Za-z][- ]?\d[A-Za-z]\d)+$"></asp:RegularExpressionValidator>
                      <asp:RequiredFieldValidator class="form-control" ID="RequiredPostal" runat="server" Display="Dynamic" ErrorMessage="Postal code is required" ForeColor="Red" ControlToValidate="txtCustPostal"></asp:RequiredFieldValidator>
                  </div>
                </div>
                  <%--<div class="col-sm-6">
                     <div class="form-group"></div>
                </div>--%>
                  <!--one row -->
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="homePhone">Home Phone</label>
                      <asp:TextBox class="form-control" type="text" ID="txtCustHomePhone" runat="server"></asp:TextBox>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="busPhone">Business Phone</label>
                      <asp:TextBox class="form-control" type="text" ID="txtCustBusPhone" runat="server"></asp:TextBox>
                  </div>
                </div>
                  <!--one row -->
                <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RegularExpressionValidator ID="RegexHomePhone" runat="server" ControlToValidate="txtCustHomePhone" ErrorMessage="Please enter valid phone number (555) 555-5555" ForeColor="Red" ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$"></asp:RegularExpressionValidator>
                      <asp:RequiredFieldValidator ID="RequiredHomePhone" runat="server" Display="Dynamic" ErrorMessage="Home phone is required" ForeColor="Red" ControlToValidate="txtCustHomePhone"></asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                      <asp:RegularExpressionValidator ID="RegexBusPhone" runat="server" ControlToValidate="txtCustBusPhone" ErrorMessage="Please enter valid phone number (555) 555-5555" ForeColor="Red" ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                  <!--one row -->
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="email">Email</label>
                      <asp:TextBox class="form-control" type="email" ID="txtUnconfirmedEmail" runat="server"></asp:TextBox>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="confirmEmail">Confirm Email</label>
                      <asp:TextBox class="form-control" type="email" ID="txtCustEmail" runat="server"></asp:TextBox>
                  </div>
                </div>
                  <!--one row -->
                 <div class="col-sm-6">
                     <div class="form-group"></div>
                </div>
                  <div class="col-sm-6">
                     <div class="form-group">
                         <asp:CompareValidator ID="CompareEmailValidator" runat="server" ControlToCompare="txtUnconfirmedEmail" ControlToValidate="txtCustEmail" ErrorMessage="Emails do not match" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                      </div>
                </div>
                  <!--one row -->
                <div class="col-sm-6">
                    <asp:Button class="btn btn-primary" ID="btnUpdate" runat="server" Text="Update" OnClick="btnSubmit_Click" />
                </div>
                <div class="col-sm-6">
                    <asp:Button class="btn btn-danger" ID="btnCancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click" />
                </div>
              </div>
             </div>
        </div>
    </section>
        <!-- password modal -->
    <div tabindex="-1" class="modal fade" id="password-modal" role="dialog" aria-hidden="true" aria-labelledby="pswdUpdate">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
            <h4 class="modal-title" id="pswdUpdate">Password Update</h4>
          </div>
          <div class="modal-body">
            <form action="customer-orders.html" method="post">
              <div class="form-group">
                <asp:TextBox class="form-control" type="password" ID="txtOldCustPassword" placeholder="Old password" runat="server"></asp:TextBox>
                  <asp:CustomValidator ID="DBPasswordValidator" runat="server" ErrorMessage="Password is incorrect. Please try again." ControlToValidate="txtOldCustPassword" ForeColor="Red" OnServerValidate="DBPasswordValidator_ServerValidate" ValidationGroup="ModalValidation" Display="Dynamic"></asp:CustomValidator>
                   <asp:RequiredFieldValidator ID="OldPswdRequired" runat="server" Display="Dynamic" ErrorMessage="Old password is required" ForeColor="Red" ControlToValidate="txtOldCustPassword" ValidationGroup="ModalValidation"></asp:RequiredFieldValidator>
              </div>
              <div class="form-group">
                <asp:TextBox class="form-control" type="password" ID="txtUnconfirmedNewCustPassword" placeholder="New password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UnconfirmedNewPswdRequired" runat="server" Display="Dynamic" ErrorMessage="New password is required" ForeColor="Red" ControlToValidate="txtUnconfirmedNewCustPassword" ValidationGroup="ModalValidation"></asp:RequiredFieldValidator>
              </div>
               <div class="form-group">
                <asp:TextBox class="form-control" type="password" ID="txtNewCustPassword" placeholder="Confirm new password" runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please confirm your new password" ForeColor="Red" ControlToValidate="txtNewCustPassword" ValidationGroup="ModalValidation"></asp:RequiredFieldValidator>
                   <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtUnconfirmedNewCustPassword" ControlToValidate="txtNewCustPassword" ErrorMessage="Passwords do not match" ForeColor="Red" ValidationGroup="ModalValidation" Display="Dynamic"></asp:CompareValidator>
              </div>
              <p class="text-center">
                  <asp:Button class="btn btn-success" ID="btnUpdtPswd" runat="server" Text="Button" style="height: 36px" ValidationGroup="ModalValidation" OnClick ="btnUpdtPswd_Click"/>                 
              </p>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- login modal end (done) -->
        <uc1:Footer runat="server" ID="Footer" />
    </form>
    
</body>
