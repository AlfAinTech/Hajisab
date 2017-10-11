using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_CustomTourPlan : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { BindInitialData(); }
    }

    public void BindInitialData()
    {
        DreamBirdEntities db = new DreamBirdEntities();

       
        var datasource = db.AirLines.ToList();
        airLine_list.DataSource = departureAirLine_list.DataSource = returnAirLine_list.DataSource = datasource;
        airLine_list.DataBind();
        departureAirLine_list.DataBind();
        returnAirLine_list.DataBind();
        if (datasource.Count() != 0)
        {

            airLine_list.SelectedIndex = departureAirLine_list.SelectedIndex = returnAirLine_list.SelectedIndex= 0;
        }
        airLineID.Value = depAirLinID.Value = retAirLineID.Value = airLine_list.SelectedValue;
        var data1 = db.Hotels.AsEnumerable().Select(q => new { q.hotelName, q.id, q.rating}).ToArray();
        var data2 = db.Accommodations.AsEnumerable().Select(q => new { q.Name, q.id, q.price, q.hotelID }).ToArray();
        var data3 = db.Flights.AsEnumerable().Select(q => new { q.Name, q.id, q.price, q.airLineID, q.departureDate}).ToArray();
         var data4 = db.VisaPackages.AsEnumerable().Select(q => new { q.issueDate.Month, q.id, q.amount }).ToArray();
        JsonConvert.SerializeObject(data1);
        var serializer = new JavaScriptSerializer();
        String result = serializer.Serialize(data1);
        JsonConvert.SerializeObject(data1);
        String result2 = serializer.Serialize(data2);
        String result3 = serializer.Serialize(data3);
        String result4 = serializer.Serialize(data4);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showrooms", "var roomsData = " + result2 + ";", true);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showhotel", "var hotelData = " + result + ";", true);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showflight", "var flightData = " + result3 + ";", true);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showVISA", "var visaData = " + result4 + ";", true);

        // ScriptManager.RegisterStartupScript(Page, typeof(Page), "showairLine", "var airLineData = " + result3 + ";", true);
    }






    protected void saveCustomTour_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        
        //CustomPackage pd = new CustomPackage();
        //DateTime dt = DateTime.Parse(month_txt.Text);
        //pd.month = dt.Month;
        //pd.hotelMakkahID = int.Parse(hotelMakkahID.Value);
        //pd.hotelMadinaID = int.Parse(hotelMadinaID.Value);
        //pd.nightsMakkah = int.Parse(nightsMakkah.Text);
        //pd.nightsMadina = int.Parse(nights_madina.Text);
        //pd.roomMadinaID = int.Parse(roomMadinaID.Value);
        //pd.roomMakkahID = int.Parse(roomMakkahID.Value);
        //if (isRoundTrip.Value == "false")
        //{
        //    pd.returnAirLineID = int.Parse(depAirLinID.Value);
        //    pd.departureAirLineID = int.Parse(retAirLineID.Value);
        //    pd.retFlightID = int.Parse(retFlight_id.Value);
        //    pd.depFlightID = int.Parse(depFlight_id.Value);

        //}
        //else
        //{
        //    pd.returnAirLineID = pd.departureAirLineID = int.Parse(airLineID.Value);
        //    pd.depFlightID = pd.retFlightID = int.Parse(flight_id.Value);
        //}
//       db.CustomPackages.Add(pd);
        db.SaveChanges();
      //  Response.Redirect("~/UmrahComponents/booking_form.aspx?isCustomPackage=true&packageID=" + pd.id);
    }
    

}