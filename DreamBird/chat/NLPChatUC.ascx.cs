using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chat_NLPChatUC : System.Web.UI.UserControl
{

    public String token;
    public String sessionID;
    public String pythonServer;
    protected void Page_Load(object sender, EventArgs e)
    {
        string x = Request["__EVENTARGUMENT"];

        if (Session["token"] == null || Session["pythonServer"] == null)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            //String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            //String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
            //Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
            //DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName).First();
            //var data = db.ChatAdmins.Where(q => q.layoutID == page.id).ToList();
            var data = db.ChatAdmins.Where(q=>q.id == 8).ToList();
            if (data.Count() != 0)
            {
                ChatAdmin c = data[0];
                Session["token"] = c.tokenID; Session["pythonServer"] = c.serverID;
            }
        }
        token = Session["token"].ToString();
        sessionID = Session.SessionID;
        pythonServer = Session["pythonServer"].ToString(); BindData();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "LoadScript", "LoadScript();", true);





    }
    protected void BookNowClick(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        string x = Request["__EVENTARGUMENT"];//bt.CommandArgument;
        int id = int.Parse(x);//int.Parse(bt.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        Response.Redirect("/UmrahHome/" + pd.Dream.DreamName + "/UmrahDetail");

    }

    public void BindData()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var data1 = db.PackageDetails.AsEnumerable().Select(q => new { q.id, q.maxRange, q.minRange, q.getMonth, q.dreamID, q.Dream.DreamName, q.duration, q.isAirLineText, q.getVisaID, q.getVisaTitle, q.Hotel.rating, hotelMakkah = q.Hotel.hotelName, hotelMadina = q.Hotel1.hotelName, q.getDepCity, airLineName = q.Flight1.AirLine.Name, q.nightsInMadina, q.nightsInMakkah }).ToArray();
        JsonConvert.SerializeObject(data1);
        var serializer = new JavaScriptSerializer();
        String result = serializer.Serialize(data1);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "var jsondata = " + result + ";", true);

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


    protected void RefreshButton_OnClick(object sender, EventArgs e)
    {
        SessionIDManager manager = new SessionIDManager();

        string newID = manager.CreateSessionID(Context);
        bool redirected = false;
        bool isAdded = false;
        manager.SaveSessionID(Context, newID, out redirected, out isAdded);
        sessionID = Session.SessionID;
        UpdatePanel1.Update();
        ScriptManager.RegisterStartupScript(refreshPanel, refreshPanel.GetType(), "bindSession", " sessionID = '" + sessionID + "'; $('#bot_msg_Area').innerHTML='';", true);
    }
}