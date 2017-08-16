using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_RecentlyEditedDreams : System.Web.UI.UserControl
{
    public event EventHandler DreamClicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            string UserID = HttpContext.Current.User.Identity.GetUserId();
            rptr_recent_dreams.DataSource = db.Dreams.Where(w => w.EditedBy == UserID).OrderBy(o => o.EditedOn).Take(4).ToList();
            rptr_recent_dreams.DataBind();
        }
    }

    protected void dream_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        EventArgDreamEdit evt = new EventArgDreamEdit();
        int DreamID = Convert.ToInt32(lb.CommandName);
        evt.DreamEditID = DreamID;
        if (DreamClicked != null)
        {
            DreamClicked(this, evt);
        }
    }
}