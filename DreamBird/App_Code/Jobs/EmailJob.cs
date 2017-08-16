using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Web;

/// <summary>
/// Summary description for EmailJob
/// </summary>
public class EmailJob: IJob
{
   
    public  string UserMail { get; set; }
    public AlharmainUserPackage package { get; set; }
    public void Execute(IJobExecutionContext context)
    {
        //context.Scheduler.
        send_mail();
    }
    public string send_mail()
    {
        try
        {
            DreamBirdEntities db = new DreamBirdEntities();
            //  DreamUserProfile dup = db.DreamUserProfiles.Where(q => q.AspNetUserId == currentuser_id).First();
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(UserMail);
            mailMessage.From = new MailAddress("dreambirdapp@gmail.com");
            mailMessage.Subject = "DreamBird e-mail test";
            mailMessage.IsBodyHtml = true;
            string Body =  System.IO.File.ReadAllText("UmrahComponents/PackageComponent/BookingEmail.html");
            Body = Body.Replace("{DynamicContent_link}", DreamUtil.ServerUrl + "/"+package.PackageDetail.Dream.DreamName + "/UmrahDetail").Replace("{DynamicContent_id}", package.trackingID); ;
            mailMessage.Body = Body;
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
            //ShowError("Could not send the e-mail - error: " + ex.Message);
            //// Response.Write("Could not send the e-mail - error: " + ex.Message);
            return ex.Message;
        }
    }
}