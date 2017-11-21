using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahSearchFilter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PackageEntities db = new PackageEntities();
            string pkgName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
            List<string> metaTags = db.Packages.Where(q => q.PackageName == pkgName).Select(q => q.PackageName).ToList();
            Page.MetaKeywords = string.Join(",", metaTags);
            Page.MetaDescription = db.Packages.Where(w => w.PackageName == pkgName).Select(s => s.Description).FirstOrDefault();
        }
    }
}