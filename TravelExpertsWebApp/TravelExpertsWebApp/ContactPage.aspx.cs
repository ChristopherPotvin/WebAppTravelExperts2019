﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TravelExpertsWebApp.App_Code;
using TravelExpertsWebApp.Model;

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
            if (Page.IsValid)
            {
                string hashedPswd = HashPassword.ApplyHash(txtModalCustPassword.Text);
                // string custEmail = String.Format("{0}", Request.Form["email_modal"]);
                //string custPassword = String.Format("{0}", Request.Form["password_modal"]);

                Customers custLogin = new Customers(txtModalCustEmail.Text, hashedPswd);

                string output = CustomersDB.GetCustomerLogin(custLogin);

                if (output == "1")
                {
                    Session["custEmail"] = txtModalCustEmail.Text;
                    Customers loggedCustomer = CustomersDB.GetCustomerbyEmail(Session["custEmail"].ToString());
                    Session["customerId"] = (int)loggedCustomer.CustomerId;

                    Response.Redirect("ContactPage.aspx");
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

        protected void btnSubmit_Click(object sender, EventArgs e) // submit button for customer contact page
        {
            CustomerContact customer = new CustomerContact(txtCustFirstName.Text, txtCustLastName.Text, txtEmail.Text, txtSubject.Text, txtMessage.Text);
            try
            {
                bool insertCustomerContact = CustomerContactDB.InsertCustomerContactInfo(customer);
                Response.Write("<script>alert('Thank you for contacting us!');</script>");
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            txtCustFirstName.Text = "";
            txtCustLastName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
            txtSubject.Text = "";
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("custEmail");
            Session.Remove("customerId");
            Response.Redirect("HomePage.aspx");
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