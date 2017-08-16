using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewsListText : CoreDreamControlAdapter
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            List<News> news_feature = db.News./*Where(q => q.is_feature_news == false).*/OrderBy(q => q.id).Take(8).ToList();
            newsText_list.DataSource = news_feature;
            newsText_list.DataBind();
        }
    }

    protected void lb_news_detail_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int id = int.Parse(btn.CommandArgument.ToString());
        Response.Redirect("~/News/NewsDetail.aspx?News_id=" + id);
    }
}