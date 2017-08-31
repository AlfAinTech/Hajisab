using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_PackageItenryDetail : System.Web.UI.UserControl
{
    // Event Handlers
    public event EventHandler MyEvents;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();

                if (e.Item.ItemType == ListItemType.Footer)
                {
            DropDownList dl = (DropDownList)e.Item.FindControl("cityList_add");
            DropDownList tb = (DropDownList)e.Item.FindControl("hotelListAdd");
             tb.DataSource = db.Hotels.Where(q=>q.hotelType == dl.SelectedValue).ToList();
            tb.DataBind();
            if(tb.Items.Count !=0)
            {
                tb.Items[0].Selected = true;
                hiddencity.Value = tb.Items[0].Value;
            }
            var data = db.Hotels.Select(q => new { q.id, q.hotelName, q.hotelType }).ToList();
            JsonConvert.SerializeObject(data);
            var serializer = new JavaScriptSerializer();
            String result = serializer.Serialize(data);
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "var jsondataHotel = " + result + ";", true);
            dl.Attributes.Add("onchange", " return myfnction(this);");
            tb.Attributes.Add("onchange", " return yourFunction();");
            // ScriptManager.RegisterStartupScript(Page, typeof(Page), "errormine", "myfnction();", true);

        }

    }
    protected void myInit_Range(object sender, EventArgs e)

    {
        string max = "0";
        string min = "0"
;        if (int.Parse(totalnights.Text) > 0)
        {
            min = "1";
            max = totalnights.Text;
        }
      ((RangeValidator)sender).MinimumValue = min;
        ((RangeValidator)sender).MaximumValue = max;
        DreamBirdEntities db = new DreamBirdEntities();
    
    }
    protected void itenry_list_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
      
        if (Page.IsValid)
        {
            string dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            DreamBirdEntities db = new DreamBirdEntities();
            PackageDetail pd = null;
            var data = db.Dreams.Where(q => q.DreamName == dreamName).ToList();
            if (data.Count != 0)
            {
                Dream d = data[0];
                var packageData = db.PackageDetails.Where(q => q.dreamID == d.id).ToList();
                if (packageData.Count != 0)
                { pd = packageData[0]; }
            }
            if (e.CommandName == "add")
            {
                DropDownList dl = (DropDownList)e.Item.FindControl("cityList_add");
                DropDownList hotelLisit =(DropDownList)e.Item.FindControl("hotelListAdd");
                TextBox tb = (TextBox)e.Item.FindControl("nights_add");
                String session = Session.SessionID;
                int total = db.PackageItenryDetails.Where(q => q.packageDetailID == pd.id && q.alharmainUserID == session).Select(t => t.nights).DefaultIfEmpty(0).Sum();
                int newValue = int.Parse(tb.Text);
               // int hotelID = int.Parse(hotelLisit.SelectedValue);
                if (newValue + total <= pd.getTotelNights)
                {
                    PackageItenryDetail pid = new PackageItenryDetail
                    {
                        cityName = dl.SelectedValue.ToString(),
                        nights = int.Parse(tb.Text),
                        packageDetailID = pd.id,
                        alharmainUserID = session,
                        hotelID = int.Parse(hiddencity.Value),
                        transportID = int.Parse(transportList.SelectedValue)
                    };
                    db.PackageItenryDetails.Add(pid);
                    db.SaveChanges();
                    //UpdatePanel up = (UpdatePanel)Page.FindControl("updatePanel_main");
                    //up.Update();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "errorScript", "window.alert('No of Nights should not Exceed Total Nights');", true);

                }
                bindItenryData(pd.id);

            }
            else
            {
                if (e.CommandName == "delete")
                {
                    int id = int.Parse(e.CommandArgument.ToString());
                    String session = Session.SessionID;

                    PackageItenryDetail pid = db.PackageItenryDetails.Where(q => q.id == id && q.alharmainUserID == session).First();
                    db.PackageItenryDetails.Remove(pid);
                    db.SaveChanges();
                    bindItenryData(pd.id);
                }
            }
            //ScriptManager.RegisterStartupScript(Page, typeof(Page), "BindItenryScript", "BindItenryScript();", true);
            
            if (MyEvents != null)
            {
                MyEvents(this, EventArgs.Empty);
            }
        }
    }
    public void bindItenryData(int pkgID)
    {
        
        DreamBirdEntities db = new DreamBirdEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == pkgID).First();
        
        totalnights.Text = pd.getTotelNights.ToString();
        hiddentotaNights.Value = pd.getTotelNights.ToString();
        string durationtxt = "";
        if (pd.startDate.Value.Month == pd.startDate.Value.AddDays(pd.getTotelNights).Month)
            durationtxt = pd.startDate.Value.Day.ToString() + "-" + (pd.startDate.Value.AddDays(pd.getTotelNights)).Day.ToString() + " " + pd.startDate.Value.ToString("MMMM", CultureInfo.InvariantCulture) + ", " + pd.startDate.Value.Year.ToString();
        else
            durationtxt = pd.startDate.Value.Day.ToString() + "-" + (pd.startDate.Value.AddDays(pd.getTotelNights)).Day.ToString() + " " + pd.startDate.Value.ToString("MMMM", CultureInfo.InvariantCulture) + ", "+ pd.startDate.Value.AddDays(pd.getTotelNights).ToString("MMMM", CultureInfo.InvariantCulture) + ", " + pd.startDate.Value.Year.ToString();
        duration.Text = durationtxt;
        itenry_list.DataSource = tripDetailList.DataSource = db.PackageItenryDetails.Where(q => q.packageDetailID == pkgID && q.alharmainUserID == Session.SessionID).ToList();
        itenry_list.DataBind();
        tripDetailList.DataBind();
        transportList.DataSource = db.TransPorts.ToList();
        transportList.DataBind();

    }

}