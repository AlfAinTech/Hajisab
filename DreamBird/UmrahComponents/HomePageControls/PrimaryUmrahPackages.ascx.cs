using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_PrimaryUmrahPackages : System.Web.UI.UserControl,ICoreDreamControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }
    public void BindData()
    {
       DreamBirdEntities db = new DreamBirdEntities();
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

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
        //throw new NotImplementedException();
    }
    public void Explore_clicked(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        int id = int.Parse(bt.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        Dream d = db.Dreams.Where(q => q.DreamName == dreamName).First();

        Response.Redirect("/UmrahHome/" + d.DreamName + "/SearchFilter?minPrice="+pd.minAmount);
        
    }


}