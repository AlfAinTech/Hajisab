using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminPages_Flight_AirLineBasicInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["airLineId"]!=null)
        {
            int aid = int.Parse(Request.QueryString["airLineId"].ToString());
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "selectedFlight('"+aid+ "');OpenTab('BasicInfo');", true);

        }

    }
   
}