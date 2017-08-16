using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamPageAdd : System.Web.UI.UserControl
{
    public event EventHandler pageAdded;
    public event EventHandler MyEvents;
    protected void Page_Load(object sender, EventArgs e)
    {
        ErrorMessage.Visible = false;
    if(!IsPostBack) { 
        DreamBirdEntities db = new DreamBirdEntities();
        ddlDream.DataSource = db.Dreams.ToList();
        ddlDream.DataBind();
        Control cont = this.Parent;

        }

    }
    public void setData(int dream_id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        ddlDream.DataSource = db.Dreams.ToList();
        ddlDream.DataBind();
        ViewState["selectedDreamID"] = dream_id;


    }

    public void BindData()
    { }

    protected void createPage_Click(object sender, EventArgs e)
    {
        int selected_dream = int.Parse(ViewState["selectedDreamID"].ToString());
        DreamBirdEntities db = new DreamBirdEntities();
        if (chk_copy.Checked)
        {
            
                int dream_id = int.Parse(ddlDream.SelectedItem.Value);
           int page_id = int.Parse(ddlPage.SelectedItem.Value);
           
           DreamLayout dl = db.DreamLayouts.Where(q => q.id == page_id).First();
            if (db.DreamLayouts.Where(q => q.Page == dl.Page && q.DreamID == selected_dream).Count() == 0)
            {
                ErrorMessage.Text = "";
                var dr_new = new DreamLayout
                {
                    DreamID = selected_dream,
                    Description = dl.Description,
                    IsPublished = dl.IsPublished,
                    //NavEnable = dl.NavEnable,
                    Page = dl.Page,
                    Layout = dl.Layout,

                };
                db.DreamLayouts.Add(dr_new);
                db.SaveChanges();
            }
            else
            {
                ShowError("Page Already Exist");
                MyEvents(this, EventArgs.Empty);
            }
               
           
            //pageAdded(this, EventArgs.Empty);

        }
        else
        {
            if(db.DreamLayouts.Where(q => q.Page == PageName.Text && q.DreamID == selected_dream).Count() == 0)
            {
                
                var t = new DreamLayout
                {
                    Page = PageName.Text,
                    DreamID = int.Parse(ViewState["selectedDreamID"].ToString()),
                    //NavEnable = false,
                    IsPublished=true,   //by default all pages are published
                };
                db.DreamLayouts.Add(t);
                db.SaveChanges();
               
            }
           else
            {
                ShowError("Page Already Exist");
                MyEvents(this, EventArgs.Empty);
            }
            
        }
        pageAdded(this, EventArgs.Empty);
    }

    protected void ddlDream_SelectedIndexChanged(object sender, EventArgs e)
    {
        int dream_id = int.Parse(ddlDream.SelectedItem.Value);
        DreamBirdEntities db = new DreamBirdEntities();
       ddlPage.DataSource = db.DreamLayouts.Where(q => q.DreamID == dream_id).ToList();
        ddlPage.DataBind();
       MyEvents(this, EventArgs.Empty);
    }

    protected void copy_rb_CheckedChanged(object sender, EventArgs e)
    {
        if(chk_copy.Checked)
        { 
        copy_panel.Visible = true;
        PageName.Visible = false;
        //    chk_copy.Checked = true;
        MyEvents(this, EventArgs.Empty);
        }
        else
        {
            copy_panel.Visible = false;
            PageName.Visible = true;
          //  chk_copy.Checked = false;
            MyEvents(this, EventArgs.Empty);
        }
        // pageAdded(this, EventArgs.Empty);
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    MyEvents(this, EventArgs.Empty); // inform container control that this is the personal event; this is handy event for example to keep showing the popupExtender control.

    //}

    protected void ddlPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyEvents(this, EventArgs.Empty);

    }
    public void ShowError(String errorMsg)
    {
        ErrorMessage.Text = errorMsg;
        ErrorMessage.Visible = true;
    }
}