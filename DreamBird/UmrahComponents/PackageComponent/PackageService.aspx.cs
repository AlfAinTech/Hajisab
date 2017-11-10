using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
//using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Script.Serialization;

public partial class UmrahComponents_PackageComponent_PackageService : System.Web.UI.Page
{
    [WebMethod]
    public static string getallDumpData()
    {
       
        string result="";
        PackageEntities db = new PackageEntities();
        var data1 = db.PackageDetails.Select(q=> new { q.Package.PackageName, abc= q.GetDetails(), q.duration,q.isAirLineAvailable,q.isVisaAvailable,q.VisaPackage.visaTitle }).ToArray();
        JsonConvert.SerializeObject(data1);
        var serializer = new JavaScriptSerializer();
        return serializer.Serialize(data1);
       // return result;
    }
}