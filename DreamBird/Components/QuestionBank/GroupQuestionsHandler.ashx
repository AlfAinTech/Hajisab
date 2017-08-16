<%@ WebHandler Language="C#" Class="GroupQuestionsHandler" %>

using System;
using System.Web;
using System.Linq;
public class GroupQuestionsHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string purpose = context.Request["Purpose"];
        string Type = context.Request["Type"];
        string qid = context.Request["QID"];
        string CatID = context.Request["CatID"];
        string SubCatID = context.Request["SubCatID"];
        string Level = context.Request["Level"];
        string jsonString = string.Empty;

        context.Request.InputStream.Position = 0;
        using (var inputStream = new System.IO.StreamReader(context.Request.InputStream))
        {
            jsonString = inputStream.ReadToEnd();
        }
        DreamBirdEntities db = new DreamBirdEntities();
        QuestionBank qb = new QuestionBank();
        int typeid = 0;
        if (db.QuestionTypes.Any(a => a.QTypeName == Type))
        {
            typeid = db.QuestionTypes.Where(w => w.QTypeName == Type).Select(s => s.id).First();
        }
        if (purpose.Equals("AddNewQuestion"))
        {
            qb.QuestionText = jsonString;
            qb.TypeID = typeid;
            qb.CategoryID = Convert.ToInt32(CatID);
            qb.SubCategoryID = Convert.ToInt32(SubCatID);
            qb.Level = Convert.ToInt32(Level);
            db.QuestionBanks.Add(qb);
            db.SaveChanges();
            context.Response.ContentType = "text/plain";
            context.Response.Write(qb.id + "|" + qb.QuestionText);
        }
        else if (purpose.Equals("editQuestionText") && qid != null)
        {
            int questionid = Convert.ToInt32(qid);
            qb = db.QuestionBanks.Where(w => w.id == questionid).First();
            qb.QuestionText = jsonString;
            qb.CategoryID = Convert.ToInt32(CatID);
            qb.SubCategoryID = Convert.ToInt32(SubCatID);
            qb.Level = Convert.ToInt32(Level);
            db.SaveChanges();
            context.Response.ContentType = "text/plain";
            context.Response.Write(qb.id + "|" + qb.QuestionText);
        }
        else if (purpose.Equals("AddHint") && qid != null)
        {
            int Qid = Convert.ToInt32(qid);
            if (db.QuestionHints.Any(a => a.QuestionID == Qid))
            {
                var Hint = db.QuestionHints.Where(w => w.QuestionID == Qid).First();
                Hint.HintText = jsonString;
                db.SaveChanges();
                context.Response.ContentType = "text/plain";
                context.Response.Write(qid + "|" + Hint.HintText);
            }
            else
            {
                QuestionHint hint = new QuestionHint();
                hint.QuestionID = Qid;
                hint.HintText = jsonString;
                db.QuestionHints.Add(hint);
                db.SaveChanges();
                context.Response.ContentType = "text/plain";
                context.Response.Write(qid + "|" + hint.HintText);
            }

        }
        else if (purpose.Equals("RemoveQuestion"))
        {
            int Qid = Convert.ToInt32(qid);
            if (db.FIBOptions.Any(a => a.QuestionID == Qid))
            {
                var mcqoptions = db.FIBOptions.Where(w => w.QuestionID == Qid).ToList();
                foreach (var MCQOption in mcqoptions)
                {
                    db.FIBOptions.Remove(MCQOption);
                }
                db.SaveChanges();
            }
            if (db.QuestionHints.Any(w => w.QuestionID == Qid))
            {
                var Hints = db.QuestionHints.Where(w => w.QuestionID == Qid).ToList();
                foreach (var hint in Hints)
                {
                    db.QuestionHints.Remove(hint);
                }
                db.SaveChanges();
            }
            var Question = db.QuestionBanks.Where(w => w.id == Qid).First();
            db.QuestionBanks.Remove(Question);
            db.SaveChanges();
            context.Response.ContentType = "text/plain";
            context.Response.Write("Question Successfully Removed");
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