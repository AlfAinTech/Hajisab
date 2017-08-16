using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_EditMenuDetails : System.Web.UI.UserControl
{
    public event EventHandler MenuDetailSaved;
    static int parentLayoutID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
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
    }

    public void EditDataBind(int MenuID)
    {
        int PageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
        ViewState["ParentLayoutID"] = PageID;
        ViewState["SelectedMenuID"] = MenuID;
        DreamBirdEntities db = new DreamBirdEntities();
        LessonMenu selected_menu = db.LessonMenus.Where(q => q.id == MenuID).First();
        int layout_id = Convert.ToInt32(selected_menu.DreamLayoutID);
        menuName.Text = selected_menu.menuName;
        menuName.Enabled = false;
        displayName.Text = selected_menu.DisplayName;
        menuRight.SelectedValue = selected_menu.menuRight.ToLower();
        menuType_list.SelectedValue = selected_menu.menuType;
        container_chk.Checked = selected_menu.IsContainer;
        //container_panel.Visible = selected_menu.IsContainer;
        isDefault.Checked = Convert.ToBoolean(selected_menu.isDefault);
        isShowNP.Checked = Convert.ToBoolean(selected_menu.isShowNP);
        lockness.Checked = Convert.ToBoolean(selected_menu.DreamLayout.IsActive);
        LessonAvailabilityAdmin.bindData(MenuID);
        if (selected_menu.parentMenu_id == 1)
        {
            checkAvailibility.Enabled = true;
        }
        else
        {
            checkAvailibility.Enabled = false;
        }
        //LessonMenuList1.SetCheckBoxes(selected_menu.id);
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
        //Lesson_menu_list.DataSource = db.LessonMenus.Where(q => q.parentMenu_id == id).ToList();
        ////bind data to related panels
        //Lesson_menu_list.DataBind();
        //MenuPageMarkup.bind_data(id);
        //MenuPageDesign.bind_data(id);
        //Page_markup.Visible = Page_Design.Visible = true;//!selected_menu.IsContainer;
        //link_Availability.Visible = selected_menu.IsContainer;
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



    protected void add_menu_Click(object sender, EventArgs e)
    {
        this.clearControl();
    }

    protected void clearControl()
    {

    }


    protected void Create_Menu(int parentLayoutID, String menuName, String displayName, int ParentMenu_id, Boolean isContainer, String menuRight, String menuType)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        DreamLayout parent_layout = db.DreamLayouts.Where(q => q.id == parentLayoutID).First();
        if (db.LessonMenus.Where(q => (q.menuName == menuName || q.DisplayName == displayName) && q.ParentLayoutID == parent_layout.id).Count() != 0)
        {
            //ShowError("Menu Already Exist");
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
    public void save_menu_ServerClick()
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
                if (next_page.Text != "")
                    lm.next_LayoutID = Convert.ToInt32(db.LessonMenus.Where(w => w.ParentLayoutID == lm.ParentLayoutID && w.DisplayName == next_page.Text).Select(s => s.id).First());

                if (previous_page.Text != "")
                    lm.previous_LayoutID = Convert.ToInt32(db.LessonMenus.Where(w => w.ParentLayoutID == lm.ParentLayoutID && w.DisplayName == previous_page.Text).Select(s => s.id).First());
                List<int> List = LessonMenuList1.GetSelectedMenuList();
                if (List.Count == 0)
                {
                    if (db.LessonMenuPreRequisites.Any(a => a.menu_id == lm.id))
                    {
                        var LessonMenuPreReqs = db.LessonMenuPreRequisites.Where(w => w.menu_id == lm.id).ToList();
                        foreach (var LessonMenuPreq in LessonMenuPreReqs)
                        {
                            db.LessonMenuPreRequisites.Remove(LessonMenuPreq);
                        }
                        db.SaveChanges();
                    }
                }
                else
                {
                    if (db.LessonMenuPreRequisites.Any(a => a.menu_id == lm.id))
                    {
                        if (db.LessonMenuPreRequisites.Any(a => a.menu_id == lm.id && (!List.Contains(a.pre_req_menu_id))))
                        {
                            var PreReqToDelete = db.LessonMenuPreRequisites.Where(w => w.menu_id == lm.id && (!List.Contains(w.pre_req_menu_id))).ToList();
                            foreach (var Menu in PreReqToDelete)
                            {
                                db.LessonMenuPreRequisites.Remove(Menu);
                            }
                            db.SaveChanges();
                        }
                    }

                    foreach (int LMID in List)
                    {
                        if (!(db.LessonMenuPreRequisites.Any(a => a.menu_id == lm.id && a.pre_req_menu_id == LMID)))
                        {
                            LessonMenuPreRequisite lmp = new LessonMenuPreRequisite();
                            lmp.menu_id = lm.id;
                            lmp.pre_req_menu_id = LMID;
                            db.LessonMenuPreRequisites.Add(lmp);
                            db.SaveChanges();
                        }

                    }
                }


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
                ArrayList files;
                if (HttpContext.Current.Application["recompilation_layouts"] != null)
                {
                    files = (ArrayList)HttpContext.Current.Application["recompilation_layouts"];

                }
                else
                {
                    files = new ArrayList();
                }

                files.Add(lm.DreamLayout.Dream.DreamName);
                HttpContext.Current.Application["recompilation_layouts"] = files;
                //if (container_chk.Checked)
                //{
                //    // NonContainer_to_container(menu_id);
                //    foreach (RepeaterItem lem in Lesson_menu_list.Items)
                //    {
                //        TextBox menuname = (TextBox)lem.FindControl("menuName");
                //        TextBox displayname = (TextBox)lem.FindControl("displayName");
                //        CheckBox isContainer = (CheckBox)lem.FindControl("is_container");
                //        Label id = (Label)lem.FindControl("id");
                //        int child_meunID = int.Parse(id.Text.ToString());
                //        LessonMenu child = db.LessonMenus.Where(q => q.id == child_meunID).First();
                //        child.menuName = menuname.Text;
                //        child.DisplayName = displayname.Text;
                //        child.IsContainer = isContainer.Checked;
                //        db.SaveChanges();
                //    }
                //}
                //else { /*Container_to_Noncontainer(menu_id);*/ }
                //MenuPageDesign.bind_data(menu_id);
                //MenuPageMarkup.bind_data(menu_id);
                lm.DreamLayout.IsActive = lockness.Checked;
                db.SaveChanges();
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "retrive_layout", "callFetcher('" + lm.DreamLayout.Page + "', " + lm.DreamLayout.DreamID + ");", true);

            }
            int ParentMenuID = Convert.ToInt32(ViewState["ParentMenuID"]);
            //MenuOrder.bindMenu(ParentMenuID, PageLayoutID);
            //LessonMenuList.bindData(parentLayoutID);
        }
    }

    protected void LessonMenuList2_menuClicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        EventArgLessonMenuClik evt = e as EventArgLessonMenuClik;
        int CurrentMenuID = evt.LessonMenuID;
        previous_page.Text = db.LessonMenus.Where(w => w.id == CurrentMenuID).Select(s => s.DisplayName).First();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_show_modal", "$('#MenuDetailModal').modal('show');", true);

    }

    protected void LessonMenuList3_menuClicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        EventArgLessonMenuClik evt = e as EventArgLessonMenuClik;
        int CurrentMenuID = evt.LessonMenuID;
        next_page.Text = db.LessonMenus.Where(w => w.id == CurrentMenuID).Select(s => s.DisplayName).First();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_show_modal", "$('#MenuDetailModal').modal('show');", true);

    }

    protected void save_menu_Click(object sender, EventArgs e)
    {
        save_menu_ServerClick();
        if(MenuDetailSaved != null)
        {
            MenuDetailSaved(this, EventArgs.Empty);
        }
    }

    protected void LessonAvailabilityAdmin_ShowPopup(object sender, EventArgs e)
    {
        popup_modal_availibility.Show();
    }
}