using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Flight_Flights : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["airLineID"] == null) { addFlight.Visible = false; }
    }
    public void bindData(int airLineID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
       Flights_list.DataSource = db.Flights.Where(q => q.airLineID == airLineID).ToList();
        Flights_list.DataBind();
    }
    
        protected void openEditPanel(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int flight_id = int.Parse(lk.CommandArgument);
        int airLine_id =  int.Parse(Request.QueryString["airLineID"].ToString());
        String url = "~/UmrahComponents/AdminPages/Flight/AirLineFlightAddEdit?airLineID=" + airLine_id + "&flightID=" + flight_id;
        Response.Redirect(url);
    }

    protected void fromDate_TextChanged(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if(Request.QueryString["airLineID"] != null) { 
        int airLinID = int.Parse(Request.QueryString["airLineID"]);
            bindLimitedData(fromDate.Text, toDate.Text);
        }
    }

    protected void toDate_TextChanged(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (Request.QueryString["airLineID"] != null)
        {
            int airLinID = int.Parse(Request.QueryString["airLineID"]);
            bindLimitedData(fromDate.Text, toDate.Text);
        }
    }

    protected void bindLimitedData(String fd , String td)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int airLinID = int.Parse(Request.QueryString["airLineID"]);
        if (fd != "")
        {
            DateTime fromdate = DateTime.Parse(fd);
            if (td != "")
            {
                DateTime todate = DateTime.Parse(td);
                Flights_list.DataSource = db.Flights.Where(q => q.airLineID == airLinID && q.departureDate >= fromdate && q.departureDate <= todate).ToList();

            }
            else { Flights_list.DataSource = db.Flights.Where(q => q.airLineID == airLinID && q.departureDate >= fromdate).ToList(); }
        }
        else
        {
            Flights_list.DataSource = db.Flights.Where(q => q.airLineID == airLinID).ToList();
        }
        Flights_list.DataBind();
    }

    protected void addNew_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["airLineID"] != null)
        {
            int airLinID = int.Parse(Request.QueryString["airLineID"]);
            
        
        String url = "~/UmrahComponents/AdminPages/Flight/AirLineFlightAddEdit?airLineID="+airLinID;
        Response.Redirect(url);
    }
    }
}