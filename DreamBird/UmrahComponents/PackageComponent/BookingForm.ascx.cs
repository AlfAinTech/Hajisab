using Quartz;
using Quartz.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_BookingForm : System.Web.UI.UserControl,ICoreDreamControl
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindDetailData();
        }

    }
    private static Random random = new Random();
    public static string RandomString(int length)
    {
        Boolean flag = true;
        string result = "";
        while (flag)
        {    
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        result =  new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
            DreamBirdEntities db = new DreamBirdEntities();
           int count =  db.AlharmainUserPackages.Where(q => q.trackingID == result).Count();
            flag = count != 0;
         }
        return result;
    }
    protected void saveUser_Click(object sender, EventArgs e)
    {
       
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        Dream d = db.Dreams.Where(q => q.DreamName == dreamName).First();
        PackageDetail data = db.PackageDetails.Where(q => q.dreamID == d.id).First();
        
            AlharmainUser user = new AlharmainUser();
            user.Name = name_txt.Text;
            user.mobileNo = mobile_txt.Text;
            user.contect = contect_txt.InnerText;
            user.email = email_txt.Text;
            user.city = "";//city_list.SelectedItem.Text;
            user.province = "";// province_list.SelectedItem.Text;
            db.AlharmainUsers.Add(user);
            db.SaveChanges();
            AlharmainUserPackage up = new AlharmainUserPackage();
            up.packageDetailID = data.id;
            up.userID = user.id;
            up.isCustomPackage = false;
            up.adults = int.Parse(adults_no.Text);
            up.children= int.Parse(children_no.Text);
            up.infants = int.Parse(infant_no.Text);
            up.trackingID = RandomString(8);
            up.CreatedDate = up.ModifiedDate = System.DateTime.Today;

        if (Session["AIDMakkah"] != null)
            {up.AccomMakkahID= int.Parse(Session["AIDMakkah"].ToString());}
            if(Session["AIDMadina"] != null) { up.AccomMadinaID = int.Parse(Session["AIDMadina"].ToString());  }
            if(Session["discount_id"] != null) { up.discountID = int.Parse(Session["discount_id"].ToString()); }
            db.AlharmainUserPackages.Add(up);
            db.SaveChanges();
           string Response = send_mail(user.email,up);
            if(Response == "E-mail sent!")
            {
            txttrackingId.Text = up.trackingID;
            txtfullnights.Text = up.PackageDetail.getTotelNights.ToString();
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "packageBook", "openConfirmationForm();", true);
            clearControl();
                ShowSuccess("Your Umrah Package Booked Now. Tracking id Sent to your Email ID");
            }
            else
        {
            ShowError("Could not send the e - mail - error: "+Response);
        }
            



    }
    public string send_mail(string UserMail,AlharmainUserPackage package)
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
            string Body = System.IO.File.ReadAllText(Server.MapPath("~/UmrahComponents/PackageComponent/BookingEmail.html"));
            Body = Body.Replace("{DynamicContent_link}", DreamUtil.ServerUrl + "/UmrahDetailPage/" + package.PackageDetail.Dream.DreamName + "/UmrahDetail").Replace("{DynamicContent_id}", package.trackingID).Replace("DynamicContent_nights", package.PackageDetail.getTotelNights.ToString());
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
    
    
    public void BindDetailData()
    {
        DreamBirdEntities db = new DreamBirdEntities();

        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        Dream d = db.Dreams.Where(q => q.DreamName == dreamName).First();
        var data = db.PackageDetails.Where(q => q.dreamID == d.id).ToList();
        if (data.Count() != 0)
        {
            PackageDetail pd = data[0];
            totelNights.Text = (pd.nightsInMakkah + pd.nightsInMadina).ToString();
            hotelName_makkah.Text = pd.Hotel1.hotelName;
            nights_inMakkah.Text = pd.nightsInMakkah.ToString();
            hotelName_madina.Text = pd.Hotel.hotelName;
            nights_inMadina.Text = pd.nightsInMadina.ToString();
            if (pd.Hotel.rating > 2)
            {
                hotelRating_madina.Attributes.Add("data-rating", pd.Hotel.rating.ToString());
                hotelRating_madina.Attributes.Add("data-num-stars", pd.Hotel.rating.ToString());    
            }
            else{ hotelRating_madina.Text = "Economy"; }
            if (pd.Hotel1.rating > 2)
            {
                hotelRating_makkah.Attributes.Add("data-rating", pd.Hotel1.rating.ToString());
                hotelRating_makkah.Attributes.Add("data-num-stars", pd.Hotel1.rating.ToString());
            }
            else { hotelRating_makkah.Text = "Economy"; }
           
            if (pd.returnFlight)
            {
                roundTrip_panel.Visible = true; AirLine_name.Text = pd.Flight.Name;
            }
            else
            {
                oneWay_panel.Visible = true;
                departureAirLine_name.Text = pd.Flight.Name;
                returnAirLine_name.Text = pd.Flight1.Name;
            }
            if(Session["grandTotel"] != null) { Computed_amount.Text = Session["grandTotel"].ToString(); }
               
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
    }
    public void clearControl()
    {
        name_txt.Text="";
        mobile_txt.Text="";
        contect_txt.InnerText="";
       email_txt.Text="";
       //city_list.SelectedIndex=0;
       // province_list.SelectedIndex=0;
    }

    public void BindData()
    {
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
     //   throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
       // throw new NotImplementedException();
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
      //  throw new NotImplementedException();
    }
    public void ShowError(String errorMsg)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", " toastr.error('"+errorMsg+"');;", true);
    }
    public void ShowSuccess(String successMsg)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", " toastr.success('" + successMsg + "');;", true);
    }
}
