using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelExpertsWebApp.Model;

namespace TravelExpertsWebApp
{
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

            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}