using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_PageTemplate : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //ListItem lst = new ListItem();
            //lst.Text = "Select a page to copy its contents";
            
            //DreamBirdEntities db = new DreamBirdEntities();
            //page_list.DataSource = db.ClientPages.Select(s => new { Page = s.Dream.DreamName + " : " + s.Page, id = s.Dream.id}).ToList();

            //page_list.DataTextField = "Page";
            //page_list.DataValueField = "id";
            //page_list.DataBind();
            //page_list.Items.Insert(0, lst);

        }
    }

    public void LoadTemplateString()
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "template_script", "LoadTemplateScripts($);", true);
    }
}