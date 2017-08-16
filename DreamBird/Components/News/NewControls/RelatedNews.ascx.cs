using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewControls_RelatedNews : CoreDreamControlAdapter
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    override
    public void BindData2(int News_ID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var RelatedNewsIDs = db.NewsRelatedNews.Where(w => w.news_id == News_ID).Select(s => s.related_news_id).ToList();
        Repeater1.DataSource = db.News.Where(w => RelatedNewsIDs.Contains(w.id)).Take(6).ToList();
        Repeater1.DataBind();

    }

    protected void link_related_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        string id = lb.CommandName;
        Response.Redirect("~/News/NewsDetail.aspx?News_id=" + id);
    }
}