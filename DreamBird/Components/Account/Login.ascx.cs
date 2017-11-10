using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System.Web.Security;
using DreamBird;
public partial class Account_Login : System.Web.UI.UserControl
{
   public event EventHandler forgetPassword;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LogIn(object sender, EventArgs e)
    {
        var manager = new UserManager();
        
        ApplicationUser user = manager.Find(UserName.Text, Password.Text);
        if (user != null)
        {
            IdentityHelper.SignIn(manager, user, RememberMe.Checked);
            Session["timeStart"] = DateTime.Now;
            if (ViewState["returnURL"] != null)
            {
                IdentityHelper.RedirectToReturnUrl(ViewState["returnURL"].ToString(), Response);
            }
            else if (manager.IsInRole(user.Id, "Admin") || manager.IsInRole(user.Id, "UmrahAdmin"))
            {
                Response.Redirect("~/Admin/PackageHome.aspx");
            }
            else { 
                if(manager.IsInRole(user.Id,"Dreamuser"))
                {
                    Response.Redirect("~/DreamUsers/DreamHome.aspx");
                }
            else { Response.Redirect("~/DreamHome.aspx"); }
            }

        }
        else
        {
            FailureText.Text = "Invalid username or password.";
            ErrorMessage.Visible = true;
        }
    }

    protected void forget_link_Click(object sender, EventArgs e)
    {
        forgetPassword(sender, EventArgs.Empty);
    }
}