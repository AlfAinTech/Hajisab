using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Account_UserActivation : CorePackageControlAdapter
{
    protected void Page_Load(object sender, EventArgs e)
    {
    //if(HttpContext.Current.User.Identity.IsAuthenticated)
    //{ 
    //    PackageEntities db = new PackageEntities();
    //    string currentuser_id = HttpContext.Current.User.Identity.GetUserId();
    //    AspNetUser user = db.AspNetUsers.Where(q => q.Id == currentuser_id).First();
    //    DreamUserProfile dup = db.DreamUserProfiles.Where(q => q.AspNetUserId == currentuser_id).First();
    //    if(dup.IsActivated)
    //    {
    //        activated_panel.Visible = true;
    //        activated_chk.Checked = true;
    //        activation_panel.Visible = false;
           

    //    }
    //    else
    //    {
    //        activated_panel.Visible = false;
    //        activation_panel.Visible = true;
    //        userName_lbl.Text = HttpContext.Current.User.Identity.Name;
    //        if(user.Email != null)
    //        { 
    //        email_lbl.Text = user.Email.ToString();
    //            }
    //        }

    //}
    }

    protected void resend_email_Click(object sender, EventArgs e)
    {
        //string status = send_mail();
        //status_lbl.Text = status;
        //status_lbl.Visible = true;

    }
    //protected string send_mail()
    //{
    // try
    //    {
    //        string currentuser_id = HttpContext.Current.User.Identity.GetUserId();
    //        PackageEntities db = new PackageEntities();
    //       DreamUserProfile dup =  db.DreamUserProfiles.Where(q => q.AspNetUserId == currentuser_id).First();
    //    MailMessage mailMessage = new MailMessage();
    //    mailMessage.To.Add(dup.AspNetUser.Email);
    //    mailMessage.From = new MailAddress("dreambirdapp@gmail.com");
    //    mailMessage.Subject = "DreamBird e-mail test";
    //        mailMessage.IsBodyHtml = true;
    //    string Body = System.IO.File.ReadAllText(Server.MapPath("~/Components/Account/Emailconformation.html"));
    //    Body = Body.Replace("{DynamicContent}", PackageUtil.ServerUrl+"/Components/Account/EmailVerifier.aspx?verificationID=" + currentuser_id + "");
    //    mailMessage.Body = Body;//"http://localhost:64671/Components/Account/EmailVerifier?verificationID="+ currentuser_id + "";
    //    SmtpClient smtpClient = new SmtpClient("74.125.206.108",587);
    //    smtpClient.Credentials = new System.Net.NetworkCredential("dreambirdapp@gmail.com", "dogar1949");
    //     smtpClient.EnableSsl = true;
    //        smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
    //        ServicePointManager.ServerCertificateValidationCallback =
    //     delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
    //       smtpClient.Send(mailMessage);
    //        return  "E-mail sent!";
    //}
    //catch(Exception ex)
    //{
    //    Response.Write("Could not send the e-mail - error: " + ex.Message);
    //        return ex.Message;
    //}
    //}
}