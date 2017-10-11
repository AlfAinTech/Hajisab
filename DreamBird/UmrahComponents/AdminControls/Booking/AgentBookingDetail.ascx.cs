using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Booking_AgentBookingDetail : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String uid = HttpContext.Current.User.Identity.GetUserId();
        rptAlharmainBooking.DataSource = db.AlharmainUserPackages.Where(q => q.PackageDetail.Dream.AspNetUserID == uid).ToList();
        rptAlharmainBooking.DataBind();
    }

    protected void rptAlharmainBooking_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int RecordID = int.Parse(e.CommandArgument.ToString());
        DreamBirdEntities db = new DreamBirdEntities();
        AlharmainUserPackage userPackage = db.AlharmainUserPackages.Single(id => id.id == RecordID);

        if (userPackage != null)
        {
            name_txt.Text = userPackage.AlharmainUser.Name;
            email_txt.Text = userPackage.AlharmainUser.email;
            mobile_txt.Text = userPackage.AlharmainUser.mobileNo;
            contect_txt.InnerText = userPackage.AlharmainUser.contect;
            adults_no.Text = userPackage.adults.ToString();
            infant_no.Text = userPackage.infants.ToString();
            children_no.Text = userPackage.children.ToString();
            txtTrackingID.Text = userPackage.trackingID.ToString();
            Booking_List.Visible = false;
            booking_detail.Visible = true;
        }
            }
}