using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_CustomPackageAdd : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.QueryString["PackageId"] != null)
            {
                int PackageId = int.Parse(Request.QueryString["PackageId"].ToString());
                bindData();
                BindPAckageDetail(PackageId);
                
            }
        }
      //  ScriptManager.RegisterStartupScript(Page, typeof(Page), "startAccom", " ManageAccomodation();", true);
    }

    public void  bindData()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        ddlAirLine.DataSource = db.CustomFlightConfigurations.Select(q=>q.AirLine).ToList();
        ddlAirLine.DataBind();
    }
    public void BindPAckageDetail(int PackageID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        PackageDetail pd = db.PackageDetails.FirstOrDefault(q => q.id == PackageID);
        double PriceWithoutAccom = 0;
        if (pd!=null)
        {
            totelNights.Text = pd.getTotelNights.ToString();
            nights_inMadina.Text = pd.nightsInMadina.ToString();
            nights_inMakkah.Text = pd.nightsInMakkah.ToString();
            hotelDistance_makkah.Text = pd.Hotel1.distance.ToString();
            hotelDistance_madina.Text = pd.Hotel.distance.ToString();
            hotelRating_makkah.Text = pd.Hotel1.rating.ToString();
            bindMadina_accommodation(pd.Hotel.id);
            bindMakkah_accommodation(pd.Hotel1.id);
            hotelRating_madina.Text = pd.Hotel.rating.ToString();
            ddlAirLine.SelectedValue = pd.Flight.AirLine.id.ToString();
            one_way_chk.Checked = ! (roundTrip_chk.Checked = pd.isAirLineAvailable);
            txtMonth.Text = DateTime.Parse(pd.startDate.ToString()).Date.ToString("yyyy-MM");
            Computed_amount.Text = pd.minAmount.ToString();
            PriceWithoutAccom = pd.minAmount;
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


        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);

        ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindDataAccom", "PriceWithoutAccom = " + PriceWithoutAccom + ";AccommodationScript();", true);



    }
    protected void totelNights_TextChanged(object sender, EventArgs e)
    {

    }

    public void bindMadina_accommodation(int hotelmadinaID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var accom = db.Accommodations.Where(q => q.hotelID == hotelmadinaID && q.availability == true).ToList();
        madinaAccommodation_list.DataSource = accom;
        madinaAccommodation_list.DataBind();
        
            if (madinaAccommodation_list.Items.Count != 0)
            {
                madinaAccommodation_list.Items[0].Selected = true;
            }
        var data = accom.AsEnumerable().Select(q => new { q.id, q.Name, q.price, q.hotelID, q.availability }).ToArray();
        JsonConvert.SerializeObject(data);
        var serializer = new JavaScriptSerializer();
        String result = serializer.Serialize(data);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "madinaAccom", "var MadinaAccommodations = " + result + ";", true);


    }
    public void bindMakkah_accommodation(int hotelmakkahID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var accom = db.Accommodations.Where(q => q.hotelID == hotelmakkahID && q.availability == true).ToList();
        makkahAccommodation_list.DataSource = accom;
        makkahAccommodation_list.DataBind();
        
            if (makkahAccommodation_list.Items.Count != 0)
            {
                makkahAccommodation_list.Items[0].Selected = true;
            }
       
    }

    protected void nights_inMadina_TextChanged(object sender, EventArgs e)
    {
        int nightsMadina = 0;
        int nightsMakkah = 0;
        int total = 0;
        if (!string.IsNullOrEmpty(nights_inMakkah.Text))
            nightsMakkah = int.Parse(nights_inMakkah.Text.ToString());
        if (!string.IsNullOrEmpty(nights_inMadina.Text))
            nightsMadina = int.Parse(nights_inMadina.Text.ToString());
        total = nightsMadina + nightsMakkah;
        totelNights.Text = total.ToString();
        ComputePrice();
    }

    protected void hotelDistance_madina_TextChanged(object sender, EventArgs e)
    {
        SetAccommodations();
        ComputePrice();
    }

    protected void hotelDistance_makkah_TextChanged(object sender, EventArgs e)
    {
        SetAccommodations();
        ComputePrice();
    }

    protected void txtMonth_TextChanged(object sender, EventArgs e)
    {
        SetAccommodations();
        ComputePrice();
    }


    protected void madinaAccommodation_list_SelectedIndexChanged(object sender, EventArgs e)
    {
        ComputePrice();
    }

    protected void nights_inMakkah_TextChanged(object sender, EventArgs e)
    {
        int nightsMadina = 0;
        int nightsMakkah = 0;
        int total = 0;
        if (string.IsNullOrEmpty(nights_inMakkah.Text))
            nightsMakkah =  int.Parse(nights_inMakkah.Text.ToString());
        if (string.IsNullOrEmpty(nights_inMadina.Text))
            nightsMadina = int.Parse(nights_inMadina.Text.ToString());
        total = nightsMadina + nightsMakkah;
        totelNights.Text = total.ToString();
        ComputePrice();
    }

    protected void makkahAccommodation_list_SelectedIndexChanged(object sender, EventArgs e)
    {
        ComputePrice();
    }

    protected void one_way_chk_CheckedChanged(object sender, EventArgs e)
    {
        ComputePrice();
    }

    protected void ddlAirLine_SelectedIndexChanged(object sender, EventArgs e)
    {
        ComputePrice();
    }
    public void ShowWarning(String errorMsg)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", " toastr.warning('" + errorMsg + "');;", true);
    }

    public void SetAccommodations()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (!string.IsNullOrWhiteSpace(hotelRating_makkah.Text))
        {
            int distance = int.Parse(hotelDistance_makkah.Text);
            List<CustomHotelConfiguration> HotelList = db.CustomHotelConfigurations.Where(q => q.Distance <= distance && q.HotelCity == "makkah").OrderByDescending(q => q.Distance).ToList();
            CustomHotelConfiguration cusHotel = HotelList.FirstOrDefault();
            if (cusHotel != null)
            {
                hotelRating_makkah.Text = cusHotel.Rating.ToString();
                if (cusHotel.Rating > 2)
                {
                    hotelRating_makkah.Attributes.Add("data-rating", cusHotel.Rating.ToString());
                    hotelRating_makkah.Attributes.Add("data-num-stars", cusHotel.Rating.ToString());
                }
                else { hotelRating_makkah.Text = "Economy"; hotelRating_makkah.CssClass = ""; }

            }

            makkahAccommodation_list.DataSource = HotelList.Select(q => new { Name = q.AccommodationType, id = q.AccommodationType }).ToList();
            makkahAccommodation_list.DataBind();
        }
        
        if (!string.IsNullOrWhiteSpace(hotelDistance_madina.Text))
        {
            int distance = int.Parse(hotelDistance_madina.Text);
            List<CustomHotelConfiguration> HotelList = db.CustomHotelConfigurations.Where(q => q.Distance <= distance && q.HotelCity == "madina").OrderByDescending(q => q.Distance).ToList();
            CustomHotelConfiguration cusHotel = HotelList.FirstOrDefault();
            if (cusHotel != null)
            {
                hotelRating_madina.Text = cusHotel.Rating.ToString();

                if (cusHotel.Rating > 2)
                {
                    hotelRating_madina.Attributes.Add("data-rating", cusHotel.Rating.ToString());
                    hotelRating_madina.Attributes.Add("data-num-stars", cusHotel.Rating.ToString());
                }
                else { hotelRating_madina.Text = "Economy"; hotelRating_madina.CssClass = ""; }


            }
            madinaAccommodation_list.DataSource = HotelList.Select(q => new { Name = q.AccommodationType, id = q.AccommodationType }).ToList();
            madinaAccommodation_list.DataBind();

        }

    }
    public void ComputePrice()
    {
        
        DreamBirdEntities db = new DreamBirdEntities();
        int totalNights = int.Parse(totelNights.Text);
        int DistanceMakkah = hotelDistance_makkah.Text != ""?int.Parse(hotelDistance_makkah.Text):0;
        int DistanceMadina = hotelDistance_madina.Text != "" ? int.Parse(hotelDistance_madina.Text) : 0;
        int nightsInMakkah = nights_inMakkah.Text != "" ? int.Parse(nights_inMakkah.Text) : 0;
        int nightsInMadina = nights_inMadina.Text != "" ? int.Parse(nights_inMadina.Text) : 0;
        string AccomMadina =  madinaAccommodation_list.SelectedValue;
        string AccomMakkah = makkahAccommodation_list.SelectedValue;
        int month = DateTime.Parse(txtMonth.Text).Month;
        Boolean IsRoundTrip = roundTrip_chk.Checked;
        int airLineID = int.Parse(ddlAirLine.SelectedValue);
        CustomHotelConfiguration CustHotelMakkah =  db.CustomHotelConfigurations.Where(q => q.Distance <= DistanceMakkah && q.AccommodationType == AccomMakkah && q.Month.Month == month && q.HotelCity == "makkah").OrderByDescending(q => q.Distance).FirstOrDefault();
        CustomHotelConfiguration CustHotelMadina = db.CustomHotelConfigurations.Where(q => q.Distance <= DistanceMadina && q.AccommodationType == AccomMadina && q.Month.Month == month && q.HotelCity == "madina").OrderByDescending(q => q.Distance).FirstOrDefault();
        CustomFlightConfiguration flight = db.CustomFlightConfigurations.Where(q => q.AirLineID == airLineID && q.IsRoundTrip == IsRoundTrip).ToList().OrderByDescending(q => q.EstimatedPrice).FirstOrDefault();

        string PriceResult = "--";
        decimal price = 0;
        if(CustHotelMakkah  != null && CustHotelMadina !=null && flight != null)
        {
                price =  (CustHotelMadina.EstimatedPrice * nightsInMadina) + (CustHotelMakkah.EstimatedPrice* nightsInMakkah) + flight.EstimatedPrice;
                Session["AIDMadina"] = CustHotelMadina.id.ToString();
                Session["AIDMakkah"] = CustHotelMakkah.id.ToString();
                Session["grandTotel"] = price.ToString();
            PriceResult = price.ToString();
        }
        else
        {
            ShowWarning("No Record Found");
        }

        Computed_amount.Text = PriceResult;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);

    }

    protected void bookPackage_Click(object sender, EventArgs e)
    {

        DreamBirdEntities db = new DreamBirdEntities();
        CustomPackage custPackage = new CustomPackage();
       
        custPackage.MakkahDistance= hotelDistance_makkah.Text != "" ? int.Parse(hotelDistance_makkah.Text) : 0;
        custPackage.MadinaDistance = hotelDistance_madina.Text != "" ? int.Parse(hotelDistance_madina.Text) : 0;
        custPackage.MadinaRating = hotelRating_madina.Text != "" ? int.Parse(hotelRating_madina.Text) : 0;
        custPackage.MakkahRating = hotelRating_makkah.Text != "" ? int.Parse(hotelRating_makkah.Text) : 0;
        custPackage.MakkahAccom = ( madinaAccommodation_list.SelectedValue);
        custPackage.MadinaAccom =  (makkahAccommodation_list.SelectedValue);
        custPackage.month = DateTime.Parse(txtMonth.Text).Month;
        custPackage.isRoundTrip= roundTrip_chk.Checked;
         custPackage.airlineID = int.Parse(ddlAirLine.SelectedValue);
        custPackage.nightsMadina = nights_inMadina.Text != "" ? int.Parse(nights_inMadina.Text) : 0;
        custPackage.nightsMakkah = nights_inMakkah.Text != "" ? int.Parse(nights_inMakkah.Text) : 0;

        db.CustomPackages.Add(custPackage);
        db.SaveChanges();
        Session["CustomPackageID"] = custPackage.id;
       Response.Redirect("~/UmrahCustomBooking/CustomBooking" + "/BookingForm");
    }
}