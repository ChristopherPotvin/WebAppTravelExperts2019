using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TravelExpertsWebApp.App_Code;

namespace TravelExpertsWebApp
{
    public partial class UpdatePage : System.Web.UI.Page
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
                    string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='An error occured while attempting to proces your information. Please contact travel experts.' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
                }
            }
            else
            {
                loggedIcon.Visible = false;
                loginIcon.Visible = true;
            }

            if (!IsPostBack)
            {
                Customers loggedCustomer = CustomersDB.GetCustomerbyEmail(Session["custEmail"].ToString());
                txtCustFirstName.Text = loggedCustomer.CustFirstName;
                txtCustLastName.Text = loggedCustomer.CustLastName;
                txtCustAddress.Text = loggedCustomer.CustAddress;
                txtCustCity.Text = loggedCustomer.CustCity;
                ddlCustProv.Text = loggedCustomer.CustProv;
                txtCustPostal.Text = loggedCustomer.CustPostal;
                txtCustHomePhone.Text = loggedCustomer.CustHomePhone;
                txtCustBusPhone.Text = loggedCustomer.CustBusPhone;
                txtUnconfirmedEmail.Text = loggedCustomer.CustEmail;
                txtCustEmail.Text = loggedCustomer.CustEmail;
                customerLogged.Text = "Welcome " + txtCustFirstName.Text;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Customers loggedCustomer = CustomersDB.GetCustomerbyEmail(Session["custEmail"].ToString());

                Customers updatedCustomer = new Customers(txtCustFirstName.Text, txtCustLastName.Text, txtCustAddress.Text, txtCustCity.Text, ddlCustProv.Text, txtCustPostal.Text, txtCustCountry.Text, txtCustHomePhone.Text, txtCustBusPhone.Text, txtCustEmail.Text);

                try
                {
                    bool updateSuccessful = CustomersDB.UpdateCustomer(loggedCustomer, updatedCustomer);
                    if (updateSuccessful)
                    {
                        Control loginSuccess = FindControl("LoginSuccess");
                        loginSuccess.Visible = true;
                        customerLogged.Text = "Welcome " + txtCustFirstName.Text;
                        string script = @"document.getElementById('" + LoginSuccess.ClientID + "').innerHTML='Update successful.' ;setTimeout(function(){document.getElementById('" + LoginSuccess.ClientID + "').style.display='none';},5000);";
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Show status", script, true);
                    }
                    else
                    {
                        Control loginFail = FindControl("LoginFailure");
                        loginFail.Visible = true;
                        string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='Unable to update information.' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Show status", script, true);
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Customers loggedCustomer = CustomersDB.GetCustomerbyEmail(Session["custEmail"].ToString());
            txtCustFirstName.Text = loggedCustomer.CustFirstName;
            txtCustLastName.Text = loggedCustomer.CustLastName;
            txtCustAddress.Text = loggedCustomer.CustAddress;
            txtCustCity.Text = loggedCustomer.CustCity;
            ddlCustProv.Text = loggedCustomer.CustProv;
            txtCustPostal.Text = loggedCustomer.CustPostal;
            txtCustHomePhone.Text = loggedCustomer.CustHomePhone;
            txtCustBusPhone.Text = loggedCustomer.CustBusPhone;
            txtUnconfirmedEmail.Text = loggedCustomer.CustEmail;
            txtCustEmail.Text = loggedCustomer.CustEmail;
        }

        protected void btnUpdtPswd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Customers loggedCustomer = new Customers(Session["custEmail"].ToString(), HashPassword.ApplyHash(txtOldCustPassword.Text));
                Customers updatedPswdCustomer = new Customers(Session["custEmail"].ToString(), HashPassword.ApplyHash(txtNewCustPassword.Text));
                try
                {
                    bool updatePswdSuccessful = CustomersDB.UpdateCustomerPassword(loggedCustomer, updatedPswdCustomer);
                    if (updatePswdSuccessful)
                    {
                        Control loginSuccess = FindControl("LoginSuccess");
                        loginSuccess.Visible = true;
                        string script = @"document.getElementById('" + LoginSuccess.ClientID + "').innerHTML='Password update successful.' ;setTimeout(function(){document.getElementById('" + LoginSuccess.ClientID + "').style.display='none';},5000);";
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Show status", script, true);
                    }
                    else
                    {
                        Control loginFail = FindControl("LoginFailure");
                        loginFail.Visible = true;
                        string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='Unable to update password.' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Show status", script, true);
                    }
                }
                catch (Exception)
                {
                    Control loginFail = FindControl("LoginFailure");
                    loginFail.Visible = true;
                    string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='Unable to process information. Please contact travel experts.' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Show status", script, true);
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
                }
            }            
        }

        protected void DBPasswordValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Customers isPasswordCorrect = CustomersDB.GetCustomerbyPassword(HashPassword.ApplyHash(txtOldCustPassword.Text));

            if (isPasswordCorrect == null)
            {
                args.IsValid = false;
                Control loginFail = FindControl("LoginFailure");
                loginFail.Visible = true;
                string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='Unable to update password.' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
            }
            else
            {
                args.IsValid = true;              
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("custEmail");
            Session.Remove("customerId");
            Response.Redirect("HomePage.aspx");
        }

        protected void validateEmailDB_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Customers isEmailExisting = CustomersDB.GetCustomerbyEmail(txtCustEmail.Text);

            if (isEmailExisting == null || isEmailExisting.CustEmail == Session["custEmail"].ToString())
            {
                args.IsValid = true;               
            }
            else
            {
                args.IsValid = false;

                Control loginFail = FindControl("LoginFailure");
                loginFail.Visible = true;
                string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='Unable to update. A customer with that email address already exists.' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
            }
        }
    }
}