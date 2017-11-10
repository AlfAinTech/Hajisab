using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Packages_PackageDetail : System.Web.UI.UserControl , IPackageTypeCore
{
    static public int DreamID;
    public event EventHandler SaveClicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindData();
        }
    }
    public void BindData()
    { }
    public void BindData(int dreamID)
    {
        String uid = HttpContext.Current.User.Identity.GetUserId();
        DreamID = dreamID;
        PackageEntities db = new PackageEntities();

            var data = db.PackageDetails.Where(q => q.PackageID == dreamID).ToList();
            //bind data to lists
            makkahHotel_list.DataSource = db.Hotels.Where(q=> q.hotelType == "makkah").ToList();  
            hotelMadina_list.DataSource = db.Hotels.Where(q => q.hotelType == "madina").ToList();
            transport_list.DataSource = db.TransPorts.ToList();
            transport_list.DataBind();
            if (transport_list.Items.Count != 0) { transport_list.SelectedIndex = 0; }
            flightDeparture_list.DataSource = db.Flights.Where(q=>q.flightType== 1).ToList();
            flightReturn_list.DataSource = db.Flights.Where(q => q.flightType == 1).ToList(); 
            flight_list.DataSource = db.Flights.Where(q=>q.flightType ==2).ToList();
            visa_list.DataSource = db.VisaPackages.ToList();
            ziarat_list.DataSource = db.Ziarats.ToList();
            ziarat_list.DataBind();
            if (ziarat_list.Items.Count != 0) { ziarat_list.SelectedIndex = 0; }
            if (HttpContext.Current.User.IsInRole("UmrahAdmin"))
            {
            makkahHotel_list.DataSource = db.Hotels.Where(q => q.AspNetUserID ==uid && q.hotelType=="makkah").ToList();
            hotelMadina_list.DataSource = db.Hotels.Where(q => q.AspNetUserID == uid && q.hotelType == "madina").ToList();
            flightDeparture_list.DataSource = db.Flights.Where(q => q.flightType == 1 && q.AirLine.AspNetUserID==uid).ToList();
            flightReturn_list.DataSource = db.Flights.Where(q => q.flightType == 1 && q.AirLine.AspNetUserID == uid).ToList();
            flight_list.DataSource = db.Flights.Where(q => q.flightType == 2 && q.AirLine.AspNetUserID == uid).ToList();
            visa_list.DataSource = db.VisaPackages.Where(q=>q.AspNetUserID==uid).ToList();}

        makkahHotel_list.DataBind(); if (makkahHotel_list.Items.Count != 0) { makkahHotel_list.SelectedIndex = 0; }
        hotelMadina_list.DataBind(); if (hotelMadina_list.Items.Count != 0) { hotelMadina_list.SelectedIndex = 0; }
        flightDeparture_list.DataBind(); if (flightDeparture_list.Items.Count != 0) { flightDeparture_list.SelectedIndex = 0; }
        flightReturn_list.DataBind();if (flightReturn_list.Items.Count != 0) { flightReturn_list.SelectedIndex = 0; }
        flight_list.DataBind(); if (flight_list.Items.Count != 0) { flight_list.SelectedIndex = 0; }
        visa_list.DataBind();if (visa_list.Items.Count != 0) { visa_list.SelectedIndex = 0; }
        if (data.Count() != 0)
            { 
                PackageDetail pd = data[0];
                
                additionalExp_txt.Text = pd.additionalExpense.ToString();
                additionalDetail_txt.Text = pd.additionalDetail;
                startDate.Text = pd.startDate.Value.ToString("yyyy-MM-dd");
                packageType.SelectedValue = pd.packageType;
                nightInMakkah_txt.Text = pd.nightsInMakkah.ToString();
                nightsInMadina_txt.Text = pd.nightsInMadina.ToString();
                makkahHotel_list.SelectedValue = pd.hotelIDMakkah.ToString();
                hotelMadina_list.SelectedValue = pd.hotelIDMadina.ToString();
                isAirLineAvailable.Checked = pd.isAirLineAvailable;
                
               
                if (pd.isTransportAvailable)
                {
                    isTranspost_chk.Checked = pd.isTransportAvailable;
                    transport_list.SelectedValue = pd.transportID.ToString();
                }
                if(pd.isZiaratAvailable)
                {
                    isZiarat_chk.Checked = pd.isZiaratAvailable;
                    ziarat_list.SelectedValue = pd.ziaratID.ToString();
                }
                if(pd.isVisaAvailable)
                {
                    isVisa_chk.Checked = pd.isVisaAvailable;
                    visa_list.SelectedValue = pd.visaID.ToString();
                }
                if (pd.isAirLineAvailable) { 
                if (pd.returnFlight)
                {
                    roundTrip_chk.Checked =roundTrip_chk.Visible=  pd.returnFlight;
                        oneWay_chk.Checked = oneWay_panel.Visible = !pd.returnFlight;
                        flight_list.SelectedValue = pd.returnFlightID.ToString();
                }
                
                else
                {
                    oneWay_chk.Checked = oneWay_panel.Visible = !pd.returnFlight;
                    roundTrip_chk.Checked = roundTrip_panel.Visible = pd.returnFlight;
                    flightDeparture_list.SelectedValue = pd.departureFlightID.ToString();
                    flightReturn_list.SelectedValue = pd.returnFlightID.ToString();
                    }
                }



            }
        
    }

    protected void oneWay_chk_CheckedChanged(object sender, EventArgs e)
    {
        oneWay_panel.Visible = oneWay_chk.Checked;
        roundTrip_panel.Visible = !oneWay_chk.Checked;
        roundTrip_chk.Checked = !oneWay_chk.Checked;
    }

    protected void roundTrip_chk_CheckedChanged(object sender, EventArgs e)
    {
        roundTrip_panel.Visible = roundTrip_chk.Checked;
        oneWay_panel.Visible =  !roundTrip_chk.Checked;
        oneWay_chk.Checked = !roundTrip_chk.Checked;
    }
    public void ShowError(String errorMsg)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('" + errorMsg + "');", true);
    }
    protected void save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && Validated()) {
            
            PackageEntities db = new PackageEntities();
            Package pkg = db.Packages.Where(q => q.id == DreamID).First();
            int totalNights = int.Parse(nightInMakkah_txt.Text) + int.Parse(nightsInMadina_txt.Text);
            var data = db.PackageDetails.Where(q => q.PackageID == DreamID).ToList();
            PackageDetail pd;
            if (data.Count()!=0)
            {
                pd = data[0];
                pd.hotelIDMakkah = int.Parse(makkahHotel_list.SelectedValue);
                pd.hotelIDMadina = int.Parse(hotelMadina_list.SelectedValue);
                int additionalExp = 0;
                if(!string.IsNullOrWhiteSpace(additionalExp_txt.Text))
                    additionalExp = int.Parse(additionalExp_txt.Text);

                pd.additionalExpense = additionalExp;
                pd.startDate = DateTime.Parse(startDate.Text.ToString());
                pd.additionalDetail = additionalDetail_txt.Text;
                pd.returnFlight = roundTrip_chk.Checked;
                pd.nightsInMakkah = int.Parse(nightInMakkah_txt.Text);
                pd.nightsInMadina = int.Parse(nightsInMadina_txt.Text);
                pd.packageType = packageType.SelectedValue.ToString();
                    pd.isAirLineAvailable = isAirLineAvailable.Checked;
                if (isAirLineAvailable.Checked) {

                        if (roundTrip_chk.Checked) { pd.returnFlightID = pd.departureFlightID = int.Parse(flight_list.SelectedValue); }
                        else { if (oneWay_chk.Checked) { pd.returnFlightID = int.Parse(flightReturn_list.SelectedValue); pd.departureFlightID = int.Parse(flightDeparture_list.SelectedValue); } } 
                    pd.isVisaAvailable = isVisa_chk.Checked;
                    }
                if (isVisa_chk.Checked) { pd.visaID=int.Parse(visa_list.SelectedValue); }
                pd.isTransportAvailable = isTranspost_chk.Checked;
                if (isTranspost_chk.Checked) { pd.transportID = int.Parse(transport_list.SelectedValue); }
                pd.isZiaratAvailable = isZiarat_chk.Checked;
                if (isZiarat_chk.Checked) { pd.ziaratID=int.Parse(ziarat_list.SelectedValue); }
            }
            else
            {

                pd = new PackageDetail();

                pd.hotelIDMakkah = int.Parse(makkahHotel_list.SelectedValue);
                pd.hotelIDMadina = int.Parse(hotelMadina_list.SelectedValue);
                int additionalExp = 0;
                if (!string.IsNullOrWhiteSpace(additionalExp_txt.Text))
                    additionalExp = int.Parse(additionalExp_txt.Text);

                pd.additionalExpense = additionalExp;
                pd.additionalDetail = additionalDetail_txt.Text;
                pd.nightsInMakkah = int.Parse(nightInMakkah_txt.Text);
                pd.nightsInMadina = int.Parse(nightsInMadina_txt.Text);
                pd.returnFlight = roundTrip_chk.Checked;
                pd.isVisaAvailable = isVisa_chk.Checked;
                pd.isTransportAvailable = isTranspost_chk.Checked;
                pd.isZiaratAvailable = isZiarat_chk.Checked;
                pd.PackageID = DreamID;
                pd.startDate = DateTime.Parse(startDate.Text);
                pd.packageType = packageType.SelectedValue;
            
                if (roundTrip_chk.Checked) { pd.returnFlightID = pd.departureFlightID= int.Parse(flight_list.SelectedValue); }
                else { if (oneWay_chk.Checked) { pd.returnFlightID = int.Parse(flightReturn_list.SelectedValue); pd.departureFlightID = int.Parse(flightDeparture_list.SelectedValue); } }

                if (isVisa_chk.Checked) { pd.visaID = int.Parse(visa_list.SelectedValue); }

                if (isTranspost_chk.Checked) { pd.transportID = int.Parse(transport_list.SelectedValue); }

                if (isZiarat_chk.Checked) { pd.ziaratID = int.Parse(ziarat_list.SelectedValue); }
                db.PackageDetails.Add(pd);
                //=================================Code for Creating by default detail anf booking page
                //save two pages pkg detail and Booking Form first time
                //ClientLayout cl_detail = db.ClientLayouts.Where(q=>q.layoutName == "UmrahDetail").First();
                //ClientLayout cl_bookingForm = db.ClientLayouts.Where(q => q.layoutName == "BookingForm").First();
                //DreamLayout dl_detail = new DreamLayout
                //{
                //    DreamID= DreamID,
                //    IsPublished=true,
                //    Layout = cl_detail.layoutContent,
                //    Page="umrahDetail",
                //    IsUserDefaultPage=false,
                //    LayoutType="Normal",
                //};
                //DreamLayout dl_bookingForm = new DreamLayout
                //{
                //    DreamID = DreamID,
                //    IsPublished = true,
                //    Layout = cl_bookingForm.layoutContent,
                //    Page = "bookingForm",
                //    IsUserDefaultPage = false,
                //    LayoutType = "Normal",
                //};
                //db.DreamLayouts.Add(dl_detail);
                //db.DreamLayouts.Add(dl_bookingForm);
                //db.SaveChanges();
                //String content_detail = cl_detail.layoutContent + "SPLITumrahDetailSPLITPageSPLIT" +DreamID+ "SPLITLayout";
                //requestdata(content_detail);
                //String content_form = cl_bookingForm.layoutContent + "SPLITbookingFormSPLITPageSPLIT" + DreamID + "SPLITLayout";
                //requestdata(content_form);


            }
            db.SaveChanges(); 
            PackageDetail p = db.PackageDetails.Where(q => q.PackageID == DreamID).First();
            p.minRange = p.minAmount;
            p.maxRange = p.maxAmount;
            db.SaveChanges();

            if (SaveClicked != null)
            {
                SaveClicked(sender, EventArgs.Empty);
            }
        
    }
    }
    public Boolean Validated()
    {
        Boolean result = true;
        if (oneWay_chk.Checked)
        {
            if (flightDeparture_list.SelectedValue == "" && flightReturn_list.SelectedValue=="")
            {
                result = false;
                ShowError("Select Flights");
            }
        }
        else
        {
            if (flight_list.SelectedValue == "")
            {
                result = false;
                ShowError("Select Flight");
            }
        }
        return result;
    }

    public void requestdata(string content)
    {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://"+HttpContext.Current.Request.Url.Host + ":" + HttpContext.Current.Request.Url.Port.ToString() + "/Components/PageTemplate/LayoutSave.ashx");
       

        var postData="";
        postData = content;
        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "false";
        request.ContentLength = data.Length;

        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
    }
    //public Boolean checkFlights()
    //{
    //    Boolean result = true;
    //    PackageEntities db = new PackageEntities();
    //    if (oneWay_chk.Checked) {

    //        int returnID = int.Parse(flightReturn_list.SelectedValue);
    //        int deppartureID = int.Parse(flightDeparture_list.SelectedValue);
    //        Flight rf = db.Flights.Where(q => q.id == returnID).First();
    //        Flight df = db.Flights.Where(q => q.id == deppartureID).First();
    //        if(rf.airLineID != df.airLineID) { result = false;
    //            ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('Select Same AirLine for Flights')", true);
    //        }
    //    }
    //    return result;
    //}





}