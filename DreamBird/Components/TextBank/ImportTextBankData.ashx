<%@ WebHandler Language="C#" Class="ImportTextBankData" %>

using System;
using System.Web;
using System.Linq;

public class ImportTextBankData : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        int TextID = Convert.ToInt32(context.Request.QueryString["TextID"].ToString());
        DreamBirdEntities db = new DreamBirdEntities();
        var TextBank = db.TextBanks.Where(w => w.id == TextID).First();
        context.Response.ContentType = "text/plain";
        context.Response.Write(TextBank.textdata);
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}