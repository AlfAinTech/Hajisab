using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminMasterPages_BookingConfirmation : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void PaymentConfirmation_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/BookingConfirmation/BookingConfirmation";
        Response.Redirect(url);
    }

    protected void EmailReminder_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/BookingConfirmation/BookingReminder";
        Response.Redirect(url);
    }

    protected void BookedPackages_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/BookingConfirmation/BookingDetail";
        Response.Redirect(url);
    }
}
