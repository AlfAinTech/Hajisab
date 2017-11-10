using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_headerFooter_HeaderUmrahCustomChat : System.Web.UI.UserControl, ICorePackageControl
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
        string packageName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
        Response.Redirect("/Umrahhome/" + packageName + "/SearchFilter");
    }
}