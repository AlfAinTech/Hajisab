using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_headerFooter_UmrahChatheader : System.Web.UI.UserControl,ICorePackageControl
{
    public void BindData()
    {
       // throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
       // throw new NotImplementedException();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void learn_moreClicked(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        string PackageName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
        Response.Redirect("/UmrahSearchFilter");
    }

    protected void openCustomWizard_Click(object sender, EventArgs e)
    {
        
        PackageEntities db = new PackageEntities();
        PackageDetail pd = db.PackageDetails.FirstOrDefault();
        if (pd != null)
            Response.Redirect("~/UmrahCustomPackage.aspx?PackageId=" + pd.id);
    }
}