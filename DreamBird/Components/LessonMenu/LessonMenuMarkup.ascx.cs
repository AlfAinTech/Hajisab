using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_LessonMenuMarkup : System.Web.UI.UserControl, ILessonMenuMarkup
{
    public List<LessonMenu> lm
    {
        get;
        set;
    }
    public string menuName
    {
        get;
        set;
    }
    public int NoOfChildren
    {
        get;
        set;
    }

    public event EventHandler MenuClicked;
    public event EventHandler MenuEdited;

    protected void Page_Load(object sender, EventArgs e)
    {
    }


    public void bindMenu(int parentMenuID, int ParentLayoutID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            List<int> NotAvailable_course = db.LessonMenuAvailabilities.Where(q => q.LessonMenu.parentMenu_id == parentMenuID && q.AvailableFrom > System.DateTime.Now).Select(q => q.LessonMenu.id).ToList();
            lm = db.LessonMenus.Where(q => q.parentMenu_id == parentMenuID && q.ParentLayoutID == ParentLayoutID && !(NotAvailable_course.Contains(q.id))).OrderBy(o => o.AppOrder).ToList();
        }
        else
        {
            lm = db.LessonMenus.Where(q => q.parentMenu_id == parentMenuID && q.ParentLayoutID == ParentLayoutID && q.menuRight == "public").OrderBy(o => o.AppOrder).ToList();
        }
        Repeater1.DataSource = lm;
        // LinkButton lk = (LinkButton)Repeater1.FindControl("HyperLink1");
        // lk.CssClass = "list-group-item";
        Repeater1.DataBind();
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        PlaceHolder ph = (PlaceHolder)e.Item.FindControl("placeHolderContainer");
        PlaceHolder start_list = (PlaceHolder)e.Item.FindControl("list_start");
        PlaceHolder end_list = (PlaceHolder)e.Item.FindControl("list_end");
        LessonMenu menu = (LessonMenu)e.Item.DataItem;
        LinkButton hplink = (LinkButton)e.Item.FindControl("HyperLink1");
        Label progressCount = (Label)e.Item.FindControl("percentage_value");
        string userID = HttpContext.Current.User.Identity.GetUserId();
        hplink.Attributes["data-toggle"] = "collapse";
        hplink.Attributes["src"] = RenderLayoutPage(menu.id);
        if (menu.IsContainer)
        {
            //if(menu.parentMenu_id == 1)
            //{
            //    var childlayouts = db.LessonMenus.Where(w => w.parentMenu_id == menu.id).Select(s => s.DreamLayoutID).ToList();
            //    var progressMenus = db.DreamPageControls.Where(w => childlayouts.Contains(w.Layout_ID)).Select(s => s.Layout_ID).ToList();
            //    var progressdone = db.UserLessonProgresses.Where(w => progressMenus.Contains(w.LessonMenu.DreamLayout.id)).Count();
            //    progressCount.Text = progressdone + " / " + progressMenus.Count;
            //}
            
            Control control = Page.LoadControl("~/Components/LessonMenu/LessonMenuMarkup.ascx");
            ILessonMenuMarkup controlInterface = (ILessonMenuMarkup)control;
            // controlInterface.MenuClicked += new EventHandler(menu_Clcked_);
            controlInterface.bindMenu(menu.id, menu.ParentLayoutID.Value);
            ph.Controls.Add(control);

        }

        hplink.Attributes.Add("data-target", "#parent_menu_" + menu.id);
        hplink.Attributes.Add("href", "#parent_menu_" + menu.id);

        if (menu.parentMenu_id != 1)
        {
            LinkButton hplink1 = (LinkButton)e.Item.FindControl("HyperLink1");
            hplink1.CssClass = "menu_link";
            //start_list.Visible = end_list.Visible = false;
            //  hplink1.OnClientClick += new EventHandler(HyperLink1_Click);
        }
    }



    protected void HyperLink1_Click(object sender, EventArgs e)
    {
        // LessonMenu menu = (LessonMenu)sender;
        LinkButton hplink = (LinkButton)sender;
        int menu_id = int.Parse(hplink.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        LessonMenu menu = db.LessonMenus.Where(q => q.id == menu_id).First();
        //hplink.Attributes.Add("data-target", "#parent_menu_" + menu.id);
        LessonMenu ParentMen = menu;
        String parentIDs = "";
        /*populate string with all parentIDS such as menu_parent_6;menu_paret_1*/
        while (ParentMen.id != 1)
        {
            parentIDs += "#parent_menu_" + ParentMen.id + ";";
            ParentMen = ParentMen.LessonMenu2;
        }
        Boolean isMenuExpended = Boolean.Parse(hplink.Attributes["is_expanded"]);
        String idMenuExpendedString = hplink.Attributes["is_expanded"];
        hplink.Attributes["is_expanded"] = (!isMenuExpended).ToString().ToLower();
        //rais event
        EventArgLessonMenuClik evt = new EventArgLessonMenuClik();
        evt.LessonMenuID = menu_id;
        if (MenuClicked != null) { MenuClicked(sender, evt); }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "clickedOnMenu('" + parentIDs + "','" + idMenuExpendedString + "')", true);
    }

    public void menu_Clcked_(object sender, EventArgs e)
    {
        EventArgLessonMenuClik evt_old = (EventArgLessonMenuClik)e;
        EventArgLessonMenuClik evt = new EventArgLessonMenuClik();
        evt.LessonMenuID = evt_old.LessonMenuID;
        if (MenuClicked != null) { MenuClicked(sender, evt); }
    }
    public string RenderLayoutPage(int menu_id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        List<KeyValuePair<string, string>> list = new List<KeyValuePair<string, string>>();
        LessonMenu menu = db.LessonMenus.Where(q => q.id == menu_id).First();

        DreamLayout dream_layout = db.DreamLayouts.Where(q => q.id == menu.DreamLayoutID).First();

        if (menu.menuType.Equals("multimedia_site"))
        {
             if(db.LessonMultimedias.Any(a => a.DreamLayout.id == dream_layout.id))
            {
                LessonMultimedia multimedia = db.LessonMultimedias.Where(w => w.DreamLayout.id == dream_layout.id).First();
                string source = multimedia.Multimediabank.IndexFilePath;
                list.Add(new KeyValuePair<string, string>("src", source));
            }
            else
            {
                //if(dream_layout.Layout == "Hello World")
                //{
                //    list.Add("Undefined");
                //}
                //else
                //{
                    list.Add(new KeyValuePair<string, string>("src", "../../dreamhome/" + dream_layout.Dream.DreamName + "/" + dream_layout.Page));
                //}
            }
            if (db.DreamLayouts.Any(a => a.id == menu.next_LayoutID))
            {
                list.Add(new KeyValuePair<string, string>("next", menu.next_LayoutID.ToString()));
            }
            else
            {
                list.Add(new KeyValuePair<string, string>("src", "Undefined"));
            }
            if (db.DreamLayouts.Any(a => a.id == menu.previous_LayoutID))
            {
                list.Add(new KeyValuePair<string, string>("previous", menu.previous_LayoutID.ToString()));
            }
            else
            {
                list.Add(new KeyValuePair<string, string>("previous", "Undefined"));
            }
        }
        else
        {
            //if (dream_layout.Layout == "Hello World")
            //{
            //    list.Add("Undefined");
            //}
            //else
            //{
                list.Add(new KeyValuePair<string, string>("src", "../../dreamhome/" + dream_layout.Dream.DreamName + "/" + dream_layout.Page));
            //}

            if (db.DreamLayouts.Any(a => a.id == menu.next_LayoutID))
            {
                list.Add(new KeyValuePair<string, string>("next", menu.next_LayoutID.ToString()));
            }
            else
            {
                list.Add(new KeyValuePair<string, string>("next", "Undefined"));
            }
            if (db.DreamLayouts.Any(a => a.id == menu.previous_LayoutID))
            {
                list.Add(new KeyValuePair<string, string>("previous", menu.previous_LayoutID.ToString()));
            }
            else
            {
                list.Add(new KeyValuePair<string, string>("previous", "Undefined"));
            }
        }
        if(Convert.ToBoolean(menu.isShowNP))
        {
            list.Add(new KeyValuePair<string, string>("shownp", "Show"));
        }
        else
        {
            list.Add(new KeyValuePair<string, string>("shownp", "Hide"));
        }

        return (new JavaScriptSerializer()).Serialize(list);
    }

}