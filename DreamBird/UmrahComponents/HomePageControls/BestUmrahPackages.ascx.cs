using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_BestUmrahPackages : System.Web.UI.UserControl,ICorePackageControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Databind();
        }
    }
    public void Databind()
    {
        PackageEntities db = new PackageEntities();
        BetsPackages_list.DataSource = db.PackageDetails.Where(q => q.Package.IsFeatured).ToList();
        BetsPackages_list.DataBind();
       // ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
    }
    protected void bookNowClick(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        int id = int.Parse(b.CommandArgument);
        PackageEntities db = new PackageEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        Response.Redirect("~/UmrahDetailPage/" + pd.Package.PackageName + "/UmrahDetail");
    }

    public void BindData()
    {
        // throw new NotImplementedException();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        // throw new NotImplementedException();
    }

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
        // throw new NotImplementedException();
    }
}