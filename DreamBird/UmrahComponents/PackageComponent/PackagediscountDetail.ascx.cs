using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_PackagediscountDetail : System.Web.UI.UserControl,ICoreDreamControl
{
    public Boolean isCustomPackage
    { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { bindData(); }
    }
    public void bindData()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        Dream d = db.Dreams.Where(q => q.DreamName == dreamName).First();
        PackageDetail pd = db.PackageDetails.Where(q => q.dreamID == d.id).First();
            package_panel.Visible = !isCustomPackage;
            customPackge_panel.Visible = isCustomPackage;
            totalAmount_txt.Text = getTotelPrice(pd).ToString();
            if (!isCustomPackage)
            {
                discount_list.DataSource = db.DiscountPackages.Where(q => q.packageDetailID == pd.id).ToList();
                discount_list.DataBind();
                var data = db.PackageDetails.Where(q => q.dreamID == pd.id).ToList();
            }
            else
            {
                CustomPackage cp = db.CustomPackages.Where(q => q.id == pd.id).First();
                makkahHotel_detail.Text = cp.Hotel.hotelName + " (" + cp.nightsMakkah + " nights, " + cp.Accommodation.Name.ToLower() + " )";
                madinaHotel_detail.Text = cp.Hotel1.hotelName + " (" + cp.nightsMadina + " nights, " + cp.Accommodation1.Name.ToLower() + " )";
                airLine_detail.Text = cp.AirLine.Name;
                var visa = db.VisaPackages.Where(q => q.issueDate.Month == cp.month).ToList();
                double visaPrice = 0;
                if(visa.Count()!=0)
                { visaPrice = visa[0].amount; }
                double flightPrice = 0;
                if(!cp.isRoundTrip)
                {flightPrice= cp.Flight.price + cp.Flight1.price; }
                else { flightPrice = cp.Flight.price; }
                double result = (cp.Accommodation.price * cp.nightsMakkah) + (cp.Accommodation1.price * cp.nightsMadina) + flightPrice + visaPrice;
                totelPrice.Text = Math.Round(result).ToString();
            }
          
        }
    
    protected void discount_changed(object sender, EventArgs e)
    {

        RadioButton rd = (RadioButton)sender;
        int id = 0;
        foreach (RepeaterItem item in discount_list.Items)
        {
            RadioButton rb = (RadioButton)item.FindControl("isselected_btn");
            if (rb != rd)
            {
                rb.Checked = false;

            }
            else
            {
                Label lb = (Label)item.FindControl("id_lbl");
                id = int.Parse(lb.Text);
            }
        }
      
        double total = 0;
        if (id != 0) { 
        ViewState["selectedID"] = id.ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        Dream d = db.Dreams.Where(q => q.DreamName == dreamName).First();
        var data = db.PackageDetails.Where(q => q.dreamID == d.id).ToList();
            if(data.Count() !=0)
            {
                PackageDetail pd = data[0];
               DiscountPackage dp =  db.DiscountPackages.Where(q => q.id == id).First();
                total = getTotelPrice(pd);
               total = total-( (int)(total * dp.discountPercent) / 100);
                totalAmount_txt.Text = total.ToString();
            }
        
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

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
       // throw new NotImplementedException();
    }

    protected void save_Click(object sender, EventArgs e)
    {
        if (ViewState["selectedID"] != null) {
            int id = int.Parse(ViewState["selectedID"].ToString());
            DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        Dream d = db.Dreams.Where(q => q.DreamName == dreamName).First();
        PackageDetail pd = db.PackageDetails.Where(q => q.dreamID == d.id).First();
        var dl = db.DreamLayouts.Where(q => q.DreamID == d.id && q.Page == "BookingForm").ToList();
        if (dl.Count()!=0)
        {
            DreamLayout dll = dl[0];
                
                Session["discountPkgID"] = id.ToString();
                Response.Redirect("~/DreamHome/" + d.DreamName + "/" + dll.Page);
            }
        }
        else
        {
            //show error that select a discount package;
            ShowError("Select Discount");
        }
    }
    public void ShowError(String errorMsg)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('" + errorMsg + "');", true);
    }

    public double getTotelPrice(PackageDetail pd)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        double result = 0;
        if (pd.isAirLineAvailable) { if (pd.returnFlight) { result += pd.Flight1.price; } else { result += pd.Flight1.price + pd.Flight.price; } }
        if (pd.isVisaAvailable) { result += pd.VisaPackage.amount; }
        result += pd.additionalExpense;    
        if (Session["AIDMadina"]!=null && Session["AIDMakkah"]!=null)
        {
            int aidMadina = int.Parse(Session["AIDMadina"].ToString());
            int aidMakkah = int.Parse(Session["AIDMakkah"].ToString());
            var accomMakkah = db.Accommodations.Where(q => q.id == aidMakkah).ToList();
            if (accomMakkah.Count()!=0)
            { Accommodation aMakkah = accomMakkah[0];
                result += aMakkah.price*pd.nightsInMakkah;
            }
            var accomMadina = db.Accommodations.Where(q => q.id == aidMadina).ToList();
            if (accomMadina.Count() != 0)
            {
                Accommodation aMadina = accomMadina[0];
                result += aMadina.price*pd.nightsInMadina;
            }

        }
        return result;
    }
}
