using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_MenuOrder : System.Web.UI.UserControl, ILessonMenuMarkup
{
    public List<LessonMenu> lm
    {
        get;
        set;
    }

    public int ParentMenuID = 0;
    public int parentLayoutID = 0;
    public event EventHandler MenuClicked;
    public event EventHandler MenuRefresh;
    public event EventHandler MenuEdited;

    protected void Page_Load(object sender, EventArgs e)
    {
        //DreamUtil.Markup = (ILessonMenuMarkup)this;
        //MenuClicked += menu_Clcked_;
    }


    public void bindMenu(int parentMenuID, int ParentLayoutID)
    {
        ViewState["ParentMenuID"] = parentMenuID;
        ViewState["ParentLayoutID"] = ParentLayoutID;
        ParentMenuID = parentMenuID;
        parentLayoutID = ParentLayoutID;
        DreamBirdEntities db = new DreamBirdEntities();
        lm = db.LessonMenus.Where(q => q.parentMenu_id == parentMenuID && q.ParentLayoutID == ParentLayoutID).OrderBy(o => o.AppOrder).ToList();
        Repeater1.DataSource = lm;
        //LinkButton lk = (LinkButton)Repeater1.FindControl("HyperLink1");
        //lk.CssClass = "list-group-item";
        Repeater1.DataBind();
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            PlaceHolder ph = (PlaceHolder)e.Item.FindControl("placeHolderContainer");
            PlaceHolder start_list = (PlaceHolder)e.Item.FindControl("list_start");
            PlaceHolder end_list = (PlaceHolder)e.Item.FindControl("list_end");
            LessonMenu menu = (LessonMenu)e.Item.DataItem;
            ViewState["ParentMenuID"] = Convert.ToInt32(menu.parentMenu_id);
            System.Web.UI.HtmlControls.HtmlAnchor hplink = (System.Web.UI.HtmlControls.HtmlAnchor)e.Item.FindControl("HyperLink1");
            Label progressCount = (Label)e.Item.FindControl("percentage_value");
            string userID = HttpContext.Current.User.Identity.GetUserId();

            //if (menu.IsContainer)
            //{
            //hplink.CssClass = "list-group-item";
            hplink.Attributes["data-toggle"] = "collapse";
            hplink.Attributes.Add("data-target", "#parent_menu_" + menu.id);
            //hplink.Attributes["src"] = RenderLayoutPage(menu.id);
            Control control = Page.LoadControl("~/Components/LessonMenu/MenuOrder.ascx");
            ILessonMenuMarkup controlInterface = (ILessonMenuMarkup)control;
            controlInterface.MenuClicked += new EventHandler(menu_Clcked_);
            controlInterface.MenuEdited += new EventHandler(menu_edited_);
            controlInterface.bindMenu(menu.id, menu.ParentLayoutID.Value);
            ph.Controls.Add(control);
            //}



            //hplink.OnClientClick = "return uploadPage('" + RenderLayoutPage(menu.id) + "')";

            if (menu.parentMenu_id != 1)
            {
                LinkButton hplink1 = (LinkButton)e.Item.FindControl("LinkButton1");
                hplink1.CssClass = "list-group-item";
                //start_list.Visible = end_list.Visible = false;
                //hplink1.OnClientClick += new EventHandler(LinkButton1_Click);
            }
        }
        else if (e.Item.ItemType == ListItemType.Footer)
        {
            HyperLink hplink = e.Item.FindControl("hplink2") as HyperLink;
            hplink.Attributes.Add("href", "#" + ViewState["ParentMenuID"].ToString());
            hplink.Attributes.Add("aria-controls", ViewState["ParentMenuID"].ToString());
        }

    }

    public void menu_Clcked_(object sender, EventArgs e)
    {
        EventArgLessonMenuClik evt_old = (EventArgLessonMenuClik)e;
        EventArgLessonMenuClik evt = new EventArgLessonMenuClik();
        evt.LessonMenuID = evt_old.LessonMenuID;
        if (MenuClicked != null) { MenuClicked(sender, evt); }
    }

    public void menu_edited_(object sender, EventArgs e)
    {
        EventArgLessonMenuClik evt_old = (EventArgLessonMenuClik)e;
        EventArgLessonMenuClik evt = new EventArgLessonMenuClik();
        evt.LessonMenuID = evt_old.LessonMenuID;
        if (MenuEdited != null) { MenuEdited(sender, evt); }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        int MenuID = Convert.ToInt32(lb.CommandName);
        EventArgLessonMenuClik evt = new EventArgLessonMenuClik();
        evt.LessonMenuID = MenuID;
        if (MenuClicked != null)
        {
            MenuClicked(this, evt);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (MenuRefresh != null)
        {
            MenuRefresh(this, EventArgs.Empty);
        }
    }

    protected void delete_menu_Click(object sender, EventArgs e)
    {
        LinkButton button = sender as LinkButton;
        string[] CommandArgs = button.CommandArgument.ToString().Split(new char[] { ',' });
        DreamBirdEntities db = new DreamBirdEntities();
        int id = Convert.ToInt32(CommandArgs[0]);
        List<LessonMenu> child_list = db.LessonMenus.Where(q => q.parentMenu_id == id).ToList();
        foreach (LessonMenu child in child_list)
        {
            delete_menu(child.id);
        }
        LessonMenu lm_parent = db.LessonMenus.Where(q => q.id == id).First();
        int ParentMenuID = Convert.ToInt32(lm_parent.parentMenu_id);
        if (ParentMenuID != 1 && db.LessonMenus.Where(w => w.parentMenu_id == lm_parent.id).Count() == 0)
        {
            db.LessonMenus.Where(w => w.id == ParentMenuID).First().IsContainer = false;
        }
        var DreamLayoutID = db.LessonMenus.Where(w => w.id == id).Select(s => s.DreamLayoutID).First();
        DreamLayout layout = db.DreamLayouts.Where(w => w.id == DreamLayoutID).First();
        var LessonMenuPreRequisites = db.LessonMenuPreRequisites.Where(w => w.menu_id == id).ToList();
        if (LessonMenuPreRequisites.Count > 0)
        {
            foreach (var prereq in LessonMenuPreRequisites)
            {
                db.LessonMenuPreRequisites.Remove(prereq);
            }
        }
        db.DreamLayouts.Remove(layout);
        db.LessonMenus.Remove(lm_parent);

        db.SaveChanges();
        if (MenuRefresh != null)
            MenuRefresh(this, EventArgs.Empty);
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
        int ParentMenuID = Convert.ToInt32(lm_parent.parentMenu_id);
        if (ParentMenuID != 1 && db.LessonMenus.Where(w => w.parentMenu_id == lm_parent.id).Count() == 0)
        {
            db.LessonMenus.Where(w => w.id == ParentMenuID).First().IsContainer = false;
        }
        var DreamLayoutID = db.LessonMenus.Where(w => w.id == id).Select(s => s.DreamLayoutID).First();
        DreamLayout layout = db.DreamLayouts.Where(w => w.id == DreamLayoutID).First();
        var LessonMenuPreRequisites = db.LessonMenuPreRequisites.Where(w => w.menu_id == id).ToList();
        if (LessonMenuPreRequisites.Count > 0)
        {
            foreach (var prereq in LessonMenuPreRequisites)
            {
                db.LessonMenuPreRequisites.Remove(prereq);
            }
        }
        db.DreamLayouts.Remove(layout);
        db.LessonMenus.Remove(lm_parent);


        //db.SaveChanges();
        //LessonMenuList.bindData(parentLayoutID);
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        string MenuID = lb.Attributes["data-menuid"].ToString();
        EventArgLessonMenuClik evt = new EventArgLessonMenuClik();
        evt.LessonMenuID = Convert.ToInt32(MenuID);
        if (MenuEdited != null)
        {
            MenuEdited(this, evt);
        }
    }
}