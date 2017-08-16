using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_DreamsandPages : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            rptr_dream_list.DataSource = db.Dreams.ToList();
            rptr_dream_list.DataBind();
            rptr_dream_page_List.DataSource = db.Dreams.ToList();
            rptr_dream_page_List.DataBind();
        }
    }

    protected void rptr_dream_page_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var repeater2 = (Repeater)e.Item.FindControl("rptr_page_list");
        HiddenField hf = (HiddenField)e.Item.FindControl("hf_id");
        int id = Convert.ToInt32(hf.Value);
        var dreamPageList = db.DreamLayouts.Where(w => w.DreamID == id).Select<DreamLayout, int?>(s => s.id).ToList();
        var LessonMenuIDS = db.LessonMenus.Where(w => dreamPageList.Contains(w.ParentLayoutID)).Select<LessonMenu, int?>(s => s.DreamLayoutID).ToList();
        repeater2.DataSource = db.DreamLayouts.Where(w => w.DreamID == id && !LessonMenuIDS.Contains(w.id)).ToList();
        repeater2.DataBind();
    }
}