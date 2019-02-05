﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TravelExpertsWebApp.App_Code;
using TravelExpertsWebApp.Model;

namespace TravelExpertsWebApp
{
    public partial class CustomerRegistration : System.Web.UI.Page
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string hashedPswd = HashPassword.ApplyHash(txtCustPassword.Text);

            Customers cust = new Customers(txtCustFirstName.Text, txtCustLastName.Text, txtCustAddress.Text, txtCustCity.Text, ddlCustProv.Text, txtCustPostal.Text, txtCustCountry.Text, txtCustHomePhone.Text, txtCustBusPhone.Text, txtCustEmail.Text, hashedPswd);
            try
            {
                int insertCustId = CustomersDB.AddCustomer(cust);
                SendActivationEmail(txtCustEmail.Text);
                Response.Redirect("ConfirmationPage.aspx");
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

        private void SendActivationEmail(string customerEmail)
        {
            string ActivationCode = CustomerActivationDB.AddActivation(customerEmail);

            if (ActivationCode != null)
            {
                using (MailMessage mm = new MailMessage("travelExpertsTeam7@gmail.com", txtCustEmail.Text.Trim()))
                {
                    mm.Subject = "Account Activation";
                    string body = "Hello " + txtCustFirstName.Text.Trim() + ",";
                    body += "<br /><br />Please click the following link to activate your account";
                    body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("CustomerRegistration.aspx", "ActivationPage.aspx?ActivationCode=" + ActivationCode) + "'>Click here to activate your account.</a>";
                    body += "<br /><br />Thanks";
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential("travelExpertsTeam7@gmail.com", "Travel123");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                }
            }
            else
            {
                Response.Write("Error adding activation code");
            }
        }
    }
}