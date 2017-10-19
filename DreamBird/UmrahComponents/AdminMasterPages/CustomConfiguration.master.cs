using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminMasterPages_CustomConfiguration : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void HotelConfiguration_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UmrahComponents/AdminPages/CustomConfiguration/HotelCustomConfiguration");
    }

    protected void FlightConfiguration_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UmrahComponents/AdminPages/CustomConfiguration/FlightCustomConfiguration");
    }
}
