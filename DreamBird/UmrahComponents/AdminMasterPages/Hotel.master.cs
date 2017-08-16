using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminMasterPages_Hotel : System.Web.UI.MasterPage
{
    public static int selected_id=0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void basicInfo_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/Hotel/HotelBasicInfo";
        openUrl(url);
    }
    protected void accommodation_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/Hotel/HotelAccommodation";
        openUrl(url);
    }
    protected void facilities_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/Hotel/HotelFacility";
        openUrl(url);
        
    }
    protected void images_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/Hotel/HotelImages";
        openUrl(url);
    }
    protected void directions_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/Hotel/HotelDirections";
        openUrl(url);
    }
    public void openUrl(string url)
    {
        if (selected_id !=0)
        {
            int id = selected_id;//int.Parse(ViewState["SelectedhotelID"].ToString());
            url = url + "?hotelID="+id;
        }
        Response.Redirect(url);
    }
    protected void hotelClicked_hotelClick(object sender, EventArgs e)
    {
        EventArgHotelClicked evt = (EventArgHotelClicked)e;
        int id = evt.hotelID;
        selected_id = id;
        ViewState["SelectedhotelID"] = id;
        Response.Redirect("~/UmrahComponents/AdminPages/Hotel/HotelBasicInfo?hotelID="+id);
       


    }
    protected void adbtn_clicked(object sender, EventArgs e)
    {
        //DreamBasicInfo.Visible = true;
        selected_id = 0;
        ViewState.Clear();
        Response.Redirect("~/UmrahComponents/AdminPages/Hotel/HotelBasicInfo");
        //BasicInfo1.clearControl();
        //Accommodations1.clearControl();
        //enableInfo(false);
        // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "ActivatePanels('#basicInfo');", true);

    }
    protected void hotelListView_ActivatePanels(object sender, EventArgs e)
    {
        //  ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "ActivatePanels('#basicInfo');", true);
    }



}
