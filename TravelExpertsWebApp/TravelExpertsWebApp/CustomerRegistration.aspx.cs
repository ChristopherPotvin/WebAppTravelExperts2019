using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelExpertsWebApp.App_Code;

namespace TravelExpertsWebApp
{
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Customers cust = new Customers(txtCustFirstName.Text, txtCustLastName.Text, txtCustAddress.Text, txtCustCity.Text, ddlCustProv.Text, txtCustPostal.Text, txtCustCountry.Text, txtCustHomePhone.Text, txtCustBusPhone.Text, txtCustEmail.Text, txtCustPassword.Text);
            try
            {
                int insertCustId = CustomersDB.AddCustomer(cust);
            }
            catch (Exception ex)
            {
                throw ex;
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
    }
}