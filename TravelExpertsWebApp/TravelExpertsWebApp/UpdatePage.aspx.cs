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
}