using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chat : System.Web.UI.Page
{
    public String token;
    public String sessionID;
    public String pythonServer;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["token"] == null || Session["pythonServer"] == null) {
            Response.Redirect("Connect.aspx");
        }
        token = Session["token"].ToString();
        sessionID = Session.SessionID;
        pythonServer = Session["pythonServer"].ToString();

       
    }

  
}