<%@ WebHandler Language="C#" Class="MultipleFIBHandler" %>

using System;
using System.Web;
using HtmlAgilityPack;
using System.Linq;

public class MultipleFIBHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        //string purpose = context.Request["Purpose"];
        string Type = context.Request["Type"];
        string qid = context.Request["QID"];
        string CatID = context.Request["CatID"];
        string SubCatID = context.Request["SubCatID"];
        string Level = context.Request["Level"];
        string jsonString = string.Empty;
        int QuestionID = Convert.ToInt32(qid);
        context.Request.InputStream.Position = 0;
        using (var inputStream = new System.IO.StreamReader(context.Request.InputStream))
        {
            jsonString = inputStream.ReadToEnd();
        }
        DreamBirdEntities db = new DreamBirdEntities();
        if (qid == "0")
        {
            int TypeID = db.QuestionTypes.Where(w => w.QTypeName == Type).Select(s => s.id).First();
            QuestionBank qb = new QuestionBank();
            qb.QuestionText = "Multiple Fill In Blanks Question";
            qb.TypeID = TypeID;
            qb.Level = Convert.ToInt32(Level);
            qb.CategoryID = Convert.ToInt32(CatID);
            qb.SubCategoryID = Convert.ToInt32(SubCatID);
            db.QuestionBanks.Add(qb);
            db.SaveChanges();
            QuestionID = qb.id;
            MultiFIBMarkup Markup = new MultiFIBMarkup();
            Markup.QuestionMarkup = jsonString;
            Markup.QuestionID = qb.id;
            db.MultiFIBMarkups.Add(Markup);
            db.SaveChanges();
        }
        else
        {
            var qb = db.QuestionBanks.Where(w => w.id == QuestionID).First();
            qb.Level = Convert.ToInt32(Level);
            qb.CategoryID = Convert.ToInt32(CatID);
            qb.SubCategoryID = Convert.ToInt32(SubCatID);
            var Markup = db.MultiFIBMarkups.Where(w => w.QuestionID == QuestionID).First();
            Markup.QuestionMarkup = jsonString;
            db.SaveChanges();
        }
        if (db.MultiFIBComponents.Any(a => a.QuestionID == QuestionID))
        {
            var mfibComponents = db.MultiFIBComponents.Where(w => w.QuestionID == QuestionID).ToList();
            foreach(var mfibcomponent in mfibComponents)
            {
                db.MultiFIBComponents.Remove(mfibcomponent);
            }
            db.SaveChanges();
        }
        HtmlDocument html = new HtmlDocument();
        html.LoadHtml(jsonString);
        var root = html.DocumentNode;
        var descendents = root.Descendants("div").Where(w => w.Attributes.Contains("data-component") /*.Where(w => w.Attributes["class"].Value == "mfib" || w.Attributes["class"].Value == "mfibb").ToList()*/);

        foreach (var descendent in descendents)
        {
            int sequence = Convert.ToInt32(descendent.Attributes["data-component"].Value);
            string ContentType = descendent.Attributes["data-type"].Value;
            if (ContentType.Equals("Text"))
            {
                MultiFIBComponent mfib = new MultiFIBComponent();
                string content = descendent.Descendants("span").Where(w => w.Attributes["class"].Value == "mfib").Select(s => s.InnerText).First();
                mfib.QuestionID = QuestionID;
                mfib.TextType = ContentType;
                mfib.TextContent = content;
                mfib.Weightage = 0;
                mfib.Sequence = sequence;
                db.MultiFIBComponents.Add(mfib);
            }
            else if (ContentType.Equals("Blank"))
            {
                MultiFIBComponent mfib = new MultiFIBComponent();
                string content = descendent.Descendants("span").Where(w => w.Attributes["class"].Value == "mfib").Select(s => s.InnerText).First();
                decimal Weightage = Convert.ToDecimal(descendent.Descendants("span").Where(w => w.Attributes.Contains("data-weightage")).Select(s => s.Attributes["data-weightage"].Value).First());
                mfib.QuestionID = QuestionID;
                mfib.TextType = ContentType;
                mfib.TextContent = content;
                mfib.Weightage = Weightage;
                mfib.Sequence = sequence;
                db.MultiFIBComponents.Add(mfib);
            }
            db.SaveChanges();
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}