using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Booking_BookingConfirmation : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        BindDetailData(TrackingId.Text);


    }
    public void BindDetailData(string trackingId)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        
        var data = db.AlharmainUserPackages.Where(q => q.trackingID == trackingId).ToList();
        if (data.Count() != 0)
        {
            AlharmainUserPackage pd = data[0];
            totelNights.Text = (pd.PackageDetail.nightsInMakkah + pd.PackageDetail.nightsInMadina).ToString();
            hotelName_makkah.Text = pd.PackageDetail.Hotel1.hotelName;
            nights_inMakkah.Text = pd.PackageDetail.nightsInMakkah.ToString();
            hotelName_madina.Text = pd.PackageDetail.Hotel.hotelName;
            nights_inMadina.Text = pd.PackageDetail.nightsInMadina.ToString();
            if (pd.PackageDetail.Hotel.rating > 2)
            {
                hotelRating_madina.Attributes.Add("data-rating", pd.PackageDetail.Hotel.rating.ToString());
                hotelRating_madina.Attributes.Add("data-num-stars", pd.PackageDetail.Hotel.rating.ToString());
            }
            else { hotelRating_madina.Text = "Economy"; }
            if (pd.PackageDetail.Hotel1.rating > 2)
            {
                hotelRating_makkah.Attributes.Add("data-rating", pd.PackageDetail.Hotel1.rating.ToString());
                hotelRating_makkah.Attributes.Add("data-num-stars", pd.PackageDetail.Hotel1.rating.ToString());
            }
            else { hotelRating_makkah.Text = "Economy"; }

            if (pd.PackageDetail.returnFlight)
            {
                roundTrip_panel.Visible = true; AirLine_name.Text = pd.PackageDetail.Flight.Name;
            }
            else
            {
                oneWay_panel.Visible = true;
                departureAirLine_name.Text = pd.PackageDetail.Flight.Name;
                returnAirLine_name.Text = pd.PackageDetail.Flight1.Name;
            }
            Computed_amount.Text = (ComputePrice(pd.AccomMakkahID, pd.AccomMadinaID, pd.PackageDetail) * (pd.adults + pd.children + pd.infants)).ToString();
            divMessage.Style.Add("display", "none");
            Divdetail.Style.Add("display", "block");
        }
        else
        {
            ShowError("Tracking Id not found");
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
    }
    public double ComputePrice(int makkahAccom_id, int madinaAccom_id,PackageDetail pd)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        
        double price = 0;
        //Get Makkah madina Accommodation

        if (makkahAccom_id != 0 && madinaAccom_id != 0)
        {
            Accommodation madinaAccom = db.Accommodations.Where(q => q.id == madinaAccom_id).First();
            Accommodation makkahAccom = db.Accommodations.Where(q => q.id == makkahAccom_id).First();

            price += (madinaAccom.price * pd.nightsInMadina) + (makkahAccom.price * pd.nightsInMakkah) + pd.getPriceWithout_accommodation;
        }
        else { price = pd.minAmount; }
        Computed_amount.Text = Math.Round(price, 2).ToString();
        DateTime today = System.DateTime.Today;
        List<DiscountPackage> discounts = db.DiscountPackages.Where(q => q.packageDetailID == pd.id && (q.availableFrom <= today && q.availableTill >= today)).OrderByDescending(q => q.discountPercent).ToList();
        double total = price;
        if (discounts.Count() != 0)
        {
            DiscountPackage dp = discounts[0];
            total = price - ((int)(price * dp.discountPercent) / 100);
        }
        return total;
    }

    protected void saveUser_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
       var result = db.AlharmainUserPackages.Where(q => q.trackingID == TrackingId.Text).ToList();
        if(result.Count() > 0)
        {
            AlharmainUserPackage aup = result[0];
            aup.IsAmountRecieved = true;
            db.SaveChanges();
            ShowError("Record Saved successfully");
        }
        else
        {
            ShowError("Tracking ID does not Exist");
        }
    }
    public void ShowError(String errorMsg)
    {
        divMessage.Style.Add("display", "block");
        Divdetail.Style.Add("display", "none");
        message.Text = errorMsg;
    }
}