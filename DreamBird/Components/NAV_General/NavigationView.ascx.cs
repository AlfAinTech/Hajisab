using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_NAV_General_NavigationView : CoreDreamControlAdapter
{
    public event EventHandler navigationEdit;

    private bool enableEditing = false;

    public bool EnableEditing
    {
        get
        {
            return enableEditing;
        }

        set
        {
            enableEditing = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    
   
        DreamBirdEntities db;
        db = new DreamBirdEntities();
        if (!IsPostBack)
        {
            BindData();
        }
       

    }
    private void BindContent(int dreamID)
    {

    }

    protected void Img_dd_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    override
    public void BindData()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int Layout_id = 0;

        if (Request.QueryString["PID"] == null) { 
            String url = string.Format("{0}", Page.Request.Url.PathAndQuery);
            String dream_name = DreamUtil.getDreamNameFromURL(url).ToString();
            string page_name = DreamUtil.getPageNameFromURL(url).ToString();
            if (db.DreamLayouts.Any(a => a.Page == page_name && a.Dream.DreamName == dream_name))
            {Layout_id = db.DreamLayouts.Where(a => a.Page == page_name && a.Dream.DreamName == dream_name).First().id; }
            else if (ViewState["SelectedLayoutID"] != null)
            {
                Layout_id = (int)ViewState["SelectedLayoutID"];
            }
        }
        else
        {
            Layout_id = int.Parse(Request.QueryString["PID"].ToString());
        }
       


        if (!enableEditing)
        {
            Nav_data_list.DataSource = db.Navigations.Where(q => q.Layout_id == Layout_id && q.IsPublished == true).ToList();

        }
        else
        {
            Nav_data_list.DataSource = db.Navigations.Where(q => q.Layout_id == Layout_id).ToList();


        }
        Nav_data_list.DataBind();


    }

    override
    public void BindData2(int layout_id = 0)
    {
        ViewState["SelectedLayoutID"] = layout_id;
        DreamBirdEntities db = new DreamBirdEntities();

        if (!enableEditing)
        {
            Nav_data_list.DataSource = db.Navigations.Where(q => q.Layout_id == layout_id && q.IsPublished == true).ToList();

        }
        else
        {
            Nav_data_list.DataSource = db.Navigations.Where(q => q.Layout_id == layout_id).ToList();
            


        }
        Nav_data_list.DataBind();


    }


    override
  public void OnHideAdminEvent(object sender, EventArgs e)
    {
        BindData();

    }



    protected void set_enableEditing(object sender, RepeaterItemEventArgs e)
    {
        if (enableEditing)
        {
            LinkButton a = (LinkButton)e.Item.FindControl("edit_nav");
            a.Visible = true;


        }
        else
        {
            LinkButton a = (LinkButton)e.Item.FindControl("edit_nav");
            a.Visible = false;



        }
    }

    protected void edit_nav_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int ID = int.Parse(btn.CommandArgument);
        EventArgNavigation evt = new EventArgNavigation();
        evt.SelectedNavigationID = ID;
        navigationEdit(this, evt);

    }

  
}