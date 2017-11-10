using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web;

public partial class Admin_PackageHome : System.Web.UI.Page
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
                PackageEntities db = new PackageEntities();
                string UserID = HttpContext.Current.User.Identity.GetUserId();
                if (db.Packages.Any(w => w.EditedBy == UserID  || w.AspNetUserID == UserID))
                {
                    normal_flow.Visible = true;
                    welcome_note.Visible = false;
                    add_new_Package_first.Visible = true;
                }
                else
                {
                    add_new_Package_first.Visible = false;
                    normal_flow.Visible = false;
                    welcome_note.Visible = true;
                }
            }
            
        }
    }

    protected void PackageGrid_PackageClicked(object sender, EventArgs e)
    {
        EventArgPackageEdit evt = e as EventArgPackageEdit;
        int DreamID = evt.PackageEditID;
        Response.Redirect("~/Admin/PackageDetail.aspx?DID=" + DreamID);
    }

    protected void PackageBasicInfo_PackageAdded(object sender, EventArgs e)
    {
        EventArgPackageEdit evt = e as EventArgPackageEdit;
        int dreamid = evt.PackageEditID;
        Response.Redirect("~/Admin/PackageDetail.aspx?DID=" + dreamid);
    }
}