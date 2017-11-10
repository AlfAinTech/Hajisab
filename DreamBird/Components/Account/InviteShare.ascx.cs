using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Account_InviteShare : System.Web.UI.UserControl,ICorePackageControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {int LayoutID;


            String PackageName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
            String pageName = PackageUtil.getPageNameFromURL(Request.RawUrl);
            PackageEntities db = new PackageEntities();
            DreamLayout Layout = db.DreamLayouts.Where(q => q.Package.PackageName == PackageName && q.Page == pageName).First();
            LayoutID = Layout.id;
            bindData(LayoutID);
        }
    }
    public void bindData(int layoutID)
    {
        PackageEntities db = new PackageEntities();
        List<InviteSharePage> page = db.InviteSharePages.Where(q => q.LayoutID == layoutID).ToList();
        if (page.Count != 0)
        {
            InviteSharePage Layout_page = page[0];
            share_text.Text = Layout_page.shareText;
            share_url.Text = Layout_page.shareURL;
        }


    }

    public void BindData()
    {
        
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
      
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
       ;
    }

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
       
    }
}