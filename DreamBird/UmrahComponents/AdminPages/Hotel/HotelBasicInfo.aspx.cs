using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_Admin_Hotels : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!(HttpContext.Current.User.Identity.IsAuthenticated))
        {
            Response.Redirect("~/Components/Account/LoginSetting.aspx");
        }
       if (!IsPostBack) {
            if(Request.QueryString["hotelID"] != null)
            {
                int hotel_id = int.Parse(Request.QueryString["hotelID"]);
                BasicInfo.EditDataBind(hotel_id);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "b_key", "selectedItem(" + hotel_id + ");", true);
            }
        }
        
    }
   

    
    protected void hotelListView_ActivatePanels(object sender, EventArgs e)
    {
      //  ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "ActivatePanels('#basicInfo');", true);
    }



    protected void hotelAdd_clicked(object sender, EventArgs e)
    {
        EventArgHotelClicked evt = (EventArgHotelClicked)e;
        ViewState["SelectedhotelID"] = evt.hotelID;
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "b_key", "selectedItem(" + evt.hotelID + ")", false);

        Response.Redirect("~/UmrahComponents/AdminPages/Hotel/HotelBasicInfo?hotelID=" + evt.hotelID);
    }
  
}