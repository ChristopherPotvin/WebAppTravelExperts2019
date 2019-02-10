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
    /*Page to allow customers to view the packages they bought
     * Lead Programmer: Mo Sagnia
     * Date: 11th February 2018
     */
    public partial class ItemsBought : System.Web.UI.Page
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

        protected void LoginButton(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string hashedPswd = HashPassword.ApplyHash(txtModalCustPassword.Text);
                // string custEmail = String.Format("{0}", Request.Form["email_modal"]);
                // string custPassword = String.Format("{0}", Request.Form["password_modal"]);

                Customers custLogin = new Customers(txtModalCustEmail.Text, hashedPswd);

                string output = CustomersDB.GetCustomerLogin(custLogin);

                if (output == "1")
                {
                    Session["custEmail"] = txtModalCustEmail.Text;
                    Customers loggedCustomer = CustomersDB.GetCustomerbyEmail(Session["custEmail"].ToString());
                    Session["customerId"] = (int)loggedCustomer.CustomerId;

                    Response.Redirect("ItemsBought.aspx");
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
            Session.Remove("customerId");
            Response.Redirect("HomePage.aspx");
        }
    }
}