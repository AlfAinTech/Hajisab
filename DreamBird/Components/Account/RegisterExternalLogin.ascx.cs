using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DreamBird;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System.Web.Security;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;


public partial class Account_RegisterExternalLogin : System.Web.UI.UserControl
{
    public event EventHandler DreamUserLogedIn;
    protected string ProviderName
    {
        get { return (string)ViewState["ProviderName"] ?? String.Empty; }
        private set { ViewState["ProviderName"] = value; }
    }

    protected string ProviderAccountKey
    {
        get { return (string)ViewState["ProviderAccountKey"] ?? String.Empty; }
        private set { ViewState["ProviderAccountKey"] = value; }
    }

    protected void Page_Load()
    {
    }

    protected void LogIn_Click(object sender, EventArgs e)
    {
        CreateAndLoginUser();
    }

    private void CreateAndLoginUser()
    {

        var loginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo();
        var manager = new UserManager();
        PackageEntities db = new PackageEntities();
        var user = new ApplicationUser() { UserName = userName.Text, Email= Email_txt.Text};
        IdentityResult result = manager.Create(user);
        if (result.Succeeded)
        {
            
            manager.AddToRole(user.Id, "RegisteredUser");
            db.SaveChanges();
            //send_mail(user.Id);
            if (loginInfo == null)
            {
                Response.Redirect("~/Components/Account/LoginSetting.aspx");
                return;
            }
            result = manager.AddLogin(user.Id, loginInfo.Login);
            if (result.Succeeded)
            {
                IdentityHelper.SignIn(manager, user, isPersistent: false);
                // IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                Response.Redirect("~/DreamUsers/Default.aspx");
                DreamUserLogedIn(this, EventArgs.Empty);
                return;
            }
        }
        AddErrors(result);
    }

    private void AddErrors(IdentityResult result)
    {
        
        foreach (string error in result.Errors)
        {
            CustomValidator cv = new CustomValidator();
            cv.IsValid = false;
            cv.ErrorMessage = error;
            Page.Validators.Add(cv);


        }
    }

    //protected string send_mail(string currentuser_id)
    //{
    //    try
    //    {
    //        PackageEntities db = new PackageEntities();
    //        DreamUserProfile dup = db.DreamUserProfiles.Where(q => q.AspNetUserId == currentuser_id).First();
    //        MailMessage mailMessage = new MailMessage();
    //        mailMessage.To.Add(dup.AspNetUser.Email);
    //        mailMessage.From = new MailAddress("hajisabweb@gmail.com");
    //        mailMessage.Subject = "DreamBird e-mail test";

    //        mailMessage.IsBodyHtml = true;
    //        string Body = System.IO.File.ReadAllText(Server.MapPath("~/Components/Account/Emailconformation.html"));
    //        Body = Body.Replace("{DynamicContent}", PackageUtil.ServerUrl+"/Components/Account/EmailVerifier.aspx?verificationID=" + currentuser_id + "");
    //        mailMessage.Body = Body;//"http://localhost:64671/Components/Account/EmailVerifier?verificationID="+ currentuser_id + "";
    //        SmtpClient smtpClient = new SmtpClient("74.125.206.108", 587);
    //        smtpClient.Credentials = new System.Net.NetworkCredential("hajisabweb@gmail.com", "hajisab123");
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

    public void getLogin()
    {
        PackageEntities db = new PackageEntities();
        // Process the result from an auth provider in the request
        ProviderName = IdentityHelper.GetProviderNameFromRequest(Request);
        if (String.IsNullOrEmpty(ProviderName))
        {
            Response.Redirect("~/Components/Account/LoginSetting.aspx");
        }
        if (!IsPostBack)
        {
            var manager = new UserManager();
            var loginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo();
            if (loginInfo == null)
            {
                Response.Redirect("~/Components/Account/LoginSetting.aspx");
            }
            var user = manager.Find(loginInfo.Login);
            if (user != null)
            {
                IdentityHelper.SignIn(manager, user, isPersistent: false);

                if (manager.IsInRole(user.Id, "RegisteredUser"))
                {
                    Response.Redirect("~/DreamUsers/Default.aspx");
                }
                else { Response.Redirect("~/DreamHome.aspx"); }

                // IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                // Apply Xsrf check when linking
                string UserId = HttpContext.Current.User.Identity.GetUserId();
                var verifiedloginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo(IdentityHelper.XsrfKey, UserId);
                if (verifiedloginInfo == null)
                {
                    Response.Redirect("~/Components/Account/LoginSetting.aspx");
                }

               var result = manager.AddLogin(UserId, verifiedloginInfo.Login);
                if (result.Succeeded)
                {
                   
                    db.SaveChanges();
                    manager.AddToRole(UserId, "DreamUser");
                    //send_mail(UserId);
                    Response.Redirect("~/DreamUsers/Default.aspx");
                    DreamUserLogedIn(this, EventArgs.Empty);
                    // IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else
                {
                    AddErrors(result);
                    return;
                }
            }
            else
            {
                userName.Text = loginInfo.DefaultUserName;
                Email_txt.Text = loginInfo.Email;
                //CreateAndLoginUser();
            }
        }
    }
}