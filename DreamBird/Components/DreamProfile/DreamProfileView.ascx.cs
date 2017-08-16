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
        //Label1.Style.Add("top", top + "px");
        //Label1.Style.Add("height", height + "px");
        
        percentageLabel.Text = (int)Math.Ceiling(profilePercentag)+"%";
        string classes = percent_sign.Attributes["class"].ToString();
            percent_sign.Attributes["class"] = classes + " p" + (int)Math.Ceiling(profilePercentag);

    }
    else {

    }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { 
        setProfileMeter();
            // Page.ClientScript.RegisterStartupScript( this.GetType(), "script", " function getdata() 	$('.chart').easyPieChart({      easing: 'easeOutBounce',onStep: function(from, to, percent) {  $(this.el).find('.percent').text(Math.round(80)); } }); var chart = window.chart = $('.chart').data('easyPieChart'); chart.update(80); };");
            // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "javascript:getdata()", true);
            //  ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "<script>alert('hi')</script>", true);
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "script", "<script>	$('.chart').easyPieChart({      easing: 'easeOutBounce',onStep: function(from, to, percent) {  $(this.el).find('.percent').text(Math.round(80)); } }); var chart = window.chart = $('.chart').data('easyPieChart'); chart.update(80);</script>", false);
            // string script = "function updateClick() { alert('Are you sure you wnat to update?'); }";
            // ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "javascript:getdata()", true);
        }
    }
    protected void ProfileUpdated_event(object sender, EventArgs e)

    {
        setProfileMeter();
        //mp1.Hide();Panel1.Visible = true;

        //mp1.
    }
    protected void showPopupEvent(object sender, EventArgs e)

    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "javascript:showPopupPanel()", true);
        
      //  myModal.
    }


}