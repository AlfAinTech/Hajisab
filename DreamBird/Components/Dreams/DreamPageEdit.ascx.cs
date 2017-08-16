using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_PageEdit : CoreDreamControlAdapter
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        defaultPage_validation.Visible = false;

    }
   
    public void BindEditPage_Data(int dream_id)
    {
        DreamBirdEntities db;
        db = new DreamBirdEntities();
        ddlPage.DataSource = db.DreamLayouts.Where(q => q.DreamID == dream_id).ToList();
        ddlPage.DataBind();
        ddlPage_SelectedIndexChanged(ddlPage,null);
        DreamPageAdd.setData(dream_id);
        ViewState["dream_id"] = dream_id;
        if (ddlPage.SelectedItem != null) { 
        int layout_id = int.Parse(ddlPage.SelectedItem.Value);
       
        
        DreamLayout dl = db.DreamLayouts.Where(q => q.id == layout_id).First();
            default_chk.Checked = dl.IsUserDefaultPage.Value;
        page_name.Text = dl.Page;
        DescriptionPage_text.Text = dl.Description;
        //addNav_chk.Checked = (Boolean)dl.NavEnable;
        publishPage_chk.Checked = (Boolean)dl.IsPublished;

            // int layout_id = int.Parse(ddlPage.SelectedItem.Value);

        }
    }

    protected void ddlPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        int layout_id = int.Parse(ddlPage.SelectedItem.Value);

        DreamBirdEntities db;
        db = new DreamBirdEntities();
        DreamLayout dl = db.DreamLayouts.Where(q => q.id == layout_id).First();
        
        page_name.Text = dl.Page;
        DescriptionPage_text.Text = dl.Description;
        //addNav_chk.Checked = (Boolean)dl.NavEnable;
        publishPage_chk.Checked = (Boolean)dl.IsPublished;
        default_chk.Checked = dl.IsUserDefaultPage.Value;

    }

    protected void edit_Page_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db;
        db = new DreamBirdEntities();
        int dl_id =int.Parse( ddlPage.SelectedItem.Value);
        DreamLayout dl = db.DreamLayouts.Where(q => q.id == dl_id).First();
        if (default_chk.Checked)
        {
            int count = db.DreamLayouts.Where(q => q.DreamID == dl.DreamID && q.IsUserDefaultPage == true && q.id != dl.id).Count();
            if (count != 0)
            {
                defaultPage_validation.Visible = true;
                return;
            }
            else
            {
                dl.IsUserDefaultPage = true;
            }
        }
        else
        {
            dl.IsUserDefaultPage = false;
        }
        
        dl.Description = DescriptionPage_text.Text;
        dl.IsPublished = publishPage_chk.Checked;
        //dl.NavEnable = addNav_chk.Checked;
        
        db.SaveChanges();

    }
    protected void  PageCreate_pageCreated(object sender, EventArgs e)
    {
        DreamBirdEntities db;
        db = new DreamBirdEntities();
        int dream_id = int.Parse(ViewState["dream_id"].ToString());
        ddlPage.DataSource = db.DreamLayouts.Where(q => q.DreamID == dream_id).ToList();
        ddlPage.DataBind();
    }

    protected void DreampageAdd_MyEvents(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();

    }
    protected void page_add_Click(object sender, EventArgs e)
    {
        int dream_id = int.Parse(ViewState["dream_id"].ToString());
        DreamPageAdd.setData(dream_id);
    //    DreamBirdEntities db;
    //    db = new DreamBirdEntities();
    //    int dl_id = int.Parse(ddlPage.SelectedItem.Value);
    //    var t = new DreamLayout
    //    {
    //        dl.Description = DescriptionPage_text.Text;
    //    dl.IsPublished = publishPage_chk.Checked;
    //    dl.NavEnable = addNav_chk.Checked;
    //};

    }

    protected void default_chk_CheckedChanged(object sender, EventArgs e)
    {
        if(!default_chk.Checked)
        {
            defaultPage_validation.Visible = false;

        }
    }
}