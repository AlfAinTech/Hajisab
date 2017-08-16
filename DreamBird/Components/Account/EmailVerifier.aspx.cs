using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DreamBird;
using Microsoft.AspNet.Identity;

public partial class Account_EmailVerifier : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      string verificationID =  Request.QueryString["verificationID"];
        DreamBirdEntities db = new DreamBirdEntities();
        string current_userId = HttpContext.Current.User.Identity.GetUserId();
        DreamUserProfile dup =  db.DreamUserProfiles.Where(q => q.AspNetUserId == current_userId).First();
        dup.IsActivated = true;
        db.SaveChanges();
        Response.Redirect("~/DreamHome.aspx");
        //Label1.Text = verificationID;
    }
}