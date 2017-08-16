using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated && HttpContext.Current.User.Identity.Name == "admin"))
        {
            Response.Redirect("~/Components/Account/LoginSetting.aspx");
        }
    }

    protected void NewsListForAdmin_EditClicked(object sender, EventArgs e)
    {
        EventArgNews eve = (EventArgNews)e;
        int news_id = eve.newsID;
        EditNewsForAdmin.BindData2(news_id);
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "ActivateModal(1);", true);
        //<script type='text/javascript'>Sys.Application.add_load(ActivateModal(1));</script>"

    }

    protected void NewsSearch_SearchClicked(object sender, EventArgs e)
    {
        EventArgNews eve = (EventArgNews)e;
        List<News> List = eve.newsList;
        NewsListForAdmin.BindData3(List);
    }

    protected void add_news_ServerClick(object sender, EventArgs e)
    {
        EditNewsForAdmin.ClearControl();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "ActivateModal(1);", true);
    }
}