using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewControls_LatestNews : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            var newsList = 
            Latest_news_1.DataSource = db.News.OrderByDescending(o => o.from_date).Take(1).ToList();
            Latest_news_1.DataBind();
            Latest_news_2.DataSource = db.News.OrderByDescending(o => o.from_date).Take(3).Skip(1).ToList();
            Latest_news_2.DataBind();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnk = (LinkButton)sender;
        string id = lnk.CommandName;
        Response.Redirect("~/News/NewsDetail.aspx?News_id=" + id);
    }

    protected void lnk_title_Click(object sender, EventArgs e)
    {
        LinkButton lnk = (LinkButton)sender;
        string id = lnk.CommandName;
        Response.Redirect("~/News/NewsDetail.aspx?News_id=" + id);
    }
}