using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_PackagePageDetail : System.Web.UI.UserControl,ICorePackageControl
{
    public Boolean isActiveFlag;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindData();
        }
    }
    public void bindData()
    {  
            PackageEntities db = new PackageEntities();
         
        String PackageName =  PackageUtil.getPackageNameFromURL(Request.RawUrl);
        Package d =  db.Packages.Where(q => q.PackageName == PackageName).First();
        var data  =db.PackageDetails.Where(q => q.PackageID == d.id).ToList();
            if(data.Count!=0)
            {
                PackageDetail pd = data[0];
                hotelMakkah_img.ImageUrl = pd.Hotel1.MediaItem.PathOriginal;
                hotelName_makkah.Text = pd.Hotel1.hotelName;
                nights_inMakkah.Text = pd.nightsInMakkah.ToString();
                distance_makkah.Text = pd.Hotel1.distance.ToString();
                amount_lbl.Text = Convert.ToDecimal(pd.minAmount).ToString("#,##0") + "-" + Convert.ToDecimal( pd.maxAmount).ToString("#,##0");
                hotelMadina_img.ImageUrl = pd.Hotel.MediaItem.PathOriginal;
                hotelName_madina.Text = pd.Hotel.hotelName;
                nights_inMadina.Text = pd.nightsInMadina.ToString();
                distance_madina.Text = pd.Hotel.distance.ToString();
                if (pd.returnFlight) { roundTrip_panel.Visible = true; AirLine_name.Text = pd.Flight.Name; cities_lbl.Text=pd.Flight1.fromCity +" - " +pd.Flight1.destinationCity +" | "+ pd.Flight1.Name; cities_lbl.Text = pd.Flight1.destinationCity + " - " + pd.Flight1.fromCity; }
                else {
                    oneWay_panel.Visible = true;
                    departureAirLine_name.Text = pd.Flight.Name;
                    returnAirLine_name.Text = pd.Flight1.Name;
                    depcities_lbl.Text = pd.Flight.fromCity + " - " + pd.Flight.destinationCity;
                    returncities_lbl.Text = pd.Flight1.fromCity + " - " + pd.Flight1.destinationCity;
                }
                facilitiesMakkah_list.DataSource = db.HotelFacilities.Where(q => q.hotelID == pd.Hotel1.id).ToList();
                facilitiesMakkah_list.DataBind();
                facilitiesMadina_list.DataSource = db.HotelFacilities.Where(q => q.hotelID == pd.Hotel.id).ToList();
                facilitiesMadina_list.DataBind();
                var imageData = db.HotelImages.Where(q => q.hotelID == pd.hotelIDMakkah).OrderBy(q=>q.id).ToList();
                if (imageData.Count() != 0) {
                    
                     imageData[0].ClassActive=" active";
                    // db.SaveChanges();
                    hotelMakkahImages_list.DataSource = imageData;
                    hotelMakkahImages_list.DataBind();
                }
                var imagemadina = db.HotelImages.Where(q => q.hotelID == pd.hotelIDMadina).ToList();
                if(imagemadina.Count()!=0)
                {
                    imagemadina[0].ClassActive = " active";
                    imagesMadina_list.DataSource = imagemadina;
                    imagesMadina_list.DataBind();
                }
                
                hotelNameMakkah.Text = pd.Hotel1.hotelName;
                hotelNameMadina.Text = pd.Hotel.hotelName;
                

            }
        
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
}