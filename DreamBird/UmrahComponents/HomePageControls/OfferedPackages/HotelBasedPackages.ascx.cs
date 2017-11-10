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
            PackageEntities db = new PackageEntities();
            var list =   db.Hotels.GroupBy(q => q.rating).Select(key => key).ToList();
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "setHotel", "LoadHotelScript('" + Type.ToString() + "'); setFirstElementHotel();", true);
            hiddentRatingType.Value = Type.ToString();
            //BindData(Type);
            bindInitialPrice();
        }
        

    }
    protected void bindInitialPrice()
    {
        PackageEntities db = new PackageEntities();
       
        EconomyPrice.Text = (db.PackageDetails.Where(q=>q.Hotel1.rating == 1).Select(q=>q.minRange).ToList().DefaultIfEmpty(0)).Min().ToString("#,##0");
        budgetPrcie.Text = (db.PackageDetails.Where(q => q.Hotel1.rating == 2).Select(q => q.minRange).ToList().DefaultIfEmpty(0)).Min().ToString("#,##0");
        starPrcie.Text = (db.PackageDetails.Where(q => q.Hotel1.rating > 2).Select(q => q.minRange).ToList().DefaultIfEmpty(0)).Min().ToString("#,##0");


    }
    protected void BindData(int ratingType)
    {
        PackageEntities db = new PackageEntities();
        //if (ratingType == 3) { Packages_DetailList.DataSource = db.PackageDetails.Where(q => q.Hotel1.rating >= ratingType).Take(3).ToList(); }
        //else { Packages_DetailList.DataSource = db.PackageDetails.Where(q => q.Hotel1.rating == ratingType).Take(3).ToList(); }
        //Packages_DetailList.DataBind();

    }
    protected void BookNowClicked(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        int id  = int.Parse( Request["__EVENTARGUMENT"]); ;
        PackageEntities db = new PackageEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        Response.Redirect("/UmrahDetailPage/" + pd.Package.PackageName + "/UmrahDetail");
    }

    protected void PackageType_clicked(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        int ratingType = int.Parse(lb.CommandArgument.ToString());
        ViewState["RatingType"] = ratingType;
        BindData(ratingType);
       
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "setHotelClass", "setClassHotel('" + ratingType + "');", true);

    }
    protected void Explore_ButtonClicked(object sender, EventArgs e)
    {
        string rating =  hiddentRatingType.Value;
        if (rating != "")
        {
            int ratingType = int.Parse(rating.ToString());

            Response.Redirect("/UmrahSearchFilter?rating=" + ratingType+"");
            
        }
    }
}