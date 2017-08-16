using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_MenuPageDesign : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void bind_data(int id)
    {
        DreamBirdEntities db = new DreamBirdEntities();

        ViewState["SelectedMenuID"] = id;
        LessonMenu lm = db.LessonMenus.Where(q => q.id == id).First();
        //get page


            List<DreamLayout> Page = db.DreamLayouts.Where(q => q.id == lm.DreamLayoutID).ToList();
            String DreamName = Page[0].Dream.DreamName;
            String PageName = Page[0].Page;
            page_frame.Src = String.Format("../../DreamHome.aspx/{0}/{1}", DreamName, PageName);
        
       
    }
}