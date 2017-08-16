using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewControls_National_InternationalNews : System.Web.UI.UserControl
{
    private string News_Category;
    public string News_category
    {
        get
        {
            return News_Category;
        }
        set
        {
            News_Category = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string cat = News_Category;
            DreamBirdEntities db = new DreamBirdEntities();
            Latest_news_1.DataSource = db.News.Where(w => w.Category == cat).OrderByDescending(o => o.id).Take(2).ToList();
            Latest_news_1.DataBind();
            Latest_news_2.DataSource = db.News.Where(w => w.Category == cat).OrderByDescending(o => o.id).Take(4).Skip(2).ToList();
            Latest_news_2.DataBind();
        }
    }
}