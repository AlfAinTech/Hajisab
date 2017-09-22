using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_UmrahPackageDetail : System.Web.UI.UserControl, ICoreDreamControl
{
    public Boolean isActiveFlag;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        Page.Header.DataBind();
        var scriptManager = ScriptManager.GetCurrent(Page);
        Boolean flag = scriptManager.IsInAsyncPostBack;
        //postback
        if (!IsPostBack)
        {

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
    }

    public void myDaTAbIND()
    {
        DreamBirdEntities db = new DreamBirdEntities();

    String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
    Dream d = db.Dreams.Where(q => q.DreamName == dreamName).First();
    var data = db.PackageDetails.Where(q => q.dreamID == d.id).ToList();
        double PriceWithoutAccom = 0;
        if (data.Count != 0)
        {
            PackageDetail pd = data[0];
            
            PackageItenryDetail.bindItenryData(pd.id);
            totelNights.Text = (pd.nightsInMakkah + pd.nightsInMadina).ToString();
            bookPackage.CommandArgument = pd.id.ToString();
            hotelMakkah_img.ImageUrl = pd.Hotel1.MediaItem.Path500;
            hotelName_makkah.Text = pd.Hotel1.hotelName;
            nights_inMakkah.Text = pd.nightsInMakkah.ToString();
            hotelMadina_img.ImageUrl = pd.Hotel.MediaItem.Path500;
            hotelName_madina.Text = pd.Hotel.hotelName;
            nights_inMadina.Text = pd.nightsInMadina.ToString();
            bindMadina_accommodation(pd.Hotel.id);
            bindMakkah_accommodation(pd.Hotel1.id);
            package_name.Text = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(pd.Dream.DreamName.ToLower());// pd.Dream.DreamName.ToUpper(;
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
                Computed_amount.Attributes.Add("style", "text-decoration:line-through");
            }
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
       
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindDataAccom", "PriceWithoutAccom = "+ PriceWithoutAccom + ";AccommodationScript();", true);
        

    }

  
    public void bindMadina_accommodation(int hotelmadinaID)
{
        DreamBirdEntities db = new DreamBirdEntities();
        var accom = db.Accommodations.Where(q => q.hotelID == hotelmadinaID && q.availability == true).ToList();
        madinaAccommodation_list.DataSource = accom;
        madinaAccommodation_list.DataBind();

        if (Request.QueryString["AccomMadinaID"] != null)
        {
            madinaAccommodation_list.SelectedValue = Request.QueryString["AccomMadinaID"].ToString();
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

        //DreamBirdEntities db = new DreamBirdEntities();
        //madinaAccommodation_list.DataSource = db.Accommodations.Where(q => q.hotelID == hotelmadinaID && q.availability == true).ToList();
        //madinaAccommodation_list.DataBind();
        //if (madinaAccommodation_list.DataSource != null)
        //{
        //    if (Request.QueryString["AccomMadinaID"] != null)
        //    {
        //        string id = Request.QueryString["AccomMadinaID"].ToString();
        //        foreach (RepeaterItem item1 in madinaAccommodation_list.Items)
        //        {
        //            Label lb = (Label)item1.FindControl("id_madinaAccom");
        //            if (lb.Text == id) { RadioButton rb = (RadioButton)item1.FindControl("madina_chk"); rb.Checked = true; }
        //        }

        //    }
        //    else
        //    {
        //        RepeaterItem item = madinaAccommodation_list.Items[0];
        //        RadioButton rb = (RadioButton)item.FindControl("madina_chk");
        //        rb.Checked = true;
        //    }

        //}
    }
public void bindMakkah_accommodation(int hotelmakkahID)
{
        DreamBirdEntities db = new DreamBirdEntities();
        var accom = db.Accommodations.Where(q => q.hotelID == hotelmakkahID && q.availability == true).ToList();
        makkahAccommodation_list.DataSource = accom;
        makkahAccommodation_list.DataBind();
        if (Request.QueryString["AccomMakkahID"] != null)
        {
            makkahAccommodation_list.SelectedValue = Request.QueryString["AccomMakkahID"].ToString();
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


        //DreamBirdEntities db = new DreamBirdEntities();
        //makkahAccommodation_list.DataSource = db.Accommodations.Where(q => q.hotelID == hotelmakkahID && q.availability == true).ToList();
        //makkahAccommodation_list.DataBind();
        //if (makkahAccommodation_list.DataSource != null)
        //{
        //    if (Request.QueryString["AccomMakkahID"] != null)
        //    {
        //        string id = Request.QueryString["AccomMakkahID"].ToString();
        //        foreach (RepeaterItem item1 in makkahAccommodation_list.Items)
        //        {
        //            Label lb = (Label)item1.FindControl("id_makkahAccom");
        //            if (lb.Text == id) { RadioButton rb = (RadioButton)item1.FindControl("makkah_chk"); rb.Checked = true; }
        //        }

        //    }
        //    else
        //    {
        //        RepeaterItem item = makkahAccommodation_list.Items[0];
        //        RadioButton rb = (RadioButton)item.FindControl("makkah_chk");
        //        rb.Checked = true;
        //    }

        //}
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

public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
{
    //  throw new NotImplementedException();
}

protected void bookPackage_Click(object sender, EventArgs e)
{
    if (Page.IsValid)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        Dream d = db.Dreams.Where(q => q.DreamName == dreamName).First();
        Session["AIDMadina"] = madinaAccommodation_list.SelectedValue;
        Session["AIDMakkah"] = makkahAccommodation_list.SelectedValue;
            Session["grandTotel"] = LabelProperty;//Computed_amount//.Text.ToString();
        
            Response.Redirect("~/UmrahBookingPage/" + dreamName + "/BookingForm");
            
    }
}

protected void changeDataMadina_clicked(object sender, EventArgs e)
{
    RadioButton radio = (RadioButton)sender;
    int makkahID = 0;
    foreach (RepeaterItem item in makkahAccommodation_list.Items)
    {
        RadioButton rb = (RadioButton)item.FindControl("makkah_chk");
        if (rb.Checked)
        {
            Label lb = (Label)item.FindControl("id_makkahAccom");
            makkahID = int.Parse(lb.Text);
        }
    }
    foreach (RepeaterItem item in madinaAccommodation_list.Items)
    {
        RadioButton rb = (RadioButton)item.FindControl("madina_chk");
        if (rb == radio)
        {
            Label lb = (Label)item.FindControl("id_madinaAccom");
            int madinaID = int.Parse(lb.Text);
            ComputePrice(makkahID, madinaID);
        }
        else { rb.Checked = false; }
    }


}
protected void changeDataMakkah_clicked(object sender, EventArgs e)
{
    RadioButton radio = (RadioButton)sender;
    int madinaID = 0;
    foreach (RepeaterItem item in madinaAccommodation_list.Items)
    {
        RadioButton rb = (RadioButton)item.FindControl("madina_chk");
        if (rb.Checked)
        {
            Label lb = (Label)item.FindControl("id_madinaAccom");
            madinaID = int.Parse(lb.Text);
        }
    }
    foreach (RepeaterItem item in makkahAccommodation_list.Items)
    {
        RadioButton rb = (RadioButton)item.FindControl("makkah_chk");
        if (rb == radio)
        {
            Label lb = (Label)item.FindControl("id_makkahAccom");
            int makkahID = int.Parse(lb.Text);
            ComputePrice(makkahID, madinaID);
        }
            else { rb.Checked = false; }
        }


}
public void ComputePrice(int makkahAccom_id, int madinaAccom_id)
{
    DreamBirdEntities db = new DreamBirdEntities();
    String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
    Dream d = db.Dreams.Where(q => q.DreamName == dreamName).First();
    PackageDetail pd = db.PackageDetails.Where(q => q.dreamID == d.id).First();
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
        hiddenprice.Value = price.ToString();
    Computed_amount.Text = Math.Round(price, 2).ToString();
    DateTime today = System.DateTime.Today;
    List<DiscountPackage> discounts = db.DiscountPackages.Where(q => q.packageDetailID == pd.id && (q.availableFrom <= today && q.availableTill >= today)).OrderByDescending(q => q.discountPercent).ToList();
        double total = price;
        if (discounts.Count() != 0)
        {
            DiscountPackage dp = discounts[0];
            Session["discount_id"] = dp.id.ToString();
            total = price - ((int)(price * dp.discountPercent) / 100);
            Session["grandTotel"] = total.ToString();
        }
        DiscountAmount.Text = total.ToString();

        ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
}
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

