using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewControls_NewsListForAdmin : CoreDreamControlAdapter
{
    public event EventHandler EditClicked;
    public int News_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            List<News> news_list = db.News.OrderBy(q => q.id).ToList();
            Repeater1.DataSource = news_list;
            Repeater1.DataBind();
        }
        
    }

    override
    public void BindData3(List<News> List)
    {
        Repeater1.DataSource = null;
        Repeater1.DataBind();
        Repeater1.DataSource = List;
        Repeater1.DataBind();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        
        int id = Convert.ToInt32(lb.CommandName);
        EventArgNews eve = new EventArgNews();
        eve.newsID = id;
        if(EditClicked != null)
        {
            EditClicked(this, eve);
        }
        
    }
}