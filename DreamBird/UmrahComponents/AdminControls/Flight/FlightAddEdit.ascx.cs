using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Flight_FlightAddEdit : System.Web.UI.UserControl
{
    public event EventHandler closeClicked;
    public event EventHandler SaveClicked;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindData();
        }
    }

    protected void close_Click(object sender, EventArgs e)
    {
        if(closeClicked !=null)
        {
            closeClicked(sender, EventArgs.Empty);
        }
       
    }
    public void bindData()
    {
        PackageEntities db = new PackageEntities();
        if(Request.QueryString["flightID"] != null)
        {
            int flight_id = int.Parse(Request.QueryString["flightID"].ToString());
            Flight f = db.Flights.Where(q => q.id == flight_id).First();
            airLine_lbl.Text = f.AirLine.Name;
            name_txt.Text = f.Name;
            destCity_ddl.SelectedValue = f.destinationCity;
            fromcity_ddl.SelectedValue = f.fromCity;
            DateTime d = (DateTime)f.departureDate;
            DateTime r = (DateTime)f.returnDate;
            fromDate.Text = d.ToString("yyyy-MM-dd");
            returnDate.Text = r.ToString("yyyy-MM-dd");
            price_txt.Text = f.price.ToString();
            if(f.flightType == 1)
            { one_way_chk.Checked=true; }
            else { roundTrip_chk.Checked = true; }

        }

    }

    
    protected void save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid) {
            PackageEntities db = new PackageEntities();
            int chk = 0;
            if (one_way_chk.Checked)
                { chk = 1; }
            else
            { if (roundTrip_chk.Checked) { chk = 2; }
              else{ ShowError("Select One Way OR Roud Trip Check"); }
            }

            if (Request.QueryString["airLineID"] != null && Request.QueryString["flightID"] !=null)
            {
                DateTime from = DateTime.Parse(fromDate.Text.ToString());
                DateTime till = DateTime.Parse(returnDate.Text.ToString());
                if(from > till) { ShowError("Invalid Date Limit");  return; }
                int airLineID = int.Parse(Request.QueryString["airLineID"].ToString());
                int flight_id = int.Parse(Request.QueryString["flightID"].ToString());
                Flight ff = db.Flights.Where(q => q.id == flight_id).First();
                ff.Name = name_txt.Text;
                
                ff.departureDate = from;
                ff.returnDate =till;
                ff.fromCity = fromcity_ddl.SelectedValue;
                ff.destinationCity = destCity_ddl.SelectedValue;
                ff.flightType = chk;
                ff.price = float.Parse(price_txt.Text);
                //update respective packages
                List<PackageDetail> packages = db.PackageDetails.Where(q => q.Flight.airLineID == airLineID || q.Flight1.airLineID == airLineID).ToList();
                foreach (PackageDetail pd in packages)
                {
                    pd.minRange = pd.minAmount;
                    pd.maxRange = pd.maxAmount;
                    db.SaveChanges();
                }
            }
            else
            {
               
                if (Request.QueryString["airLineID"] != null)

                {
                    int airLineID = int.Parse(Request.QueryString["airLineID"].ToString());
                    Flight f = new Flight
                    { Name = name_txt.Text,
                        departureDate = DateTime.Parse(fromDate.Text.ToString()),
                        returnDate = DateTime.Parse(returnDate.Text.ToString()),
                        fromCity = fromcity_ddl.SelectedValue,
                        destinationCity = destCity_ddl.SelectedValue,
                        flightType = chk,
                        price = float.Parse(price_txt.Text),
                        airLineID = airLineID,
                    };
                    db.Flights.Add(f);
                }
            }
            db.SaveChanges();
        if (SaveClicked != null)
        {
            SaveClicked(sender, EventArgs.Empty);
        }
        
    }
    }
    public void ShowError(String errorMsg)
    {
        //ErrorMessage.Text = errorMsg;
        //ErrorMessage.Visible = true;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('" + errorMsg + "');", true);
    }

}