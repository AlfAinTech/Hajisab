using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class News_NewsDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.QueryString.HasKeys())
            {
                int news_id = Convert.ToInt32(Request.QueryString["News_id"].ToString());
                NewsDetail.BindData2(news_id);
                RelatedNews.BindData2(news_id);
            }
        }
       
    }
}