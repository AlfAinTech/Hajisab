using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_NAV_General_NavigationEdit : System.Web.UI.UserControl
{
    public event EventHandler navigationEdited;
    public int navigationID;
    public event EventHandler SomeThingElseDone;
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    // set data of selected item in edit control
    public void setData()
    { 
       //DB Context
            DreamBirdEntities db;
            db = new DreamBirdEntities();

    //Get selected Navigation
        Navigation selected_navigation = db.Navigations.Where(q => q.id == navigationID).First();
            
            Caption_txt.Text = selected_navigation.Caption;
           
           
            nav_id.Text = selected_navigation.id.ToString();

            ViewState["SelectedLayoutID"] = selected_navigation.Layout_id;

    //Get Selected Media item
        MediaItem selected_navigation_img = db.MediaItems.Where(q => q.id == selected_navigation.MediaItem_id).First();
            navImage.ImageUrl = selected_navigation_img.Path100;
            MediaBankControl.setMediaItem(selected_navigation_img.id);
            

    //Bind data to Internal link panel's controls
            ddlDream.DataSource = db.Dreams.ToList();
            ddlDream.DataBind();
            //ddlDream.SelectedValue = selected_navigation.Dream_id.ToString();
            
        //load selected Dream's pages
        int dream_id = System.Int32.Parse(ddlDream.SelectedValue.ToString());
            ddlPage.DataSource = db.DreamLayouts.Where(q => q.DreamID == dream_id).ToList();
            ddlPage.DataBind();
        publishCheck.Checked = (Boolean)selected_navigation.IsPublished;
            
        if (selected_navigation.LinkType == 0)
        {
            ddlDream.ClearSelection();
            string DreamName = DreamUtil.getDreamNameFromURL(selected_navigation.Link);
            ddlDream.Items.FindByText(DreamName).Selected = true;
            ddlPage.ClearSelection();
            int dreamID = Convert.ToInt32(ddlDream.SelectedValue);
            ddlPage.DataSource = db.DreamLayouts.Where(q => q.DreamID == dreamID).ToList();
            ddlPage.DataBind();
            string PageName = DreamUtil.getPageNameFromURL(selected_navigation.Link);
            ddlPage.Items.FindByText(PageName).Selected = true;
            internal_panel.Visible = true;
            LinkInternal.Checked = true;

        }
        else
        {
            ExternalLink_txt.Text = selected_navigation.Link;
            external_panel.Visible = true;
            LinkExternal.Checked = true;

        }
    }


    protected void add_navigation_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db;
        db = new DreamBirdEntities();
        String link = "";
        int link_type = 1;
        int layout_id = 0;
     //get dream
        if (ViewState["SelectedLayoutID"] != null)
        {
            layout_id = (int)ViewState["SelectedLayoutID"];
        }
        //Get media item
        int mediaItem_id = int.Parse(ViewState["selectedImageID"].ToString());//media_item.id;

        //get link for navigation
        if (LinkExternal.Checked == true)
        {
            link = ExternalLink_txt.Text;
            link_type = 1;
        }
        else
        {
            if (LinkInternal.Checked == true)
            {
                link = "~/DreamHome/" + ddlDream.SelectedItem.Text + "/" + ddlPage.SelectedItem.Text;
                link_type = 0;
            }
        }

         navigationID = int.Parse(nav_id.Text);
         Navigation nav =  db.Navigations.Where(q => q.id == navigationID).First();
         nav.Caption = Caption_txt.Text.ToString();
         nav.MediaItem_id = mediaItem_id;
         nav.Link = link;
        nav.LinkType = link_type;
         if (publishCheck.Checked)
         {
            nav.IsPublished = true;
          }
          else 
          {
            nav.IsPublished = false;
          }
        

    //Update selected Navigation
        db.Entry(nav).State = System.Data.Entity.EntityState.Modified;
        db.SaveChanges();

       navigationEdited(this, EventArgs.Empty);
    }

   

    
    protected void Link_CheckedChanged(object sender, EventArgs e)
    {
        if (LinkExternal.Checked == true)
        {
            internal_panel.Visible = false;
            external_panel.Visible = true;
        }
        else
        {
            if (LinkInternal.Checked == true)
            {
                internal_panel.Visible = true;
                external_panel.Visible = false;
            }
        }
    }

    protected void ddlDream_SelectedIndexChanged(object sender, EventArgs e)
    {
        int dream_id = System.Int32.Parse(ddlDream.SelectedValue.ToString());
        DreamBirdEntities db;
        db = new DreamBirdEntities();
        ddlPage.DataSource = db.DreamLayouts.Where(q => q.DreamID == dream_id).ToList();
        ddlPage.DataBind();
    }



    protected void cmdSelectImage_Click(object sender, EventArgs e)
    {

    }

    protected void MediaBankControl1_MediaSelected(object sender, EventArgs e)
    {

        MediaItem media_item;
        media_item = MediaBankControl.SelectedMediaItem;
        navImage.ImageUrl = media_item.path+media_item.name;
        ViewState["selectedImageID"] = media_item.id;
    }
    protected void MediaBankControl1_MyEvents(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();

    }


    protected void cancel_Click(object sender, EventArgs e)
    {
        navigationEdited(this, EventArgs.Empty);
    }
}