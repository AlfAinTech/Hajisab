using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_MenuPageMarkup : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //protected void save_markup_Click(object sender, EventArgs e)
    //{
    //    if (ViewState["layout_id"] !=null)
    //    {
    //        DreamBirdEntities db = new DreamBirdEntities();
    //        int layout_id = int.Parse(ViewState["layout_id"].ToString());
    //        DreamLayout layout = db.DreamLayouts.Where(q => q.id == layout_id).First();
    //        layout.Layout = Page_markup.Text;
    //        db.SaveChanges();
    //    }
    //}
    //public void bind_data(int menu_id)
    //{
    //    ViewState.Clear();
    //    ViewState["menuID"] = menu_id;
    //    DreamBirdEntities db = new DreamBirdEntities();
    //    LessonMenu selected_menu = db.LessonMenus.Where(q => q.id == menu_id).First();
    //    DreamLayout layout = db.DreamLayouts.Where(q => q.id == selected_menu.DreamLayoutID).First();
    //    Page_markup.Text = layout.Layout;
    //    ViewState["layout_id"] = layout.id;

    //}
    public void bind_data(int id)
    {
        DreamBirdEntities db = new DreamBirdEntities();

        ViewState["SelectedMenuID"] = id;
        LessonMenu lm = db.LessonMenus.Where(q => q.id == id).First();
        DreamLayout Page = db.DreamLayouts.Where(q => q.id == lm.DreamLayoutID).First();
        int dreamID = Page.DreamID.Value;
        int PageID = Page.id;
        page_frame.Src = String.Format("../../Components/PageTemplate/Template.aspx?ParentLayoutID="+Page.id + "&&MenuType="+lm.menuType);
      
    }

}