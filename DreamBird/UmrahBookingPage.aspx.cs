using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahBookingPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PackageEntities db = new PackageEntities();
            string pkgName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
            List<string> metaTags = db.PackageDetails.Where(q => q.Package.PackageName == pkgName).Select(q => q.Package.PackageName+""+q.Hotel.hotelName).ToList();
            Page.MetaKeywords = string.Join(",", metaTags);
            Page.MetaDescription = db.Packages.Where(w => w.PackageName == pkgName).Select(s => s.Description).FirstOrDefault();
        }
    }
}