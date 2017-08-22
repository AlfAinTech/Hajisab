using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminMasterPages_Package : System.Web.UI.MasterPage
{
    public static int selected_id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    
    protected void discount_Clicked(object sender, EventArgs e)
    {
        String url = "~/UmrahComponents/AdminPages/Package/PackageDiscount";
        openUrl(url);

    }
   
    public void openUrl(string url)
    {
        if (selected_id != 0)
        {
            int id = selected_id;//int.Parse(ViewState["SelectedhotelID"].ToString());
            url = url + "?packageID=" + id;
        }
        Response.Redirect(url);
    }
    protected void packageClicked_packageClick(object sender, EventArgs e)
    {
        EventArgDreamEdit evt = (EventArgDreamEdit)e;
        int did = evt.DreamEditID;
        
            Response.Redirect("~/UmrahComponents/AdminPages/Package/PackageDiscount?packageID=" + did);


    }
  
}
