using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class Components_Account_ForgetPassword : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        status.Visible = false;
    }

    protected string send_mail(string currentuser_id)
    {
        try
        {
            string Body = System.IO.File.ReadAllText(Server.MapPath("../../Components/Account/PasswordRecovery.html"));
            Body =  Body.Replace("{DynamicContent}", "http://localhost:64671/Components/Account/ResetPassword?verificationID=" + currentuser_id + "");
            PackageEntities db = new PackageEntities();
            //DreamUserProfile dup = db.DreamUserProfiles.Where(q => q.AspNetUserId == currentuser_id).First();
            MailMessage mailMessage = new MailMessage();
            //mailMessage.To.Add(dup.AspNetUser.Email);
            mailMessage.From = new MailAddress("dreambirdapp@gmail.com");
            mailMessage.Subject = "DreamBird e-mail test";
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = Body;//"http://localhost:64671/Components/Account/ResetPassword?verificationID=" + currentuser_id + "";
            SmtpClient smtpClient = new SmtpClient("74.125.206.108", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential("dreambirdapp@gmail.com", "dogar1949");
            smtpClient.EnableSsl = true;
            smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            ServicePointManager.ServerCertificateValidationCallback =
         delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
            smtpClient.Send(mailMessage);
            return "E-mail sent!";
        }
        catch (Exception ex)
        {
            Response.Write("Could not send the e-mail - error: " + ex.Message);
            return ex.Message;
        }
    }

    protected void send_Click(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        var user = db.AspNetUsers.Where(q => q.Email == Email.Text);
        if (user.Count() != 0)
        {
            AspNetUser required_user = (AspNetUser)user.First();
            ShowResult(send_mail(required_user.Id));
        }
        else
        {
            ShowResult("Email not Exist");
        }
        

    }
    protected void ShowResult(String message)
    {
        status.Visible = true;
        status_text.Text = message;
        if(message == "E-mail sent!")
        {
            status_text.ForeColor = System.Drawing.Color.ForestGreen;
            forget_panel.Visible = false;
        }
    }
}
