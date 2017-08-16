using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web;

public partial class Admin_DreamHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated && (HttpContext.Current.User.IsInRole("Admin") || HttpContext.Current.User.IsInRole("UmrahAdmin"))))
        {
            Response.Redirect("~/Components/Account/LoginSetting.aspx");
        }
        else
        {
            if(!IsPostBack)
            {
                DreamBirdEntities db = new DreamBirdEntities();
                string UserID = HttpContext.Current.User.Identity.GetUserId();
                if (db.Dreams.Any(w => w.EditedBy == UserID  || w.AspNetUserID == UserID))
                {
                    normal_flow.Visible = true;
                    welcome_note.Visible = false;
                    add_new_dream_first.Visible = true;
                }
                else
                {
                    add_new_dream_first.Visible = false;
                    normal_flow.Visible = false;
                    welcome_note.Visible = true;
                }
            }
            
        }
    }

    protected void DreamGrid_DreamClicked(object sender, EventArgs e)
    {
        EventArgDreamEdit evt = e as EventArgDreamEdit;
        int DreamID = evt.DreamEditID;
        Response.Redirect("~/Admin/DreamDetail.aspx?DID=" + DreamID);
    }

    protected void DreamBasicInfo_DreamAdded(object sender, EventArgs e)
    {
        EventArgDreamEdit evt = e as EventArgDreamEdit;
        int dreamid = evt.DreamEditID;
        Response.Redirect("~/Admin/DreamDetail.aspx?DID=" + dreamid);
    }
}