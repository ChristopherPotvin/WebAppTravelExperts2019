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
                string sql = "SELECT CustFirstName from Customers where CustEmail = @CustEmail";

                SqlConnection connection = TravelExpertsDB.GetConnection();
                SqlCommand cmd = new SqlCommand(sql, connection);
                SqlParameter param = new SqlParameter("@CustEmail", SqlDbType.VarChar);
                param.Value = Session["custEmail"];
                cmd.Parameters.Add(param);
                try
                {
                    connection.Open();
                    SqlDataReader myReader;
                    myReader = cmd.ExecuteReader();
                    while (myReader.Read())
                    {
                        customerLogged.Text = "Welcome " + (myReader["CustFirstName"].ToString());
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
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    Response.Write("Login Failed");
                }
            }           
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("custEmail");
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
            catch (Exception ex)
            {
                throw ex;
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
                Response.Write("Registration incomplete. Please activate your account (see instructions sent to your email)");
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}