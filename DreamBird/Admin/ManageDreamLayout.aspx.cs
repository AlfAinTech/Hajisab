using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageDreamLayout : System.Web.UI.Page
{
    DreamBirdEntities db;
    protected void Page_Load(object sender, EventArgs e)

    {
      db = new DreamBirdEntities();
        if (!Page.IsPostBack) {
            if (Request.QueryString["DreamID"] != null && Request.QueryString["PageID"] != null)
            {
                int dream_id = int.Parse(Request.QueryString["DreamID"].ToString());
                int layout_id = int.Parse(Request.QueryString["PageID"].ToString());
                //bind dream
                ddlDreams.DataSource = db.Dreams.ToList();
                ddlDreams.DataBind();
                ddlDreams.SelectedValue = dream_id.ToString();
                //bind page
                DreamLayout dreamLayout = db.DreamLayouts.Where(q => q.id == layout_id).First();
                BindContent(dream_id);
                bindPageContents(dreamLayout);


            }
            else
            { 

            ddlDreams.DataSource= db.Dreams.ToList();
           ddlDreams.DataBind();
            int dreamID = int.Parse(ddlDreams.SelectedValue.ToString());
            BindContent(dreamID);
        }
        }
    }

    private void BindContent(int dreamID) {
       List<DreamLayout> allPages = db.DreamLayouts.Where(d => d.DreamID == dreamID).ToList();
        ddlPages.DataSource = allPages;
        ddlPages.DataValueField = "id";
        ddlPages.DataTextField = "page";
        ddlPages.DataBind();
        if (allPages.Count > 0)
        {
            DreamLayout firstPage = allPages[0];
            bindPageContents(firstPage);

        }



    }

    private void bindPageContents(DreamLayout page) {
   
        ddlPages.SelectedValue = page.id.ToString();
        txtContents.Text = page.Layout;
    }

   


    protected void ddlDreams_SelectedIndexChanged(object sender, EventArgs e)
    {
        int dreamID = int.Parse(ddlDreams.SelectedValue.ToString());
        BindContent(dreamID);

    }

    protected void cmdSave_Click(object sender, EventArgs e)
    {
        int dreamID = int.Parse(ddlDreams.SelectedValue.ToString());
        String dreamName = ddlDreams.SelectedItem.Text;
        int pageID =int.Parse(ddlPages.SelectedValue.ToString());
        DreamLayout dreamLayout = db.DreamLayouts.First(d => d.id==pageID);
        dreamLayout.Layout = txtContents.Text;
        db.SaveChanges();

        //Following will store the files in application memory so they can be recompiled
        ArrayList files ;
        if (Application["recompilation_layouts"] != null) {
            files =(ArrayList) Application["recompilation_layouts"];
           
           } else {
            files = new ArrayList();
        }

        files.Add(dreamName);
        Application["recompilation_layouts"] = files;

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
       String dreamName= ddlDreams.SelectedItem.Text.ToString();
        String url = "~/DreamHome/" + dreamName + "/" + ddlPages.SelectedItem.Text;
        Response.Redirect(url);
    }

    protected void ddlPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        int pageID=int.Parse(ddlPages.SelectedValue.ToString());
        DreamBirdEntities db = new DreamBirdEntities();
        DreamLayout page= db.DreamLayouts.Where(pg => pg.id == pageID).First();
        bindPageContents(page);

    }
}