using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_LessonMenuManager : System.Web.UI.UserControl, ICoreDreamControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        int ParentLayoutID;

        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        DreamBirdEntities db = new DreamBirdEntities();
        DreamLayout ParentLayout = db.DreamLayouts.Where(q => q.Dream.DreamName == dreamName && q.Page == pageName).First();
        ParentLayoutID = ParentLayout.id;

        Control control = Page.LoadControl("~/Components/LessonMenu/LessonMenuMarkup.ascx");


        ILessonMenuMarkup controlInterface = (ILessonMenuMarkup)control;
        controlInterface.MenuClicked += new EventHandler(menu_Clicked_);

        controlInterface.bindMenu(1, ParentLayoutID);
        PlaceHolder1.Controls.Add(control);
        if (Session["menu_id"] != null)
        {
            int menuID = int.Parse(Session["menu_id"].ToString());

            LessonMenu lm_selected = db.LessonMenus.Where(q => q.id == menuID).First();
            if (lm_selected.menuType.Equals("multimedia"))
            {

            }
            string src = ResolveUrl("~") + "/dreamhome/" + lm_selected.DreamLayout.Dream.DreamName + "/" + lm_selected.DreamLayout.Page;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "SelectMenu('" + src + "','" + lm_selected.id + "')", true);
            Session.Clear();
        }
        if (!IsPostBack)
        {
            if (db.LessonMenus.Any(w => w.ParentLayoutID == ParentLayoutID && w.isDefault == true))
            {
                var defaultmenuid = db.LessonMenus.Where(w => w.ParentLayoutID == ParentLayoutID && w.isDefault == true).First();
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "open_default", "OpenDefaultMenu('" + defaultmenuid.id+"')", true);
                bool isShowNP = Convert.ToBoolean(defaultmenuid.isShowNP);
                if (isShowNP)
                {
                    Next_Previous.Visible = true;
                }
            }
        }


    }
    public void menu_Clicked_(object sender, EventArgs e)
    {
        EventArgLessonMenuClik evt = (EventArgLessonMenuClik)e;
        evt.LessonMenuID = evt.LessonMenuID;
        DreamBirdEntities db = new DreamBirdEntities();
        //get selected menu
        int selected_menu = evt.LessonMenuID;
        //MenuPageDesign.bind_data(selected_menu);
    }

    public void BindData()
    {

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
}