using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_headerFooter_Packageheader : System.Web.UI.UserControl,ICorePackageControl
{
    public void BindData()
    {
        //throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
       // throw new NotImplementedException();
    }

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
       // throw new NotImplementedException();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void search_Click(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        Package d = db.Packages.Where(q => q.IsDefault == true).First();
        var data = db.DreamLayouts.Where(q => q.DreamID == d.id && q.Page == "SearchFilter").ToList();
        if(data.Count !=0)
        {
            DreamLayout dl = data[0];
            Response.Redirect("/umrahHome/" + d.PackageName + "/" + dl.Page);
    }
    }
    protected void Home_Click(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        DreamLayout default_page;
        Package default_dreams = db.Packages.Where(dl => dl.IsDefault == true).First();
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
        {
            default_page = db.DreamLayouts.Where(q => q.DreamID == default_dreams.id && q.IsPublicDefaultPage == true).First();
        }
        else
        {
            default_page = db.DreamLayouts.Where(q => q.DreamID == default_dreams.id && q.IsUserDefaultPage == true).First();
        }
            Response.Redirect("/umrahHome/" + default_dreams.PackageName + "/" + default_page.Page);
        
    }

}