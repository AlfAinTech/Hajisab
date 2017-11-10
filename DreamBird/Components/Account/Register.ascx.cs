using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.Owin.Security;
using System.Web.Security;
using DreamBird;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Net;
using Microsoft.AspNet.Identity;

public partial class Account_Register : System.Web.UI.UserControl
{
    public event EventHandler DreamUserLogedIn;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //protected string send_mail( string currentuser_id)
    //{
    //    try
    //    {
    //        PackageEntities db = new PackageEntities();
    //        //DreamUserProfile dup = db.DreamUserProfiles.Where(q => q.AspNetUserId == currentuser_id).First();
    //        MailMessage mailMessage = new MailMessage();
    //        //mailMessage.To.Add(dup.AspNetUser.Email);
    //        mailMessage.From = new MailAddress("dreambirdapp@gmail.com");
    //        mailMessage.Subject = "DreamBird e-mail test";
    //        mailMessage.IsBodyHtml = true;
    //        string Body = System.IO.File.ReadAllText(Server.MapPath("~/Components/Account/Emailconformation.html"));
    //        Body = Body.Replace("{DynamicContent}", PackageUtil.ServerUrl+"/Components/Account/EmailVerifier.aspx?verificationID=" + currentuser_id + "");
    //        mailMessage.Body = Body;//"http://localhost:64671/Components/Account/EmailVerifier?verificationID="+ currentuser_id + "";
    //        SmtpClient smtpClient = new SmtpClient("74.125.206.108", 587);
    //        smtpClient.Credentials = new System.Net.NetworkCredential("dreambirdapp@gmail.com", "dogar1949");
    //        smtpClient.EnableSsl = true;
    //        smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
    //        ServicePointManager.ServerCertificateValidationCallback =
    //     delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
    //        smtpClient.Send(mailMessage);
    //        return "E-mail sent!";
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write("Could not send the e-mail - error: " + ex.Message);
    //        return ex.Message;
    //    }
    //}
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        PackageEntities db = new PackageEntities();
        try {
        var user = new ApplicationUser() { UserName = UserName.Text,Email=Email.Text };
        
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
                manager.AddToRole(user.Id, "RegisteredUser");
                IdentityHelper.SignIn(manager, user, isPersistent: false);
            // IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

            db.SaveChanges();
            //send_mail(user.Id);
            if (ViewState["returnURL"] != null)
            {
                IdentityHelper.RedirectToReturnUrl(ViewState["returnURL"].ToString(), Response);
            }
            else { Response.Redirect("~/DreamHome.aspx"); }
            DreamUserLogedIn(this, EventArgs.Empty);
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("{0} Exception caught.", ex);
        }
    }
}