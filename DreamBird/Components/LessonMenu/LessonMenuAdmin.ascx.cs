using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_LessonMenuAdmin : System.Web.UI.UserControl, ICoreUserControl, ICoreDreamControl
{
    static int parentLayoutID;
    protected void Page_Load(object sender, EventArgs e)
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
        if (!IsPostBack)
        {

            userRoles.DataSource = db.AspNetRoles.Where(w => w.Name != "Admin").ToList();
            userRoles.DataTextField = "Name";
            userRoles.DataValueField = "Name";
            userRoles.DataBind();
            if (Request.QueryString["PID"] != null)
            {
                int id = int.Parse(Request.QueryString["PID"].ToString());
                if (db.DreamLayouts.Where(q => q.id == id).Count() != 0)
                {
                    ViewState["PID"] = parentLayoutID = id;

                    //LessonMenuList.bindData(parentLayoutID);
                    LessonMenuList1.bindData(parentLayoutID);
                    LessonMenuList2.bindData(parentLayoutID);
                    LessonMenuList3.bindData(parentLayoutID);
                }
                else { Response.Redirect(Request.RawUrl); }
            }
            else { Response.Redirect(Request.RawUrl); }
        }
        ErrorMessage.Visible = false;

    }

    protected void delete_menu_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int id = int.Parse(btn.CommandArgument);
        delete_menu(id);

    }
    protected void delete_menu(int id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        List<LessonMenu> child_list = db.LessonMenus.Where(q => q.parentMenu_id == id).ToList();
        foreach (LessonMenu child in child_list)
        {
            delete_menu(child.id);
        }
        LessonMenu lm_parent = db.LessonMenus.Where(q => q.id == id).First();
        var DreamLayoutID = db.LessonMenus.Where(w => w.id == id).Select(s => s.DreamLayoutID).First();
        DreamLayout layout = db.DreamLayouts.Where(w => w.id == DreamLayoutID).First();
        db.DreamLayouts.Remove(layout);
        db.LessonMenus.Remove(lm_parent);

        db.SaveChanges();
        //LessonMenuList.bindData(parentLayoutID);
        int parent_id = int.Parse(ViewState["SelectedMenuID"].ToString());
        Lesson_menu_list.DataSource = db.LessonMenus.Where(q => q.parentMenu_id == parent_id).ToList();
        Lesson_menu_list.DataBind();
    }

    protected void add_Childmenu_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //get control for insert new lesson menu
            TextBox menuName_add = (TextBox)(((Button)sender).Parent).FindControl("menuName_add");
            TextBox displayName_add = (TextBox)(((Button)sender).Parent).FindControl("displayName_add");
            CheckBox isContainer_chk_add = (CheckBox)(((Button)sender).Parent).FindControl("isContainer_chk_add");
            DreamBirdEntities db = new DreamBirdEntities();
            DreamLayout dream_selected = db.DreamLayouts.Where(q => q.id == parentLayoutID).First();
            //get Selected menu control id from viewstate
            int menu_id = int.Parse(ViewState["SelectedMenuID"].ToString());





            //If menu is not container add its page
            Create_Menu(dream_selected.id, menuName_add.Text, displayName_add.Text, menu_id, isContainer_chk_add.Checked, "user", "none");

            Lesson_menu_list.DataSource = db.LessonMenus.Where(q => q.parentMenu_id == menu_id).ToList();
            Lesson_menu_list.DataBind();
            ViewState["SelectedMenuID"] = menu_id;
        }
    }


    protected void save_menu_btn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            int PageLayoutID = Convert.ToInt32(ViewState["ParentLayoutID"]);
            DreamLayout parent_layout = db.DreamLayouts.Where(q => q.id == PageLayoutID).First();
            if (ViewState["SelectedMenuID"] == null)
            {
                Create_Menu(parentLayoutID, menuName.Text, displayName.Text, 1, container_chk.Checked, menuRight.SelectedValue, menuType_list.SelectedValue);
                this.clearControl();
            }
            else
            {

                int menu_id = int.Parse(ViewState["SelectedMenuID"].ToString());
                LessonMenu lm = db.LessonMenus.Where(q => q.id == menu_id).First();
                lm.menuName = menuName.Text;
                lm.DisplayName = displayName.Text;
                lm.menuRight = menuRight.SelectedValue;
                lm.IsContainer = container_chk.Checked;
                lm.menuType = menuType_list.SelectedValue;
                lm.isDefault = isDefault.Checked;
                lm.isShowNP = isShowNP.Checked;
                //lm.AppOrder = db.LessonMenus.Where(w => w.parentMenu_id == lm.parentMenu_id).Count();
                db.SaveChanges();
                var roleList = db.DreamPageAuthorizations.Where(w => w.DreamLayout_id == lm.DreamLayoutID).ToList();
                foreach (ListItem lst in userRoles.Items)
                {
                    foreach (var role in roleList)
                    {
                        if (role.PageRole == lst.Text)
                        {
                            role.isAllowed = lst.Selected;
                        }
                    }
                }
                db.SaveChanges();
                if (container_chk.Checked)
                {
                    // NonContainer_to_container(menu_id);
                    foreach (RepeaterItem lem in Lesson_menu_list.Items)
                    {
                        TextBox menuname = (TextBox)lem.FindControl("menuName");
                        TextBox displayname = (TextBox)lem.FindControl("displayName");
                        CheckBox isContainer = (CheckBox)lem.FindControl("is_container");
                        Label id = (Label)lem.FindControl("id");
                        int child_meunID = int.Parse(id.Text.ToString());
                        LessonMenu child = db.LessonMenus.Where(q => q.id == child_meunID).First();
                        child.menuName = menuname.Text;
                        child.DisplayName = displayname.Text;
                        child.IsContainer = isContainer.Checked;
                        db.SaveChanges();
                    }
                }
                else { /*Container_to_Noncontainer(menu_id);*/ }
                MenuPageDesign.bind_data(menu_id);
                MenuPageMarkup.bind_data(menu_id);
            }
            int ParentMenuID = Convert.ToInt32(ViewState["ParentMenuID"]);
            MenuOrder.bindMenu(ParentMenuID, PageLayoutID);
            //LessonMenuList.bindData(parentLayoutID);
        }
    }
    public void ShowError(String errorMsg)
    {
        ErrorMessage.Text = errorMsg;
        ErrorMessage.Visible = true;
    }



    protected void container_chk_CheckedChanged(object sender, EventArgs e)
    {
        if (ViewState["SelectedMenuID"] != null)
        {
            //PageMarkup_panel.Visible = false;
            //PageDesign_panel.Visible = false;
            container_panel.Visible = container_chk.Checked;
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_tab", "OpenContainerTab();", true);
        }
    }
    protected void menuClick_clicked(object sender, EventArgs e)
    {
        EventArgLessonMenuClik evt = (EventArgLessonMenuClik)e;
        int selected_menu = evt.LessonMenuID;
        ViewState["SelectedMenuID"] = selected_menu;
        container_chk.Visible = true;
        bind_Data(selected_menu);
        LessonAvailabilityAdmin1.bindData(selected_menu);

    }



    protected void add_menu_Click(object sender, EventArgs e)
    {
        container_panel.Visible = false;
        //Page_markup.Visible = Page_Design.Visible = false;
        this.clearControl();
    }
    protected void bind_Data(int id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        LessonMenu selected_menu = db.LessonMenus.Where(q => q.id == id).First();
        int layout_id = Convert.ToInt32(selected_menu.DreamLayoutID);
        menuName.Text = selected_menu.menuName;
        menuName.Enabled = false;
        displayName.Text = selected_menu.DisplayName;
        menuRight.SelectedValue = selected_menu.menuRight;
        menuType_list.SelectedValue = selected_menu.menuType;
        container_chk.Checked = selected_menu.IsContainer;
        container_panel.Visible = selected_menu.IsContainer;
        isDefault.Checked = Convert.ToBoolean(selected_menu.isDefault);
        isShowNP.Checked = Convert.ToBoolean(selected_menu.isShowNP);
        LessonMenuList1.SetCheckBoxes(selected_menu.id);
        if (selected_menu.previous_LayoutID != null)
        {
            previous_page.Text = db.LessonMenus.Where(w => w.id == selected_menu.previous_LayoutID).Select(s => s.DisplayName).First();
        }
        else
        {
            if (selected_menu.parentMenu_id != 1)
            {
                if (db.LessonMenus.Any(a => a.AppOrder == selected_menu.AppOrder - 1 && a.parentMenu_id == selected_menu.parentMenu_id))
                {
                    previous_page.Text = db.LessonMenus.Where(w => w.AppOrder == selected_menu.AppOrder - 1 && w.parentMenu_id == selected_menu.parentMenu_id).Select(s => s.DisplayName).First();
                }
                else
                {
                    previous_page.Text = db.LessonMenus.Where(w => w.id == selected_menu.parentMenu_id).Select(s => s.DisplayName).First();
                }
            }
            else if (selected_menu.AppOrder == 1)
            {
                previous_page.Text = "";
            }
            else
            {
                if (db.LessonMenus.Any(a => a.ParentLayoutID == selected_menu.ParentLayoutID && a.AppOrder == selected_menu.AppOrder - 1 && a.IsContainer == true))
                {
                    int secondParentMenuid = db.LessonMenus.Where(w => w.ParentLayoutID == selected_menu.ParentLayoutID && w.parentMenu_id == 1 && w.AppOrder == selected_menu.AppOrder - 1).Select(s => s.id).First();
                    int noOfchilds = db.LessonMenus.Where(w => w.parentMenu_id == secondParentMenuid).Count();
                    previous_page.Text = db.LessonMenus.Where(w => w.ParentLayoutID == selected_menu.ParentLayoutID && w.parentMenu_id == secondParentMenuid && w.AppOrder == noOfchilds).Select(s => s.DisplayName).First();
                }
                else if (db.LessonMenus.Any(a => a.ParentLayoutID == selected_menu.ParentLayoutID && a.AppOrder == selected_menu.AppOrder - 1 && a.IsContainer == false))
                {
                    previous_page.Text = db.LessonMenus.Where(w => w.ParentLayoutID == selected_menu.ParentLayoutID && w.AppOrder == selected_menu.AppOrder - 1).Select(s => s.DisplayName).First();
                }
                else
                {
                    previous_page.Text = "";
                }
            }
        }
        if (selected_menu.next_LayoutID != null)
        {
            next_page.Text = db.LessonMenus.Where(w => w.id == selected_menu.next_LayoutID).Select(s => s.DisplayName).First();
        }
        else
        {
            if (selected_menu.IsContainer)
            {
                next_page.Text = db.LessonMenus.Where(w => w.parentMenu_id == selected_menu.id && w.AppOrder == 1).Select(s => s.DisplayName).First();
            }
            else
            {
                if (db.LessonMenus.Any(w => w.parentMenu_id == selected_menu.parentMenu_id && w.ParentLayoutID == selected_menu.ParentLayoutID && w.AppOrder == selected_menu.AppOrder + 1))
                {
                    next_page.Text = db.LessonMenus.Where(w => w.parentMenu_id == selected_menu.parentMenu_id && w.ParentLayoutID == selected_menu.ParentLayoutID && w.AppOrder == selected_menu.AppOrder + 1).Select(s => s.DisplayName).First();
                }
                else
                {
                    int? appOrderOfParent = db.LessonMenus.Where(w => w.id == selected_menu.parentMenu_id).Select(s => s.AppOrder).First();
                    if (db.LessonMenus.Any(a => a.id == selected_menu.parentMenu_id && a.AppOrder == appOrderOfParent + 1))
                    {
                        next_page.Text = db.LessonMenus.Where(w => w.id == selected_menu.parentMenu_id && w.AppOrder == appOrderOfParent + 1).Select(s => s.DisplayName).First();
                    }
                    else
                    {
                        next_page.Text = "";
                    }
                }
            }
        }
        Lesson_menu_list.DataSource = db.LessonMenus.Where(q => q.parentMenu_id == id).ToList();
        //bind data to related panels
        Lesson_menu_list.DataBind();
        MenuPageMarkup.bind_data(id);
        MenuPageDesign.bind_data(id);
        //Page_markup.Visible = Page_Design.Visible = true;//!selected_menu.IsContainer;
        link_Availability.Visible = selected_menu.IsContainer;
        if (!(db.DreamPageAuthorizations.Any(a => a.DreamLayout_id == layout_id)))
        {
            var rolelst = db.AspNetRoles.Where(w => w.Name != "Admin").ToList();
            foreach (var role in rolelst)
            {
                DreamPageAuthorization dpa = new DreamPageAuthorization();
                dpa.DreamLayout_id = layout_id;
                dpa.PageRole = role.Name;
                dpa.isAllowed = false;
                db.DreamPageAuthorizations.Add(dpa);
            }
            db.SaveChanges();
        }
        var PageRoles = db.DreamPageAuthorizations.Where(w => w.DreamLayout_id == layout_id);

        foreach (ListItem li in userRoles.Items)
        {
            foreach (var pagerole in PageRoles)
            {
                if (pagerole.PageRole == li.Text)
                {
                    li.Selected = Convert.ToBoolean(pagerole.isAllowed);
                }
            }
        }
    }
    protected void Create_Menu(int parentLayoutID, String menuName, String displayName, int ParentMenu_id, Boolean isContainer, String menuRight, String menuType)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        DreamLayout parent_layout = db.DreamLayouts.Where(q => q.id == parentLayoutID).First();
        if (db.LessonMenus.Where(q => (q.menuName == menuName || q.DisplayName == displayName) && q.ParentLayoutID == parent_layout.id).Count() != 0)
        {
            ShowError("Menu Already Exist");
            return;
        }
        DreamLayout dl = new DreamLayout
        {
            DreamID = parent_layout.DreamID,
            IsPublished = true,
            IsPublicDefaultPage = false,
            IsUserDefaultPage = false,
            Page = menuName,
            Layout = "Hello World",
        };

        db.DreamLayouts.Add(dl);
        db.SaveChanges();
        if (!(db.DreamPageAuthorizations.Any(a => a.DreamLayout_id == dl.id)))
        {
            var rolelst = db.AspNetRoles.Where(w => w.Name != "Admin").ToList();
            foreach (var role in rolelst)
            {
                DreamPageAuthorization dpa = new DreamPageAuthorization();
                dpa.DreamLayout_id = dl.id;
                dpa.PageRole = role.Name;
                dpa.isAllowed = false;
                db.DreamPageAuthorizations.Add(dpa);
            }
            db.SaveChanges();
        }
        //Create child menu
        LessonMenu t = new LessonMenu
        {
            menuName = menuName,
            DisplayName = displayName,
            IsContainer = isContainer,
            parentMenu_id = ParentMenu_id,
            ParentLayoutID = parentLayoutID,
            DreamLayoutID = dl.id,
            menuRight = menuRight,
            menuType = menuType,
            AppOrder = db.LessonMenus.Where(w => w.parentMenu_id == ParentMenu_id && w.ParentLayoutID == parentLayoutID).Count() + 1,
            isDefault = false
        };
        db.LessonMenus.Add(t);

        db.SaveChanges();


    }
    //protected void menu_setting_click(object sender, EventArgs e)
    //{
    //    PageMarkup_panel.Visible = false;
    //    PageDesign_panel.Visible = false;
    //    setting_panel.Visible = true;


    //}
    //protected void menu_pageDesign_Click(object sender, EventArgs e)
    //{
    //    PageMarkup_panel.Visible = false;
    //    setting_panel.Visible = false;
    //    PageDesign_panel.Visible = true;
    //   // MenuPageDesign.bind_data(parentLayoutID);

    //}
    //protected void menu_pageDMarkup_click(object sender, EventArgs e)
    //{
    //    setting_panel.Visible = false;
    //    PageDesign_panel.Visible = false;
    //    PageMarkup_panel.Visible = true;
    //    // MenuPageMarkup.bind_data(parentLayoutID);
    //}

    public void clearControl()
    {
        ViewState.Clear();
        menuName.Text = String.Empty;
        menuName.Enabled = true;
        displayName.Text = string.Empty;
        container_chk.Checked = false;
        foreach (ListItem lst in userRoles.Items)
        {
            lst.Selected = false;
        }

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



    protected void link_Availability_Click(object sender, EventArgs e)
    {
        int menu_id = int.Parse(ViewState["SelectedMenuID"].ToString());
        LessonAvailabilityAdmin1.bindData(menu_id);
        ModalPopupExtender1.Show();


    }
    protected void show_popup_popup(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    protected void getPreReqList_Click(object sender, EventArgs e)
    {

    }

    protected void LessonMenuList1_checkChanged(object sender, EventArgs e)
    {
        if (ViewState["SelectedMenuID"] != null)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            int menu_id = int.Parse(ViewState["SelectedMenuID"].ToString());
            EventArgDreamEdit evt = e as EventArgDreamEdit;
            int sub_menuID = evt.DreamEditID;
            if (evt.IsChecked)
            {
                LessonMenuPreRequisite lmp = new LessonMenuPreRequisite();
                lmp.menu_id = menu_id;
                lmp.pre_req_menu_id = sub_menuID;
                db.LessonMenuPreRequisites.Add(lmp);
                db.SaveChanges();
            }
            else
            {
                LessonMenuPreRequisite lmp = db.LessonMenuPreRequisites.Where(w => w.menu_id == menu_id && w.pre_req_menu_id == sub_menuID).First();
                db.LessonMenuPreRequisites.Remove(lmp);
                db.SaveChanges();
            }
            ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "key_open", "$('#collapseExample').addClass('in');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "type_alert", "alert('Select a Menu from the left list first');", true);
        }
    }

    protected void LessonMenuList2_menuClicked(object sender, EventArgs e)
    {
        if (ViewState["SelectedMenuID"] != null)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            int menu_id = int.Parse(ViewState["SelectedMenuID"].ToString());
            EventArgLessonMenuClik evt = (EventArgLessonMenuClik)e;
            int selected_menu = evt.LessonMenuID;
            var page_name = db.LessonMenus.Where(w => w.id == selected_menu).First();
            previous_page.Text = page_name.DisplayName;
            var lessonMenu = db.LessonMenus.Where(w => w.id == menu_id).First();
            lessonMenu.previous_LayoutID = page_name.id;
            db.SaveChanges();
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "type_alert", "alert('Select a Menu from the left list first');", true);
        }


    }

    protected void LessonMenuList3_menuClicked(object sender, EventArgs e)
    {
        if (ViewState["SelectedMenuID"] != null)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            int menu_id = int.Parse(ViewState["SelectedMenuID"].ToString());
            EventArgLessonMenuClik evt = (EventArgLessonMenuClik)e;
            int selected_menu = evt.LessonMenuID;
            var page_name = db.LessonMenus.Where(w => w.id == selected_menu).First();
            next_page.Text = page_name.DisplayName;
            var lessonMenu = db.LessonMenus.Where(w => w.id == menu_id).First();
            lessonMenu.next_LayoutID = page_name.id;
            db.SaveChanges();
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "type_alert", "alert('Select a Menu from the left list first');", true);
        }
    }

    protected void MenuOrder_MenuClicked(object sender, EventArgs e)
    {
        EventArgLessonMenuClik evt = (EventArgLessonMenuClik)e;
        int selected_menu = evt.LessonMenuID;
        ViewState["SelectedMenuID"] = selected_menu;
        container_chk.Visible = true;
        bind_Data(selected_menu);
        LessonAvailabilityAdmin1.bindData(selected_menu);
        DreamBirdEntities db = new DreamBirdEntities();
        int PageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
        var LessonMenu = db.LessonMenus.Where(w => w.ParentLayoutID == PageID).First();
        int ParentMenuID = Convert.ToInt32(LessonMenu.parentMenu_id);
        MenuOrder.bindMenu(ParentMenuID, PageID);
        ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "type_alert", "SortableCode();", true);

    }

    protected void isDefault_CheckedChanged(object sender, EventArgs e)
    {
        int selectedmenu = Convert.ToInt32(ViewState["SelectedMenuID"].ToString());
        int PageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
        DreamBirdEntities db = new DreamBirdEntities();
        if (db.LessonMenus.Any(a => a.ParentLayoutID == PageID && a.isDefault == true))
        {
            var lessonmenu = db.LessonMenus.Where(w => w.ParentLayoutID == PageID && w.isDefault == true).First();
            if (lessonmenu.id != selectedmenu && isDefault.Checked == true)
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script_isdefault", "alert('Menu " + lessonmenu.DisplayName + " is already selected as a Default Menu. Uncheck it to make this menu as Default Menu.')", true);
                isDefault.Checked = false;
                return;
            }
        }
        else
        {
            var lessonmenu = db.LessonMenus.Where(w => w.id == selectedmenu).First();
            lessonmenu.isDefault = true;
            db.SaveChanges();
        }
    }
}
