using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_OfferedPackages_NightBasedPackages : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int type = 10;
            hiddenNights.Value = type.ToString();
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "setNight", "LoadNightScript('" + type.ToString() + "'); setFirstElementNight();", true);
            bindInitialPrice();


        }
    }

    protected void BindData(int PackageType)
    {
        PackageEntities db = new PackageEntities();
        //Packages_DetailList.DataSource = db.PackageDetails.Where(q => q.nightsInMadina+q.nightsInMakkah <= PackageType && q.nightsInMadina + q.nightsInMakkah > (PackageType-10)).Take(3).ToList();
        //Packages_DetailList.DataBind();

    }
    protected void bindInitialPrice()
    {
        PackageEntities db = new PackageEntities();

        TenNightPrice.Text = (db.PackageDetails.Where(q => (q.nightsInMadina + q.nightsInMakkah) <= 10).Select(q => q.minRange).ToList().DefaultIfEmpty(0)).Min().ToString("#,##0");
        TwentyNightPrice.Text = (db.PackageDetails.Where(q => (q.nightsInMadina + q.nightsInMakkah) <= 20 && (q.nightsInMadina+q.nightsInMakkah) > 10).Select(q => q.minRange).ToList().DefaultIfEmpty(0)).Min().ToString("#,##0");
        ThirtyNightPrice.Text = (db.PackageDetails.Where(q => (q.nightsInMadina + q.nightsInMakkah) <= 30 && (q.nightsInMadina + q.nightsInMakkah) > 20).Select(q => q.minRange).ToList().DefaultIfEmpty(0)).Min().ToString("#,##0");


    }
    protected void BookNowClicked(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        int id = int.Parse(Request["__EVENTARGUMENT"]);
        PackageEntities db = new PackageEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        Response.Redirect("/UmrahDetailPage/" + pd.Package.PackageName + "/UmrahDetail");
    }

    protected void PackageType_clicked(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        int nightType = int.Parse(Request["__EVENTARGUMENT"]);
        ViewState["nightType"] = nightType;
        BindData(nightType);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "setClass", "setNightClass('" + nightType + "');", true);

    }
    protected void Explore_ButtonClicked(object sender, EventArgs e)
    {
        if (hiddenNights.Value != "")
        {
            string nightType = hiddenNights.Value.ToString();
            PackageEntities db = new PackageEntities();
          
            Response.Redirect("/UmrahSearchFilter?totelNights=" + nightType);
        }
    }
}