using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DreamBird;
using Microsoft.AspNet.Identity;

public partial class Components_Account_ResetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void reset_btn_Click(object sender, EventArgs e)
    {
        string verificationID = Request.QueryString["verificationID"];
        var manager = new UserManager();
        DreamBirdEntities db = new DreamBirdEntities();
       var user = db.AspNetUsers.Where(q => q.Id == verificationID);
        if(user.Count()!=0)
        {
            AspNetUser current_user = (AspNetUser)user.First();
            ApplicationUser app_user = manager.FindById(current_user.Id);
            //app_user
            current_user.PasswordHash = manager.PasswordHasher.HashPassword(new_password.Text);
            db.SaveChanges();
            IdentityHelper.SignIn(manager, app_user, isPersistent: false);
            Response.Redirect("/DreamHome.aspx");
        }
    }
}