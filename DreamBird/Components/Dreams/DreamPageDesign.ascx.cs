using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamPageDesign : System.Web.UI.UserControl, IDreamEdit
{
    public void EditDataBind(int Id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var page = db.DreamLayouts.Where(w => w.id == Id).First();
        //navigate.NavigateUrl = "../../DreamHome/" + page.Dream.DreamName + "/" + page.Page;
        
        //userDefault.Checked = Convert.ToBoolean(page.IsUserDefaultPage);
        //publicDefault.Checked = Convert.ToBoolean(page.IsPublicDefaultPage);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            
        }
    }

    protected void add_page_ServerClick(object sender, EventArgs e)
    {
        
    }
}