using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_OfferedPackages_HotelBasedPackages : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        int Type = 1;
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            var list =   db.Hotels.GroupBy(q => q.rating).Select(key => key).ToList();
           
            ViewState["RatingType"] = Type.ToString(); ;
            BindData(Type);
           
        }
        

    }

    protected void BindData(int ratingType)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (ratingType == 3) { Packages_DetailList.DataSource = db.PackageDetails.Where(q => q.Hotel1.rating >= ratingType).Take(3).ToList(); }
        else { Packages_DetailList.DataSource = db.PackageDetails.Where(q => q.Hotel1.rating == ratingType).Take(3).ToList(); }
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
        int ratingType = int.Parse(lb.CommandArgument.ToString());
        ViewState["budgetType"] = ratingType;
        BindData(ratingType);
       
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "setHotelClass", "setClassHotel('" + ratingType + "');", true);

    }
    protected void Explore_ButtonClicked(object sender, EventArgs e)
    {
        if (ViewState["budgetType"] != null)
        {
            int ratingType = int.Parse(ViewState["budgetType"].ToString());
            string dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            Response.Redirect("/Umrahhome/" + dreamName + "/SearchFilter?rating=" + ratingType);
        }
    }
}