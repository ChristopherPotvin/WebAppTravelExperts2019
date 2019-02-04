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
    public partial class ContactPage : System.Web.UI.Page
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
           // string custEmail = String.Format("{0}", Request.Form["email_modal"]);
            //string custPassword = String.Format("{0}", Request.Form["password_modal"]);

            Customers custLogin = new Customers(txtModalCustEmail.Text, txtModalCustPassword.Text);

            string output = CustomersDB.GetCustomerLogin(custLogin);

            if (output == "1")
            {
                Session["custEmail"] = txtModalCustEmail.Text;
                Response.Redirect("ContactPage.aspx");
            }
            else
            {
                Response.Write("Login Failed");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e) // submit button for customer contact page
        {


            //CustomerContact customer = new CustomerContact(txtCustFirstName.Text, txtCustLastName.Text, txtEmail.Text, txtSubject.Text, txtMessage.Text);
            //try
            //{
            //    int insertCustomerContact = CustomerContactDB.AddCustomer(customer);
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }

        protected void btnCancel_Click(object sender, EventArgs e) // cancel button for customer contact page
        {
            txtCustFirstName.Text = "";
            txtCustLastName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
            txtSubject.Text = "";
        }

        protected void btnReset_Click(object sender, EventArgs e) // reset button for customer contact page
        {
            txtMessage.Text = "";
            txtSubject.Text = "";
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("custEmail");
            Response.Redirect("HomePage.aspx");
        }
    }
}