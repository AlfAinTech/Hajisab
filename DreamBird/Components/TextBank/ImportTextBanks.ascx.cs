using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_ImportTextBanks : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            dreams_for_pages.DataSource = dreams.DataSource = db.Dreams.ToList();
            dreams.DataBind();
            dreams_for_pages.DataBind();
            pages_for_textBanks.DataSource = db.DreamLayouts.ToList();
            pages_for_textBanks.DataBind();
        }
    }

    protected void dreams_for_pages_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            var dream = e.Item.DataItem as Dream;
            Repeater rptr = e.Item.FindControl("pages") as Repeater;
            DreamBirdEntities db = new DreamBirdEntities();
            rptr.DataSource = db.DreamLayouts.Where(w => w.DreamID == dream.id).ToList();
            rptr.DataBind();
        }
    }

    protected void pages_for_textBanks_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            var dream = e.Item.DataItem as DreamLayout;
            Repeater rptr = e.Item.FindControl("text_banks") as Repeater;
            DreamBirdEntities db = new DreamBirdEntities();
            rptr.DataSource = db.LayoutTextBanks.Where(w => w.DreamLayout.id == dream.id).ToList();
            rptr.DataBind();
        }
    }
}