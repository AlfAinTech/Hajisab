using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewControls_NewsSearchHome : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            ComboBox1.DataSource = db.News.ToList();
            ComboBox1.DataTextField = "news_title";
            ComboBox1.DataValueField = "id";
            ComboBox1.DataBind();
           
        }
    }

    protected void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        AjaxControlToolkit.ComboBox cbox = (AjaxControlToolkit.ComboBox)sender;
        string selectedNewsid = cbox.SelectedItem.Value;
        Response.Redirect("~/News/NewsDetail.aspx?News_id=" + selectedNewsid);
    }
}