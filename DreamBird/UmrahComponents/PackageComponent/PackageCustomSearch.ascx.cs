using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_PackageCustomSearch : System.Web.UI.UserControl,ICorePackageControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { BindInitialData();
        }
    }
    public void BindInitialData()
    {
        PackageEntities db = new PackageEntities();
        if (db.PackageDetails.Count() != 0) { 
        int max = int.Parse(db.PackageDetails.Max(q => q.maxAmount).ToString());
        int min = int.Parse(db.PackageDetails.Min(q => q.minAmount).ToString());
        price_range.Attributes.Add("max", ""+max);
        price_range.Attributes.Add("min", "" + min);
        visa_list.DataSource = db.VisaPackages.ToList();
        visa_list.DataBind();
        }
        // price_range.Attributes.Add("min", "" + min);
        var data1 = db.PackageDetails.AsEnumerable().Select(q => new {q.PackageID, q.Package.PackageName, q.duration, q.isAirLineText, q.getVisaID,  q.getVisaTitle, q.Hotel.rating, q.getDepCity }).ToArray();

       
        JsonConvert.SerializeObject(data1);
        var serializer = new JavaScriptSerializer();
        String result= serializer.Serialize(data1);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "var jsondata = " + result + ";", true);

    }

    public void BindData()
    {
       // throw new NotImplementedException();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
        //throw new NotImplementedException();
    }
}