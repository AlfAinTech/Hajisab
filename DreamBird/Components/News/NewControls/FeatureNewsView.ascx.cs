using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewControls_FeatureNewsView : System.Web.UI.UserControl, ICoreDreamControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            List<News> news_feature = db.News.Where(q => q.is_feature_news == true).OrderBy(q => q.id).Take(4).ToList();
            dl_search_news.DataSource = news_feature;
            dl_search_news.DataBind();
        }
    }

    protected void lb_news_detail_Click(object sender, EventArgs e)
    {
       LinkButton btn = (LinkButton)sender;
        int id = int.Parse(btn.CommandArgument.ToString());
        Response.Redirect("~/News/NewsDetail.aspx?News_id=" + id);

    }

    public void BindData()
    {
       
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
      
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
       
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    { 
    }
}