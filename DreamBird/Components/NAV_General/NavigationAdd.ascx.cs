using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_NAV_General_NavigationAdd :  CoreDreamControlAdapter,ICoreUserControl
{
    public event EventHandler navigationAdded;
    public event EventHandler SomeThingDone;

    override
    public void BindData2(int id)
    {
        ViewState["SelectedDreamID"] = id;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DreamBirdEntities db;
            db = new DreamBirdEntities();
            ddlDream.DataSource = db.Dreams.ToList();
            ddlDream.DataBind();
            //load selected Dream's pages
            int dream_id = System.Int32.Parse(ddlDream.SelectedValue.ToString());
            ddlPage.DataSource = db.DreamLayouts.Where(q => q.DreamID == dream_id).ToList();
            ddlPage.DataBind();
            // var selected_icon = ddlIcon.SelectedItem.Value;
            // ddlPage.DataSource = db.DreamLayouts.Where(q => q.dre)ToList();

        }
    }

    protected void add_navigation_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db;
        db = new DreamBirdEntities();
        String link = "";
        int link_type = 1;
        Boolean is_published = published.Checked;
        //get dream
        String url = string.Format("{0}", Page.Request.Url.PathAndQuery);
        int page_id = int.Parse(Request.QueryString["PID"].ToString());
        int layout_id = 0;

        if (db.DreamLayouts.Any(a => a.id == page_id))
        {
            layout_id = db.DreamLayouts.Where(a => a.id == page_id).First().id;

        }
        else if (ViewState["SelectedDreamID"] != null)
        {
            layout_id = (int)ViewState["SelectedDreamID"];
        }
        else
        {
            layout_id = 0;
        }
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


        var t = new Navigation //Make sure you have a table called test in DB
        {
            Caption = Caption_txt.Text.ToString(),
            MediaItem_id = mediaItem_id,
            Layout_id = layout_id,
            Link = link,
            LinkType = link_type,
            IsPublished = is_published,
            
            
            

        };
        db.Navigations.Add(t);
        db.SaveChanges();
        this.clearControl();
        navigationAdded(this, EventArgs.Empty);
    }

    protected void LinkExternal_CheckedChanged(object sender, EventArgs e)
    {
        //internal_panel.Visible = false;
        //external_panel.Visible = true;
    }

    protected void LinkInternal_CheckedChanged(object sender, EventArgs e)
    {


    }
    protected void Link_CheckedChanged(object sender, EventArgs e)
    {
        //external_panel.Visible = false;
        //internal_panel.Visible = true;
        if (LinkExternal.Checked == true)
        {
            external_panel.Visible = false;
            internal_panel.Visible = true;
        }
        else
        {
            if (LinkInternal.Checked == true)
            {
                external_panel.Visible = true;
                internal_panel.Visible = false;
            }
        }
        if (SomeThingDone != null) { 
        SomeThingDone(sender, EventArgs.Empty);
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



    

    protected void MediaBankControl1_MediaSelected(object sender, EventArgs e)
    {

        MediaItem media_item;
        media_item = MediaBankControl.SelectedMediaItem;

        navImage.ImageUrl = media_item.PathWithResolution;
        navImg_id.Text = media_item.id.ToString();
       ViewState["selectedImageID"] = media_item.id;
    }
    protected void MediaBankControl1_MyEvents(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
        if(SomeThingDone != null)
        {
            SomeThingDone(sender, EventArgs.Empty);
        }
       
    }
    



    protected void cancel_Click(object sender, EventArgs e)
    {
        navigationAdded(this, EventArgs.Empty);

    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
       
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
       
    }

    protected void MediaBankControl_SomeThindDone(object sender, EventArgs e)
    {
        if(SomeThingDone != null)
        {
            SomeThingDone(this, EventArgs.Empty);
        }
    }

    public void clearControl()
    {
        Caption_txt.Text = string.Empty; 
        navImage.ImageUrl = string.Empty;
        navImg_id.Text = string.Empty;
        LinkInternal.Checked = false;
        LinkExternal.Checked = false;
        external_panel.Visible = false;
        internal_panel.Visible = false;
        ViewState.Clear();

    }
}