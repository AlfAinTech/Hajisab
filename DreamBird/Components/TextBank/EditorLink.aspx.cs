using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_EditorLink : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            
            DreamBirdEntities db = new DreamBirdEntities();
            ddl_dream.DataSource = db.Dreams.ToList();
            ddl_dream.DataTextField = "DreamName";
            ddl_dream.DataValueField = "id";
            ddl_dream.DataBind();
            Uri myUri = new Uri(HttpContext.Current.Request.ServerVariables["HTTP_REFERER"].ToString());
            string param1 = HttpUtility.ParseQueryString(myUri.Query).Get("DID");
            string param2 = HttpUtility.ParseQueryString(myUri.Query).Get("PID");
            ViewState["ParentURL"] = myUri.OriginalString;
            if (param1 != null)
            {
                ddl_dream.SelectedValue = param1;
                ddl_dream.Enabled = false;
                int dreamid = Convert.ToInt32(ddl_dream.SelectedValue);
                var LessonMenuPages = db.LessonMenus.Select(s => s.DreamLayoutID).ToList();
                ddl_page.DataSource = db.DreamLayouts.Where(w => !LessonMenuPages.Contains(w.id) && w.DreamID == dreamid).ToList();
                ddl_page.DataTextField = "Page";
                ddl_page.DataValueField = "id";
                ddl_page.DataBind();
                //if(param2 != null)
                //{
                //    ddl_page.SelectedValue = param2;
                //    ddl_page.Enabled = false;
                //    int selectedlayout = Convert.ToInt32(ddl_page.SelectedValue);
                //    LessonMenuList.bindData(selectedlayout);
                //}
                //else
                //{
                    ListItem lst = new ListItem();
                    lst.Value = "0";
                    lst.Text = "Select Dream Page";
                    ddl_page.Items.Insert(0, lst);
                //}
                
            }
            else
            {
                ListItem lst = new ListItem();
                lst.Value = "0";
                lst.Text = "Select Dream";
                ddl_dream.Items.Insert(0, lst);
            }
            
        }
    }

    protected void ddl_dream_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddl_dream.SelectedValue != "0")
        {
            int dreamid = Convert.ToInt32(ddl_dream.SelectedValue);
            DreamBirdEntities db = new DreamBirdEntities();
            var LessonMenuPages = db.LessonMenus.Select(s => s.ParentLayoutID).ToList();
            ddl_page.DataSource = db.DreamLayouts.Where(w => LessonMenuPages.Contains(w.id) && w.DreamID == dreamid).ToList();
            ddl_page.DataTextField = "Page";
            ddl_page.DataValueField = "id";
            ddl_page.DataBind();
            ListItem lst = new ListItem();
            lst.Value = "0";
            lst.Text = "Select Dream Page";
            ddl_page.Items.Insert(0, lst);
        }
    }

    protected void ddl_page_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddl_option.SelectedValue == "Menu")
        {
            LessonMenuList.Visible = true;
            int selectedlayout = Convert.ToInt32(ddl_page.SelectedValue);
            LessonMenuList.bindData(selectedlayout);
        }
        else if(ddl_option.SelectedValue == "Dream")
        {
            DreamBirdEntities db = new DreamBirdEntities();
            Uri myUri = new Uri(ViewState["ParentURL"].ToString());
            int param1 = Convert.ToInt32(HttpUtility.ParseQueryString(myUri.Query).Get("DID"));
            int param2 = Convert.ToInt32(HttpUtility.ParseQueryString(myUri.Query).Get("PID"));
            var LessonMenuPages = db.LessonMenus.Select(s => s.ParentLayoutID).ToList();
            string DreamName = db.DreamLayouts.Where(w => w.DreamID == param1 && w.id == param2).Select(s => s.Dream.DreamName).First();
            string PageName = db.DreamLayouts.Where(w => w.DreamID == param1 && LessonMenuPages.Contains(w.id)).Select(s => s.Page).First();
            string LinkAddress = "AddLink('../DreamHome/" + DreamName + "/" + PageName + "');";
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "add_link", LinkAddress, true);
        }
        
    }

    protected void LessonMenuList_menuClicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        EventArgLessonMenuClik evt = (EventArgLessonMenuClik)e;
        int selected_menu = evt.LessonMenuID;
        string MenuName = db.LessonMenus.Where(w => w.id == selected_menu).Select(s => s.menuName).First();
        Uri myUri = new Uri(ViewState["ParentURL"].ToString());
        int param1 = Convert.ToInt32(HttpUtility.ParseQueryString(myUri.Query).Get("DID"));
        int param2 = Convert.ToInt32(HttpUtility.ParseQueryString(myUri.Query).Get("PID"));
        var LessonMenuPages = db.LessonMenus.Select(s => s.ParentLayoutID).ToList();
        string DreamName = db.DreamLayouts.Where(w => w.DreamID == param1 && w.id == param2).Select(s => s.Dream.DreamName).First();
        string PageName = db.DreamLayouts.Where(w => w.DreamID == param1 && LessonMenuPages.Contains(w.id)).Select(s => s.Page).First();
        string LinkAddress = "AddLink('../DreamHome/"+DreamName +"/"+MenuName+"?FID="+selected_menu+"');";
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "add_link", LinkAddress, true);
    }

    protected void ddl_option_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddl_option.SelectedValue == "Menu")
        {
            LessonMenuList.Visible = true;
            ddl_page.SelectedValue = "0";
        }
        else if (ddl_option.SelectedValue == "Dream")
        {
            LessonMenuList.Visible = false;
            ddl_page.SelectedValue = "0";
            //ddl_page.Enabled = true;
        }
    }
}