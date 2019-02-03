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
            //welcome message
            HtmlControl loginIcon = (HtmlControl)Page.FindControl("mainBtnLogin");
            HtmlControl loggedIcon = (HtmlControl)Page.FindControl("custLogged");
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
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Customers loggedCustomer = CustomersDB.GetCustomerbyEmail(Session["custEmail"].ToString());

            Customers updatedCustomer = new Customers(txtCustFirstName.Text, txtCustLastName.Text, txtCustAddress.Text, txtCustCity.Text, ddlCustProv.Text, txtCustPostal.Text, txtCustCountry.Text, txtCustHomePhone.Text, txtCustBusPhone.Text, txtCustEmail.Text);

            try
            {
                bool updateSuccessful = CustomersDB.UpdateCustomer(loggedCustomer, updatedCustomer);
                if (updateSuccessful)
                {
                    Response.Write("Update successful");
                }
                else
                {
                    Response.Write("Unable to update information");
                }
            }
            catch (Exception ex)
            {
                throw ex;
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
            
        }

        protected void DBPasswordValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Customers isPasswordCorrect = CustomersDB.GetCustomerbyPassword(txtOldCustPassword.Text);

            if (isPasswordCorrect == null)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
                Response.Write("its good son");
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("custEmail");
            Response.Redirect("HomePage.aspx");
        }
    }
}