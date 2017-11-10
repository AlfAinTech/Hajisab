using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_OfferedPackages : System.Web.UI.UserControl,ICorePackageControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindDataScript();
    }
    public void BindDataScript()
    {
        PackageEntities db = new PackageEntities();
        var data1 = db.PackageDetails.AsEnumerable().Select(q => new { q.id, q.maxRange, minRange = Convert.ToDecimal(q.minRange).ToString("#,##0"), q.getMonth, q.PackageID, q.Package.PackageName, q.duration, q.isAirLineText, q.getVisaID, q.getVisaTitle, q.Hotel1.rating, hotelMadina = q.Hotel.hotelName, hotelMakkah = q.Hotel1.hotelName, q.getDepCity, airLineName = q.getairLine, q.nightsInMadina, q.nightsInMakkah, makkahRating = q.Hotel1.rating, madinaRating = q.Hotel.rating, makkahDistance = q.Hotel1.distance, madinaDistance = q.Hotel.distance, q.packageType }).ToArray();
        JsonConvert.SerializeObject(data1);
        var serializer = new JavaScriptSerializer();
        String result = serializer.Serialize(data1);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "putdata", "var jsondata = " + result + ";", true);

    }
    public void BindData()
    {
        // throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
        // throw new NotImplementedException();
    }
    //public UpdatePanelUpdateMode UpdateMode
    //{
    //    get { return this.UpdatePanel1.UpdateMode; }
    //    set { this.UpdatePanel1.UpdateMode = value; }
    //}

    //public void Update()
    //{
    //    this.UpdatePanel1.Update();
    //}
}