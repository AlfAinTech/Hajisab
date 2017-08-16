using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminPages_Flight_AirLineFlight : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["airLineID"] != null)
        {
            int airLineID_id = int.Parse(Request.QueryString["airLineID"]);
            Flights.bindData(airLineID_id);
        }
    }

   
}