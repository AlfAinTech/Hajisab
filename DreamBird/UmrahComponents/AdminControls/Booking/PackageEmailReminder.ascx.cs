using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Booking_PackageEmailReminder : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var Packages =   db.AlharmainUserPackages.Where(q => q.IsAmountRecieved == false && (DbFunctions.DiffHours(q.CreatedDate, q.ModifiedDate).Value >= 24 || DbFunctions.DiffHours(q.ModifiedDate , System.DateTime.Today).Value >= 24)).ToList();
        if(Packages.Count >0)
        {
            foreach(AlharmainUserPackage p in Packages)
            {
                UmrahPackageUtil.send_mail(p);
            }
            
        }
        else
        {

        }
    }
}