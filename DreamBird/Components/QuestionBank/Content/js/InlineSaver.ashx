<%@ WebHandler Language="C#" Class="InlineSaver" %>

using System;
using System.Web;
using System.Linq;

public class InlineSaver : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string QuestionID = context.Request.QueryString["QID"].ToString();
        string Type = context.Request.QueryString["Request_type"].ToString();
        int qid = Convert.ToInt32(QuestionID);
        DreamBirdEntities db = new DreamBirdEntities();
        string jsonString = string.Empty;
        context.Request.InputStream.Position = 0;
        using (var inputStream = new System.IO.StreamReader(context.Request.InputStream))
        {
            jsonString = inputStream.ReadToEnd();
        }
        if (Type.Equals("Question"))
        {
            var Qb = db.QuestionBanks.Where(w => w.id == qid).First();
            Qb.QuestionText = jsonString;
            db.SaveChanges();
            context.Response.ContentType = "text/plain";
            context.Response.Write(Qb.QuestionText);
        }
        else if (Type.Equals("Option"))
        {
            int OpID = Convert.ToInt32(context.Request.QueryString["OPID"].ToString());
            var Option = db.MCQOptions.Where(w => w.QuestionID == qid && w.id == OpID).First();
            Option.OptionText = jsonString;
            db.SaveChanges();
            context.Response.ContentType = "text/plain";
            context.Response.Write(Option.OptionText);
        }
        else if (Type.Equals("AddOption"))
        {
            MCQOption mcqo = new MCQOption();
            mcqo.QuestionID = qid;
            mcqo.OptionText = jsonString;
            db.MCQOptions.Add(mcqo);
            db.SaveChanges();
            context.Response.ContentType = "text/plain";
            context.Response.Write("Option Saved");
        }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}