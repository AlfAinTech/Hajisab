using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_PrimaryUmrahPackages : System.Web.UI.UserControl,ICorePackageControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }
    public void BindData()
    {
       PackageEntities db = new PackageEntities();
         List<PackageDetail> pd = db.PackageDetails.ToList();
        primaryPkg_list.DataSource = db.PackageDetails.GroupBy(x => x.packageType).Select(group =>  group.Where(x => x.minRange == group.Min(y => y.minRange)).FirstOrDefault()).ToList();
        primaryPkg_list.DataBind();
       // ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);

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
        //throw new NotImplementedException();
    }
    public void Explore_clicked(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        int id = int.Parse(bt.CommandArgument);
        PackageEntities db = new PackageEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        //String PackageName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
        //Package d = db.Packages.Where(q => q.PackageName == PackageName).First();

        Response.Redirect("/UmrahSearchFilter?minPrice=" + pd.minAmount);
        
    }


}