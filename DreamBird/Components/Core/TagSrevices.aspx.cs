using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
public partial class Components_Core_TagSrevices : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static String GetTags(string q)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var dt = db.Tags.ToList();
        String data;// = dt.ToString();

       
        var jsonSerialiser = new JavaScriptSerializer();
        var json = jsonSerialiser.Serialize(dt);
        //return json;
        data ="[ { 'id':'856','name':'House'}, { 'id':'1035','name':'Desperate Housewives'},]";
        return data;

    }

}