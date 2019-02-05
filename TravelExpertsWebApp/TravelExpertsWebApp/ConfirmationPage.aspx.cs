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
    public partial class ConfirmationPage : System.Web.UI.Page
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
        }

        protected void LoginButton(object sender, EventArgs e)
        {
            string hashedPswd = HashPassword.ApplyHash(txtModalCustPassword.Text);

            //string custEmail = String.Format("{0}", Request.Form["email_modal"]);
            //string custPassword = String.Format("{0}", Request.Form["password_modal"]);

            Customers custLogin = new Customers(txtModalCustEmail.Text, hashedPswd);

            string output = CustomersDB.GetCustomerLogin(custLogin);

            if (output == "1")
            {
                Session["custEmail"] = txtModalCustEmail.Text;
                Response.Redirect("CustomerRegistration.aspx");
            }
            else
            {
                Response.Write("Login Failed");
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("custEmail");
            Response.Redirect("HomePage.aspx");
        }

    }
}