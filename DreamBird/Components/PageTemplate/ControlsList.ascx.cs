using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_ControlsList : CoreDreamControlAdapter
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindData();
            //Repeater2.DataSource = db.HTMLControls.ToList();
            //Repeater2.DataBind();
        }
    }

    override
    public void BindData()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        rptr_controlcategory.DataSource = db.ControlCategories.ToList();
        rptr_controlcategory.DataBind();
        rprt_tabpans.DataSource = db.ControlCategories.ToList();
        rprt_tabpans.DataBind();
    }

    protected void rprt_tabpans_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var repeater2 = (Repeater)e.Item.FindControl("Repeater2");
        HiddenField hf = (HiddenField)e.Item.FindControl("hf_id");
        int id = Convert.ToInt32(hf.Value);
        repeater2.DataSource = db.HTMLControls.Where(w => w.ControlCategory_id == id).ToList();
        repeater2.DataBind();
    }
}