using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminPages_Flight_AirLineFlightAddEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void closeButton_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/Flight/AirLineFlight";
        if (Request.QueryString["airLineID"] != null)
        {
            int airLine_id = int.Parse(Request.QueryString["airLineID"].ToString());
            url = url + "?airLineID=" + airLine_id;
        }
        Response.Redirect(url);
    }
    
        protected void flightsave_Clicked(object sender, EventArgs e)
        {
        String url = "~/UmrahComponents/AdminPages/Flight/AirLineFlight";
        if (Request.QueryString["airLineID"] != null)
        {
            int airLine_id = int.Parse(Request.QueryString["airLineID"].ToString());
            url = url + "?airLineID=" + airLine_id;
            if (Request.QueryString["flightID"] != null) {
                int flight_id = int.Parse(Request.QueryString["flightID"].ToString());
                url = url + "&flightID=" + flight_id;
            }
            
        }
        Response.Redirect(url);
    }
}