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
            ViewState["nightType"] = type;
            BindData(type);
            

        }
    }

    protected void BindData(int PackageType)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        Packages_DetailList.DataSource = db.PackageDetails.Where(q => q.nightsInMadina+q.nightsInMakkah <= PackageType && q.nightsInMadina + q.nightsInMakkah > (PackageType-10)).Take(3).ToList();
        Packages_DetailList.DataBind();

    }
    protected void BookNowClicked(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        int id = int.Parse(bt.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        Response.Redirect("/UmrahDetailPage/" + pd.Dream.DreamName + "/UmrahDetail");
    }

    protected void PackageType_clicked(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        int nightType = int.Parse(lb.CommandArgument.ToString());
        ViewState["nightType"] = nightType;
        BindData(nightType);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "setClass", "setNightClass('" + nightType + "');", true);

    }
    protected void Explore_ButtonClicked(object sender, EventArgs e)
    {
        if (ViewState["nightType"] != null)
        {
            string nightType = ViewState["nightType"].ToString();
            DreamBirdEntities db = new DreamBirdEntities();
            string dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            Response.Redirect("/Umrahhome/" + dreamName + "/SearchFilter?totelNights=" + nightType);
        }
    }
}