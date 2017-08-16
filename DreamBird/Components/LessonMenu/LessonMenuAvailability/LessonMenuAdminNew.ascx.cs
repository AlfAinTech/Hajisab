using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_LessonMenuAvailability_LessonMenuAdminNew : System.Web.UI.UserControl
{
    static int parentLayoutID;
    protected void Page_Load(object sender, EventArgs e)
    {

        int PageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
        BindData(PageID);

        //ErrorMessage.Visible = false;
    }

    public void BindData(int PageID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        ViewState["ParentLayoutID"] = PageID;

        //var LessonMenu = db.LessonMenus.Where(w => w.ParentLayoutID == PageID).First();
        //int ParentMenuID = Convert.ToInt32(LessonMenu.parentMenu_id);
        ViewState["ParentMenuID"] = 1;

        MenuOrder.bindMenu(1, PageID);

        if (!IsPostBack)
        {

            //userRoles.DataSource = db.AspNetRoles.Where(w => w.Name != "Admin").ToList();
            //userRoles.DataTextField = "Name";
            //userRoles.DataValueField = "Name";
            //userRoles.DataBind();
            if (Request.QueryString["PID"] != null)
            {
                int id = int.Parse(Request.QueryString["PID"].ToString());
                if (db.DreamLayouts.Where(q => q.id == id).Count() != 0)
                {
                    ViewState["PID"] = parentLayoutID = id;

                    //LessonMenuList.bindData(parentLayoutID);
                    //LessonMenuList1.bindData(parentLayoutID);
                    //LessonMenuList2.bindData(parentLayoutID);
                    //LessonMenuList3.bindData(parentLayoutID);
                }
                else { Response.Redirect(Request.RawUrl); }
            }
            else { Response.Redirect(Request.RawUrl); }
        }
    }

    protected void MenuOrder_MenuClicked(object sender, EventArgs e)
    {
        EventArgLessonMenuClik evt = (EventArgLessonMenuClik)e;
        int selected_menu = evt.LessonMenuID;
        ViewState["SelectedMenuID"] = selected_menu;
        //container_chk.Visible = true;
        //bind_Data(selected_menu);
        //LessonAvailabilityAdmin1.bindData(selected_menu);
        DreamBirdEntities db = new DreamBirdEntities();
        int PageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
        var LessonMenu = db.LessonMenus.Where(w => w.id == selected_menu).First();
        int ParentMenuID = Convert.ToInt32(LessonMenu.parentMenu_id);
        MenuOrder.bindMenu(1, PageID);
        Page_design.Visible = true;
        Menu_Detail.Visible = false;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "type_alert", "SortableCode();", true);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "highlite_menu", "$('li[data-id=" + '"' + selected_menu + '"' + "]').children('a:first').addClass('active').parents('.collapse').addClass('in');", true);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "retrive_layout", "callFetcher('" + LessonMenu.DreamLayout.Page + "', " + LessonMenu.DreamLayout.DreamID + ");", true);

    }





    protected void MenuOrder_MenuRefresh(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int PageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
        ViewState["ParentLayoutID"] = PageID;
        if (db.LessonMenus.Any(a => a.ParentLayoutID == PageID))
        {
            var LessonMenu = db.LessonMenus.Where(w => w.ParentLayoutID == PageID).First();
            int ParentMenuID = Convert.ToInt32(LessonMenu.parentMenu_id);
            ViewState["ParentMenuID"] = ParentMenuID;

            MenuOrder.bindMenu(ParentMenuID, PageID);
        }
        else
        {
            ViewState["ParentMenuID"] = 1;
        }
    }

    protected void LessonMenuList3_menuClicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        EventArgLessonMenuClik evt = e as EventArgLessonMenuClik;
        int CurrentMenuID = evt.LessonMenuID;
        //next_page.Text = db.LessonMenus.Where(w => w.id == CurrentMenuID).Select(s => s.DisplayName).First();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_open_tab", "$('a[href=" + "#availability" + "]').tab('show')", true);
    }


    protected void MenuEdited(object sender, EventArgs e)
    {
        Page_design.Visible = false;
        Menu_Detail.Visible = true;
        EventArgLessonMenuClik evt = e as EventArgLessonMenuClik;
        int MenuID = evt.LessonMenuID;
        EditMenuDetails.EditDataBind(MenuID);
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_show_modal", "$('#MenuDetailModal').modal('show');", true);

    }

    protected void LessonMenuList2_menuClicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        EventArgLessonMenuClik evt = e as EventArgLessonMenuClik;
        int CurrentMenuID = evt.LessonMenuID;
        //previous_page.Text = db.LessonMenus.Where(w => w.id == CurrentMenuID).Select(s => s.DisplayName).First();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_open_tab", "$('a[href=" + "#availability" + "]').tab('show')", true);
    }

    protected void LessonAvailabilityAdmin1_ShowPopup(object sender, EventArgs e)
    {

    }


    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        EditMenuDetails.save_menu_ServerClick();
    }

    protected void MenuDetailSaved(object sender, EventArgs e)
    {
        int PageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
        MenuOrder.bindMenu(1, PageID);
    }
}