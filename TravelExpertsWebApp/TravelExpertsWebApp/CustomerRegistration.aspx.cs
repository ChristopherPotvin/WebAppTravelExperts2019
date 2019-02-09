using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TravelExpertsWebApp.App_Code;
using TravelExpertsWebApp.Model;

namespace TravelExpertsWebApp
{
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlControl loginIcon = (HtmlControl)Page.FindControl("mainBtnLogin");
            HtmlControl loggedIcon = (HtmlControl)Page.FindControl("custLogged");
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["custEmail"] != null)
            {
                loggedIcon.Visible = true;
                loginIcon.Visible = false;

                try
                {
                    customerLogged.Text = "Welcome " + CustomersDB.confirmLogin(Session["custEmail"].ToString());
                }
                catch (Exception)
                {
                    Control loginFail = FindControl("LoginFailure");
                    loginFail.Visible = true;
                    string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='An error occured while attempting to process your information. Please contact travel experts.' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
                }
            }
            else
            {
                loggedIcon.Visible = false;
                loginIcon.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string hashedPswd = HashPassword.ApplyHash(txtCustPassword.Text);

                if (txtCustEmail.Text != "")
                {                 
                    Customers cust = new Customers(txtCustFirstName.Text, txtCustLastName.Text, txtCustAddress.Text, txtCustCity.Text, ddlCustProv.Text, txtCustPostal.Text, txtCustCountry.Text, txtCustHomePhone.Text, txtCustBusPhone.Text, txtCustEmail.Text, hashedPswd, "No");
                    try
                    {
                        int insertCustId = CustomersDB.AddCustomer(cust);
                        SendActivationEmail(txtCustEmail.Text);
                        Response.Redirect("ConfirmationPage.aspx");
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                else
                {
                    string defaultEmail = "defaultemail" + CustomersDB.AssignEmailNo() + "@travelexperts.com";
                    Application["defaultEmail"] = defaultEmail;

                    Customers cust = new Customers(txtCustFirstName.Text, txtCustLastName.Text, txtCustAddress.Text, txtCustCity.Text, ddlCustProv.Text, txtCustPostal.Text, txtCustCountry.Text, txtCustHomePhone.Text, txtCustBusPhone.Text, defaultEmail, hashedPswd, "Yes");
                    try
                    {
                        int insertCustId = CustomersDB.AddCustomer(cust);
                        Response.Redirect("ConfirmationPageNoEmail.aspx");
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                
            }               
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtCustFirstName.Text = "";
            txtCustLastName.Text = "";
            txtCustAddress.Text = "";
            txtCustCity.Text = "";
            ddlCustProv.Text = "";
            txtCustPostal.Text = "";
            txtCustCountry.Text = "";
            txtCustHomePhone.Text = "";
            txtCustBusPhone.Text = "";
            txtUnconfirmedEmail.Text = "";
            txtCustEmail.Text = "";
            txtUnconfirmedPassword.Text = "";
            txtCustPassword.Text = "";
        }

        protected void LoginButton(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string hashedPswd = HashPassword.ApplyHash(txtModalCustPassword.Text);

                //string custEmail = String.Format("{0}", Request.Form["email_modal"]);
                //string custPassword = String.Format("{0}", Request.Form["password_modal"]);

                Customers custLogin = new Customers(txtModalCustEmail.Text, hashedPswd);

                string output = CustomersDB.GetCustomerLogin(custLogin);

                if (output == "1")
                {
                    Session["custEmail"] = txtModalCustEmail.Text;
                    Customers loggedCustomer = CustomersDB.GetCustomerbyEmail(Session["custEmail"].ToString());
                    Session["customerId"] = (int)loggedCustomer.CustomerId;

                    Response.Redirect("CustomerRegistration.aspx");                  
                }
                else
                {
                    Control loginFail = FindControl("LoginFailure");
                    loginFail.Visible = true;
                    string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='Login failed, please check your credentials.' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
                }
            }            
        }

        protected void Logout(object sender, EventArgs e)
        {            
            Session.Remove("custEmail");
            Session.Remove("customerId");
            Response.Redirect("HomePage.aspx");
        }

        private void SendActivationEmail(string customerEmail)
        {
            string ActivationCode = CustomerActivationDB.AddActivation(customerEmail);

            if (ActivationCode != null)
            {
                using (MailMessage mm = new MailMessage("travelExpertsTeam7@gmail.com", txtCustEmail.Text.Trim()))
                {
                    mm.Subject = "Account Activation";
                    string body = "Hello " + txtCustFirstName.Text.Trim() + ",";
                    body += "<br /><br />Please click the following link to activate your account";
                    body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("CustomerRegistration.aspx", "ActivationPage.aspx?ActivationCode=" + ActivationCode) + "'>Click here to activate your account.</a>";
                    body += "<br /><br />Thanks";
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential("travelExpertsTeam7@gmail.com", "Travel123");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                }
            }
            else
            {
                Response.Write("Error adding activation code");
            }
        }

        protected void validateEmailDB_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Customers isEmailExisting = CustomersDB.GetCustomerbyEmail(txtCustEmail.Text);

            if (isEmailExisting == null)
            {
                args.IsValid = true;               
            }
            else
            {
                args.IsValid = false;

                Control loginFail = FindControl("LoginFailure");
                loginFail.Visible = true;
                string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='Unable to register. A customer with that email address already exists.' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
            }
        }

        protected void DBANotActivated_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string activationStatus = CustomersDB.isActivated(txtModalCustEmail.Text);

            if (activationStatus == "No")
            {
                args.IsValid = false;

                Control loginFail = FindControl("LoginFailure");
                loginFail.Visible = true;
                string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='Registration incomplete. Please activate your account (see instructions sent to your email)' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
            }
            else
            {
                args.IsValid = true;
            }
        }
        
        protected void validateConfirmation_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!String.IsNullOrEmpty(txtUnconfirmedEmail.Text) && String.IsNullOrEmpty(txtCustEmail.Text))
            {
                args.IsValid = false;

                Control loginFail = FindControl("LoginFailure");
                loginFail.Visible = true;
                string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='You need to confirm the email you entered. Please see below' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}