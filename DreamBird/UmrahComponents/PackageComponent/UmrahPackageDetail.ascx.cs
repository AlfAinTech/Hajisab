using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_UmrahPackageDetail : System.Web.UI.UserControl, ICorePackageControl
{
    public Boolean isActiveFlag;
    protected void Page_Load(object sender, EventArgs e)
    {
       if(Request.QueryString["UserID"]!=null)
        {
            int uid = int.Parse(Request.QueryString["UserID"].ToString());
            PackageEntities db = new PackageEntities();
           AlharmainUserPackage d = db.AlharmainUserPackages.Where(q => q.userID == uid).FirstOrDefault();
            if(d !=null)
            {
                myDaTAbIND(d);
                bookPackage.Visible = false;
                ComputePrice(d.AccomMakkahID.Value, d.AccomMadinaID.Value);
            }
        }
        else
        { 
        Page.Header.DataBind();
        var scriptManager = ScriptManager.GetCurrent(Page);
        Boolean flag = scriptManager.IsInAsyncPostBack;
        
        if (!Page.IsPostBack) {
            myDaTAbIND();
            int madinaAccom_id = 0;
            int makkahAccom_id = 0;
            if (Request.QueryString["AccomMadinaID"] != null && Request.QueryString["AccomMadinaID"] != "")
            {
                madinaAccom_id = int.Parse(Request.QueryString["AccomMadinaID"].ToString());
            }
            if (Request.QueryString["AccomMakkahID"] != null)
            {
                makkahAccom_id = int.Parse(Request.QueryString["AccomMakkahID"].ToString());
            }
            ComputePrice(makkahAccom_id, madinaAccom_id);
        }
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "startAccom", "document.getElementById('form1').reset(); ManageAccomodation();", true);

        }

    }

    public void myDaTAbIND(AlharmainUserPackage userPackage =null)
    {
        PackageEntities db = new PackageEntities();
        List<PackageDetail> data = new List<PackageDetail>();
        if(userPackage == null) {
            String PackageName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
            if (db.Packages.Where(q => q.PackageName == PackageName).Select(q => q.id).Any()) {
            int id = db.Packages.Where(q => q.PackageName == PackageName).Select(q=>q.id).First();
            data = db.PackageDetails.Where(q => q.PackageID == id).ToList();
            }
        }
        else
            data = db.PackageDetails.Where(q => q.id == userPackage.packageDetailID).ToList();
        double PriceWithoutAccom = 0;
        if (data.Count != 0)
        {
            PackageDetail pd = data[0];
            
            //PackageItenryDetail.bindItenryData(pd.id);
            totelNights.Text = (pd.nightsInMakkah + pd.nightsInMadina).ToString();
            bookPackage.CommandArgument = pd.id.ToString();
            hotelMakkah_img.ImageUrl = pd.Hotel1.MediaItem.Path500;
            hotelName_makkah.Text = pd.Hotel1.hotelName;
            nights_inMakkah.Text = pd.nightsInMakkah.ToString();
            hotelMadina_img.ImageUrl = pd.Hotel.MediaItem.Path500;
            hotelName_madina.Text = pd.Hotel.hotelName;
            nights_inMadina.Text = pd.nightsInMadina.ToString();
            if(userPackage!=null)
            {
                bindMadina_accommodation(pd.Hotel.id,userPackage.AccomMadinaID.Value);
                bindMakkah_accommodation(pd.Hotel1.id,userPackage.AccomMakkahID.Value);
            }
            else if(Request.QueryString["AccomMadinaID"] != null && Request.QueryString["AccomMakkahID"]!=null)
            {
                int makkahAccomID = int.Parse(Request.QueryString["AccomMakkahID"]);
                int madinaAccomId = int.Parse(Request.QueryString["AccomMadinaID"]);
                bindMadina_accommodation(pd.Hotel.id, madinaAccomId);
                bindMakkah_accommodation(pd.Hotel1.id, makkahAccomID);
            }
            else
            {
                bindMadina_accommodation(pd.Hotel.id);
                bindMakkah_accommodation(pd.Hotel1.id);
            }

                package_name.Text = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(pd.Package.PackageName.ToLower());// pd.Dream.DreamName.ToUpper(;
            if (pd.Hotel.rating > 2)
            {
                hotelRating_madina.Attributes.Add("data-rating", pd.Hotel.rating.ToString());
                hotelRating_madina.Attributes.Add("data-num-stars", pd.Hotel.rating.ToString());
            }
            else { hotelRating_madina.Text = "Economy"; hotelRating_madina.CssClass = ""; }
            if (pd.Hotel1.rating > 2)
            {
                hotelRating_makkah.Attributes.Add("data-rating", pd.Hotel1.rating.ToString());
                hotelRating_makkah.Attributes.Add("data-num-stars", pd.Hotel1.rating.ToString());
            }
            else { hotelRating_makkah.Text = "Economy"; hotelRating_makkah.CssClass = ""; }
            if (pd.returnFlight)
            {
                roundTrip_panel.Visible = true; AirLine_name.Text = pd.Flight.AirLine.Name;
                //cities_lbl.Text = pd.Flight.fromCity + " - " + pd.Flight.destinationCity + " | " + pd.Flight.Name;
                cities_lbl.Text = pd.Flight.destinationCity + " - " + pd.Flight.fromCity;
            }
            else
            {
                oneWay_panel.Visible = true;
                departureAirLine_name.Text = pd.Flight.AirLine.Name;
                returnAirLine_name.Text = pd.Flight1.AirLine.Name;
                depCities_lbl.Text = pd.Flight.fromCity + " - " + pd.Flight.destinationCity;
                retCities_lbl.Text = pd.Flight1.fromCity + " - " + pd.Flight1.destinationCity;
            }
            //set discount
            PriceWithoutAccom = pd.getPriceWithout_accommodation;
            DateTime today = System.DateTime.Today;
            List<DiscountPackage> discounts = db.DiscountPackages.Where(q => q.packageDetailID == pd.id && (q.availableFrom <= today && q.availableTill >= today)).OrderByDescending(q => q.discountPercent).ToList();
            if (discounts.Count() != 0)
            {
                DiscountPackage dp = discounts[0];
                discountPanel.Visible = true;
                discountValue.Text = dp.discountPercent.ToString();
                Session["discount_id"] = dp.id.ToString();
                Paneldiscount.Visible = true;
                bookPackage.Text = "Book Now for " + dp.discountPercent.ToString() + "% off";
              Computed_amount.Attributes.Add("style", "text-decoration:line-through");
            }
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
       
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindDataAccom", "PriceWithoutAccom = "+ PriceWithoutAccom + ";AccommodationScript();", true);
        

    }

  
    public void bindMadina_accommodation(int hotelmadinaID,int AccomMadinaID=0)
{
        PackageEntities db = new PackageEntities();
        var accom = db.Accommodations.Where(q => q.hotelID == hotelmadinaID && q.availability == true).ToList();
        madinaAccommodation_list.DataSource = accom;
        madinaAccommodation_list.DataBind();

        if (AccomMadinaID != 0)
        {
            madinaAccommodation_list.SelectedValue = AccomMadinaID.ToString();
        }
        else
        {
            if (madinaAccommodation_list.Items.Count != 0)
            {
                madinaAccommodation_list.Items[0].Selected = true;
            }
        }
        var data = accom.AsEnumerable().Select(q => new { q.id,q.Name, q.price,q.hotelID, q.availability }).ToArray();
        JsonConvert.SerializeObject(data);
        var serializer = new JavaScriptSerializer();
        String result = serializer.Serialize(data);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "madinaAccom", "var MadinaAccommodations = " + result + ";", true);

    
    }
