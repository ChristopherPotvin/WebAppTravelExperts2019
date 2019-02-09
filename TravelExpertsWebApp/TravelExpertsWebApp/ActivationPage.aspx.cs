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
    public partial class ActivationPage : System.Web.UI.Page
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

            if (!this.IsPostBack)
            {
                SqlConnection connection = TravelExpertsDB.GetConnection();
                string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();

                string custEmail = GetCustEmail(activationCode);

                string deleteActCode = "DELETE FROM UserActivation WHERE ActivationCode = @ActivationCode";

                SqlCommand deleteCommand = new SqlCommand(deleteActCode, connection);

                deleteCommand.Parameters.AddWithValue("@ActivationCode", activationCode);

                try
                {
                    connection.Open();
                    int count = deleteCommand.ExecuteNonQuery();
                    if (count == 1)
                    {
                        activationConfirmation.Text = "Activation successful.";
                        activationMessage.Text = "You have successfully activated your account. You can now login and book your next vacation!";

                        string updateActivation = "UPDATE Customers SET CustActivated = 'Yes' WHERE custEmail = @CustEmail";
                        SqlCommand updateCommand = new SqlCommand(updateActivation, connection);
                        updateCommand.Parameters.AddWithValue("@CustEmail", custEmail);

                        try
                        {
                            int countU = updateCommand.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {

                            throw ex;
                        }
                    }
                    else
                    {
                        activationConfirmation.Text = "Activation unsuccessful. Please contact an agent at Travel Experts.";
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    connection.Close();
                }
            }
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

                    Response.Redirect("HomePage.aspx");
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

        private string GetCustEmail(string activationCode)
        {
            string custEmail = null;
            SqlConnection connection = TravelExpertsDB.GetConnection();
            string selectAccount = "SELECT CustEmail FROM UserActivation WHERE ActivationCode = @ActivationCode";
            SqlCommand selectAcctCommand = new SqlCommand(selectAccount, connection);
            selectAcctCommand.Parameters.AddWithValue("@ActivationCode", activationCode);
            try
            {
                connection.Open();
                //execute the query
                SqlDataReader reader = selectAcctCommand.ExecuteReader();

                if (reader.Read())
                {
                    custEmail = reader["CustEmail"].ToString();
                }
            }
            catch (Exception)
            {
                Control loginFail = FindControl("LoginFailure");
                loginFail.Visible = true;
                string script = @"document.getElementById('" + LoginFailure.ClientID + "').innerHTML='An error occured while attempting to proces your information. Please contact travel experts.' ;setTimeout(function(){document.getElementById('" + LoginFailure.ClientID + "').style.display='none';},5000);";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "somekey", script, true);
            }
            finally
            {
                connection.Close();
            }
            return custEmail;
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
    }
}