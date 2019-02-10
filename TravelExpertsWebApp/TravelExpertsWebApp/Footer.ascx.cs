using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelExpertsWebApp.Model;

namespace TravelExpertsWebApp
{
    /*Confirmation page to render if a confirmation that the customer has registered to Travel Experts
     * Lead Programmer: Chris Potvin
     * Date: 11th February 2018
     */
    public partial class Footer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            EmailSubscription newEmail = new EmailSubscription(txtEmail.Text);
            try
            {
                bool insertEmail = EmailSubscriptionDB.InsertEmailSubscriptionInfo(newEmail);
                Response.Write("<script>alert('Thank you for subscribing to our latest travel deals!');</script>");
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}