using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_CustomBookingUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
            result = new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
            PackageEntities db = new PackageEntities();
            int count = db.AlharmainUserPackages.Where(q => q.trackingID == result).Count();
            flag = count != 0;
        }
        return result;
    }
    protected void saveUser_Click(object sender, EventArgs e)
    {
        //passenger detail
        int adults = adults_no.Text == "" ? 0 : int.Parse(adults_no.Text);
        int children = children_no.Text == "" ? 0 : int.Parse(children_no.Text);
        int infants = infant_no.Text == "" ? 0 : int.Parse(infant_no.Text);
        if ((adults + children + infants) != 0)
        {

            PackageEntities db = new PackageEntities();

            int id = int.Parse(Session["CustomPackageID"].ToString());

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

            up.CustomPackageId = id;
            up.userID = user.id;
            up.isCustomPackage = true;
            up.adults = int.Parse(adults_no.Text);
            up.children = int.Parse(children_no.Text);
            up.infants = int.Parse(infant_no.Text);
            up.trackingID = RandomString(8);
            up.CreatedDate = up.ModifiedDate = System.DateTime.Today;

            //if (Session["AIDMakkah"] != null)
            //{ up.AccomMakkahID = int.Parse(Session["AIDMakkah"].ToString()); }
            //if (Session["AIDMadina"] != null) { up.AccomMadinaID = int.Parse(Session["AIDMadina"].ToString()); }
            db.AlharmainUserPackages.Add(up);
            db.SaveChanges();
            db.SaveChanges();
            db.Entry(up).Reference(c => c.CustomPackage).Load();
            string Response = send_mail(user.email, up);
            if (Response == "E-mail sent!")
            {
                txttrackingId.Text = up.trackingID;
                txtfullnights.Text = (up.CustomPackage.nightsMadina + up.CustomPackage.nightsMakkah).ToString();
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "packageBook", "openConfirmationForm();", true);
                clearControl();
                ShowSuccess("Your Umrah Package Booked Now. Tracking id Sent to your Email ID");
            }
            else
            {
                ShowError("Could not send the e - mail - error: " + Response);
            }
        }
        else
        {
            ShowError("Add Passengers");
        }




    }
    public string send_mail(string UserMail, AlharmainUserPackage package)
    {
        try
        {
            PackageEntities db = new PackageEntities();
            package = db.AlharmainUserPackages.Where(q => q.id == package.id).FirstOrDefault();
            //  DreamUserProfile dup = db.DreamUserProfiles.Where(q => q.AspNetUserId == currentuser_id).First();
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(UserMail);
            mailMessage.From = new MailAddress("hajisabweb@gmail.com");
            mailMessage.Subject = "DreamBird e-mail test";
            mailMessage.IsBodyHtml = true;
            string Body = System.IO.File.ReadAllText(Server.MapPath("~/UmrahComponents/PackageComponent/CustomBookingEmail.html"));
            Body = Body.Replace("{DynamicContent_id}", package.trackingID).Replace("{DynamicContent_nights}", (package.CustomPackage.nightsMadina+package.CustomPackage.nightsMakkah).ToString());
            mailMessage.Body = Body;
            SmtpClient smtpClient = new SmtpClient("74.125.206.108", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential("hajisabweb@gmail.com", "hajisab123");
            smtpClient.EnableSsl = true;
            smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            ServicePointManager.ServerCertificateValidationCallback =delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
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
        PackageEntities db = new PackageEntities();
        int id = int.Parse(Session["CustomPackageID"].ToString());
        var data = db.CustomPackages.Where(q => q.id == id).ToList();
        if (data.Count() != 0)
        {
            CustomPackage pd = data[0];
            totelNights.Text = (pd.nightsMadina + pd.nightsMakkah).ToString();
            nights_inMakkah.Text = pd.nightsMakkah.ToString();
            nights_inMadina.Text = pd.nightsMadina.ToString();
            if (pd.MadinaRating > 2)
            {
                hotelRating_madina.Attributes.Add("data-rating", pd.MadinaRating.ToString());
                hotelRating_madina.Attributes.Add("data-num-stars", pd.MadinaRating.ToString());
            }
            else { hotelRating_madina.Text = "Economy"; }
            if (pd.MakkahRating > 2)
            {
                hotelRating_makkah.Attributes.Add("data-rating", pd.MakkahRating.ToString());
                hotelRating_makkah.Attributes.Add("data-num-stars", pd.MakkahRating.ToString());
            }
            else { hotelRating_makkah.Text = "Economy"; }
            
             //   roundTrip_panel.Visible = true; AirLine_name.Text = pd.a;
            
            if (Session["grandTotel"] != null) { Computed_amount.Text = Convert.ToDecimal(Session["grandTotel"].ToString()).ToString("#,##0"); }

        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
    }
    public void clearControl()
    {
        name_txt.Text = "";
        mobile_txt.Text = "";
        contect_txt.InnerText = "";
        email_txt.Text = "";
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

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
        //  throw new NotImplementedException();
    }
    public void ShowError(String errorMsg)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", " toastr.error('" + errorMsg + "');;", true);
    }
    public void ShowSuccess(String successMsg)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", " toastr.success('" + successMsg + "');;", true);
    }
}
