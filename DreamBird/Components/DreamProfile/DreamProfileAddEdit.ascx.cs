using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Account_DreamProfile_DreamProfileAddEdit : System.Web.UI.UserControl
{
    public event EventHandler MyEvent;
    public event EventHandler ProfileUpdaterEvent;
    protected void Page_Load(object sender, EventArgs e)
    {
    if(HttpContext.Current.User.Identity.IsAuthenticated)
    {
            if(!IsPostBack)
            {
            string user_id = HttpContext.Current.User.Identity.GetUserId();
            DreamBirdEntities db = new DreamBirdEntities();
            DreamUserProfile dup = db.DreamUserProfiles.Where(q => q.AspNetUserId == user_id).First();
            Name_txt.Text = dup.Name;
                if(dup.DateOfBirth != null)
                {
                    DateTime d = (DateTime)dup.DateOfBirth;
                    dob_txt.Text = d.ToString("yyyy-MM-dd");// dup.DateOfBirth.ToShortDateString();
                }
           
            edu_txt.Text = dup.Education;
            profile_img.ImageUrl = dup.ProfilePicture;
            }
        }

    }

    protected void update_btn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid) {
        string user_id = HttpContext.Current.User.Identity.GetUserId();
        DreamBirdEntities db = new DreamBirdEntities();
        DreamUserProfile dup =  db.DreamUserProfiles.Where(q => q.AspNetUserId == user_id).First();
        dup.Name = Name_txt.Text;
         dup.DateOfBirth = DateTime.Parse(dob_txt.Text.ToString());
        dup.Education = edu_txt.Text;
            if(profile_img.ImageUrl != "") { 
        dup.ProfilePicture = profile_img.ImageUrl;
            }
            // dup.AspNetUserId = user_id;

            db.SaveChanges();
            if(ProfileUpdaterEvent != null) { 
        ProfileUpdaterEvent(this, EventArgs.Empty);
            }
        }
    }
    protected void Upload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(MapPath("~/Components/DreamProfile/UserProfileImages/" + FileUpload1.FileName));
            System.Drawing.Image img1 = System.Drawing.Image.FromFile(MapPath("~/Components/DreamProfile/UserProfileImages/") + FileUpload1.FileName);
            profile_img.ImageUrl = "~/Components/DreamProfile/UserProfileImages/" + FileUpload1.FileName;
           
        }
        if(MyEvent != null)
        {
            MyEvent(sender, EventArgs.Empty);
        }
        
    }
}