public void bindMakkah_accommodation(int hotelmakkahID,int AccomMakkahID=0)
{
        PackageEntities db = new PackageEntities();
        var accom = db.Accommodations.Where(q => q.hotelID == hotelmakkahID && q.availability == true).ToList();
        makkahAccommodation_list.DataSource = accom;
        makkahAccommodation_list.DataBind();
        if (AccomMakkahID != 0)
        {
            makkahAccommodation_list.SelectedValue = AccomMakkahID.ToString();
        }
        else
        {
            if (makkahAccommodation_list.Items.Count != 0)
            {
                makkahAccommodation_list.Items[0].Selected = true;
            }
        }
        var data = accom.AsEnumerable().Select(q => new { q.id, q.Name, q.price, q.hotelID, q.availability }).ToArray();
        JsonConvert.SerializeObject(data);
        var serializer = new JavaScriptSerializer();
        String result = serializer.Serialize(data);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "makkahAccom", "var MakkahAccommodations = " + result + ";", true);


    }

public void BindData()
{
    //throw new NotImplementedException();
}

public void OnShowAdminEvent(object sender, EventArgs e)
{
    // throw new NotImplementedException();
}

public void OnHideAdminEvent(object sender, EventArgs e)
{
    // throw new NotImplementedException();
}

public void SetBasePackageControl(IBasePackageControl BasePackageControl)
{
    //  throw new NotImplementedException();
}

