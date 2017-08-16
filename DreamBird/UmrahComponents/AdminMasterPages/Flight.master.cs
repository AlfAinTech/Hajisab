using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminMasterPages_Flight : System.Web.UI.MasterPage
{
    public static int selected_id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void basicInfo_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/Flight/AirLineBasicInfo";
        openUrl(url);
    }
    protected void flight_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/Flight/AirLineFlight";
        openUrl(url);
    }
    public void openUrl(string url)
    {
        if (selected_id != 0)
        {
            int id = selected_id;//int.Parse(ViewState["SelectedhotelID"].ToString());
            url = url + "?airLineID=" + id;
        }
        Response.Redirect(url);
    }
    protected void AirLineClicked(object sender, EventArgs e)
    {
        EventArgAirLineClicked evt = (EventArgAirLineClicked)e;
        int id = evt.AirLineID;
        selected_id = id;
        ViewState["SelectedairLineID"] = id;
        Response.Redirect("~/UmrahComponents/AdminPages/Flight/AirLineBasicInfo?airLineID=" + id);



    }
    protected void adbtn_clicked(object sender, EventArgs e)
    {
        //DreamBasicInfo.Visible = true;
        selected_id = 0;
        ViewState.Clear();
        Response.Redirect("~/UmrahComponents/AdminPages/Flight/AirLineBasicInfo");
        //BasicInfo1.clearControl();
        //Accommodations1.clearControl();
        //enableInfo(false);
        // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "ActivatePanels('#basicInfo');", true);

    }
}
