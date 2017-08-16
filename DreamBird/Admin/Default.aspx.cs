using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!(HttpContext.Current.User.Identity.IsAuthenticated && (HttpContext.Current.User.IsInRole("Admin") || HttpContext.Current.User.IsInRole("UmrahAdmin"))))
        {
            Response.Redirect("~/Components/Account/LoginSetting.aspx");
        }
    }
    protected void dream_clicked(object sender, EventArgs e)
    {
        EventArgDreamEdit evt = (EventArgDreamEdit)e;
        int id = evt.DreamEditID;
        enableDreamBasicInfo(id);

    }
    protected void dreamAdd_clicked(object sender, EventArgs e)
    {
        //DreamBasicInfo.Visible = true;
        DreamBasicInfo.clearControl();
        DreamBasicInfo.enableInfo(false);
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "ActivatePanels('#basicInfo');", true);

    }

    protected void enableDreamBasicInfo(int id)
    {
        DreamBasicInfo.EditDataBind(id);
        DreamBasicInfo.Visible = true;
        DreamBasicInfo.enableInfo(true);
    }

    protected void SearchClicked(object sender, EventArgs e)
    {
        DreamBasicInfo.LoadScripts();
    }

    protected void DreamListView_ActivatePanels(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "ActivatePanels('#basicInfo');", true);
    }



    protected void DreamBasicInfo_DreamAdded(object sender, EventArgs e)
    {
        DreamListView.BindData();
    }
}