protected void bookPackage_Click(object sender, EventArgs e)
{
    if (Page.IsValid)
    {
        PackageEntities db = new PackageEntities();
        String PackageName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
        Package d = db.Packages.Where(q => q.PackageName == PackageName).First();
        Session["AIDMadina"] = madinaAccommodation_list.SelectedValue;
        Session["AIDMakkah"] = makkahAccommodation_list.SelectedValue;
            Session["grandTotel"] = LabelProperty;//Computed_amount//.Text.ToString();
        
            Response.Redirect("~/UmrahBookingPage/" + PackageName + "/BookingForm");
            
    }
}

//protected void changeDataMadina_clicked(object sender, EventArgs e)
//{
//    RadioButton radio = (RadioButton)sender;
//    int makkahID = 0;
//    foreach (RepeaterItem item in makkahAccommodation_list.Items)
//    {
//        RadioButton rb = (RadioButton)item.FindControl("makkah_chk");
//        if (rb.Checked)
//        {
//            Label lb = (Label)item.FindControl("id_makkahAccom");
//            makkahID = int.Parse(lb.Text);
//        }
//    }
//    foreach (RepeaterItem item in madinaAccommodation_list.Items)
//    {
//        RadioButton rb = (RadioButton)item.FindControl("madina_chk");
//        if (rb == radio)
//        {
//            Label lb = (Label)item.FindControl("id_madinaAccom");
//            int madinaID = int.Parse(lb.Text);
//            ComputePrice(makkahID, madinaID);
//        }
//        else { rb.Checked = false; }
//    }


//}
//protected void changeDataMakkah_clicked(object sender, EventArgs e)
//{
//    RadioButton radio = (RadioButton)sender;
//    int madinaID = 0;
//    foreach (RepeaterItem item in madinaAccommodation_list.Items)
//    {
//        RadioButton rb = (RadioButton)item.FindControl("madina_chk");
//        if (rb.Checked)
//        {
//            Label lb = (Label)item.FindControl("id_madinaAccom");
//            madinaID = int.Parse(lb.Text);
//        }
//    }
//    foreach (RepeaterItem item in makkahAccommodation_list.Items)
//    {
//        RadioButton rb = (RadioButton)item.FindControl("makkah_chk");
//        if (rb == radio)
//        {
//            Label lb = (Label)item.FindControl("id_makkahAccom");
//            int makkahID = int.Parse(lb.Text);
//            ComputePrice(makkahID, madinaID);
//        }
//            else { rb.Checked = false; }
//        }


//}
public void ComputePrice(int makkahAccom_id, int madinaAccom_id)
{
    PackageEntities db = new PackageEntities();
    String PackageName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
    Package d = db.Packages.Where(q => q.PackageName == PackageName).First();
    PackageDetail pd = db.PackageDetails.Where(q => q.PackageID == d.id).First();
    //int makkahAccom_id = 0;
    //int madinaAccom_id = 0;
    double price = 0;
    //Get Makkah Accommodation

    if (makkahAccom_id != 0 && madinaAccom_id != 0)
    {
        Session["AIDMadina"] = madinaAccom_id.ToString();
        Session["AIDMakkah"] = makkahAccom_id.ToString();
        Session["grandTotel"] = DiscountAmount.Text; 
        Accommodation madinaAccom = db.Accommodations.Where(q => q.id == madinaAccom_id).First();
        Accommodation makkahAccom = db.Accommodations.Where(q => q.id == makkahAccom_id).First();

        price += (madinaAccom.price * pd.nightsInMadina) + (makkahAccom.price * pd.nightsInMakkah) + pd.getPriceWithout_accommodation;
    }
    else { price = pd.minAmount; }
    Session["grandTotel"] = price.ToString();
        hiddenprice.Value = price.ToString("#,##0");
    Computed_amount.Text = Math.Round(price).ToString("#,##0");
    DateTime today = System.DateTime.Today;
    List<DiscountPackage> discounts = db.DiscountPackages.Where(q => q.packageDetailID == pd.id && (q.availableFrom <= today && q.availableTill >= today)).OrderByDescending(q => q.discountPercent).ToList();
        double total = price;
        if (discounts.Count() != 0)
        {
            DiscountPackage dp = discounts[0];
            Session["discount_id"] = dp.id.ToString();
            total = price - ((int)(price * dp.discountPercent) / 100);
            Session["grandTotel"] = total.ToString("#,##0");
        }
        DiscountAmount.Text = total.ToString("#,##0");

        ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
}

    //itenry Package Detail
    protected void closeItenrtDetail(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();
    }

    protected void myEvent_Raised(object sender, EventArgs e)
    {
        updatePanel_main.Update();
        ModalPopupExtender1.Show();
    }
    protected String LabelProperty
    {
        get
        {
            return hiddenprice.Value;
        }
        set
        {
            hiddenprice.Value = value;
        }
    }


   
}

