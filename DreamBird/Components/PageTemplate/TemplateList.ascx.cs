using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_TemplateList : System.Web.UI.UserControl
{
    public event EventHandler TemplateClicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            rptr_layoutList.DataSource = db.ClientLayouts.ToList();
            rptr_layoutList.DataBind();
        }
    }

    protected void control_category_item_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        int id = Convert.ToInt32(lb.Attributes["cat_id"].ToString());
        DreamBirdEntities db = new DreamBirdEntities();
        var pageMarkup = db.ClientLayouts.Where(w => w.id == id).First();

        EventArgControlSearch evt = new EventArgControlSearch();
        evt.SearchKeyword = pageMarkup.layoutContent;
        evt.LayoutName = pageMarkup.layoutName;
        if (TemplateClicked != null)
            TemplateClicked(this, evt);
    }
}