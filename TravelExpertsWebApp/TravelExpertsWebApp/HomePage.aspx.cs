using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace TravelExpertsWebApp
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["custEmail"] != null)
            {
                HtmlControl loginIcon = (HtmlControl)Page.FindControl("mainBtnLogin");
                loginIcon.Visible = false;
            }
        }
    }
}