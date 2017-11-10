using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Web;

/// <summary>
/// Summary description for UmrahPackageUtil
/// </summary>
public class UmrahPackageUtil
{
    public UmrahPackageUtil()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string send_mail(AlharmainUserPackage package)
    {
        try
        {
            PackageEntities db = new PackageEntities();
            //  DreamUserProfile dup = db.DreamUserProfiles.Where(q => q.AspNetUserId == currentuser_id).First();
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(package.AlharmainUser.email);
            mailMessage.From = new MailAddress("dreambirdapp@gmail.com");
            mailMessage.Subject = "DreamBird e-mail test";
            mailMessage.IsBodyHtml = true;
            string Body = GenerateEmailBody(package);
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
    public static string GenerateEmailBody(AlharmainUserPackage package)
    {
        string Body = "";
        PackageEntities db = new PackageEntities();
        double lastUPdate =  (System.DateTime.Today - package.ModifiedDate).TotalHours;
        double packageCreated = (System.DateTime.Today - package.CreatedDate).TotalHours;
        if ((packageCreated >= 24 && packageCreated < 48) && (lastUPdate >= 24) && package.IsAmountRecieved == false)
        { 
            Body = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/UmrahComponents/PackageComponent/BookingEmail.html"));
            Body = Body.Replace("{DynamicContent_link}", PackageUtil.ServerUrl + "/UmrahDetailPage/" + package.PackageDetail.Package.PackageName + "/UmrahDetail").Replace("{DynamicContent_id}", package.trackingID).Replace("DynamicContent_nights", package.PackageDetail.getTotelNights.ToString());
            package.ModifiedDate = System.DateTime.Today;
        }
        else
        {//cancel package
            if ((packageCreated >= 48) && package.IsAmountRecieved == false)
            {
                Body = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/UmrahComponents/PackageComponent/BookingCancellation.html"));
                Body = Body.Replace("{DynamicContent_link}", PackageUtil.ServerUrl + "").Replace("DynamicContent_nights", package.PackageDetail.getTotelNights.ToString());
               AlharmainUserPackage pkg =  db.AlharmainUserPackages.Where(q => q.id == package.id).FirstOrDefault();
                db.AlharmainUserPackages.Remove(pkg);

            }
            else
            {
                
            }
        }
        db.SaveChanges();
            return Body;

    }
}