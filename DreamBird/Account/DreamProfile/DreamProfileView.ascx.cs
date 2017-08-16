using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DreamBird;
using Microsoft.AspNet.Identity;
public partial class Account_DreamProfile_DreamProfileView : CoreDreamControlAdapter
{
    public void setProfileMeter()
    {
    if(HttpContext.Current.User.Identity.IsAuthenticated) { 
        DreamBirdEntities db;
        db = new DreamBirdEntities();
        string profile_id = HttpContext.Current.User.Identity.GetUserId();
        DreamUserProfile profile = db.DreamUserProfiles.Where(q => q.AspNetUserId == profile_id).First();
        int Total_column = 6;
        String query = "SELECT  ((CASE WHEN id IS NULL THEN 1 ELSE 0 END) + (CASE WHEN AspNetUserId IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Name IS NULL THEN 1 ELSE 0 END) +(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) +(CASE WHEN DateOfBirth IS NULL THEN 1 ELSE 0 END) +(CASE WHEN ProfilePicture IS NULL THEN 1 ELSE 0 END)) AS sum_of_nulls FROM DreamUserProfile WHERE id = " + profile.id;
        var count = db.Database.SqlQuery<int>(query).First();
        //Calculate profile percentage
        double filledProfile = double.Parse(count.ToString());
        double profilePercentag = ((Total_column - filledProfile) / Total_column) * 100;
        double pixels = (profilePercentag / 100) * 90;
        double top = 90 - pixels;
        double height = pixels;
        Label1.Style.Add("top", top + "px");
        Label1.Style.Add("height", height + "px");
        
        percentageLabel.Text = ""+ (int)Math.Ceiling(profilePercentag)+"% Completed";

    }
    else {

    }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        setProfileMeter();


    }

    protected void MyEvents_clicked(object sender, EventArgs e)
    {
        mp1.Show();
    }
    protected void update_btn_Click(object sender, EventArgs e)
    {

    }
}