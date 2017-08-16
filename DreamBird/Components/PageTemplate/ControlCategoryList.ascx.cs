using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_ControlCategoryList : System.Web.UI.UserControl
{
    public event EventHandler CategoryClicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindData();
        }
    }

    protected void control_category_item_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        int id = Convert.ToInt32(lb.Attributes["cat_id"].ToString());
        EventArgControlSearch evt = new EventArgControlSearch();
        evt.ControlCategory = id;
        if(CategoryClicked != null)
        {
            CategoryClicked(this, evt);
        }
    }

    public void BindData()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        rptr_controlCategory.DataSource = db.ControlCategories.ToList();
        rptr_controlCategory.DataBind();
    }
}