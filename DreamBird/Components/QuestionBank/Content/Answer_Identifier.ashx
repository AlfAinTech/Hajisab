<%@ WebHandler Language="C#" Class="Answer_Identifier" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Linq;
using System.Collections.Generic;
using Microsoft.AspNet.Identity;

public class Answer_Identifier : IHttpHandler
{
    public class MCQAnswers
    {
        public int QID;
        public string Qtype;
        public List<int> CorrectOptions;
    }

    public class FIBAnswers
    {
        public int QID;
        public string Qtype;
        public string Answer;
    }
    public void ProcessRequest(HttpContext context)
    {
        string QuizzID = null;
        int QuizID = 0;
        int QuestionID = Convert.ToInt32(context.Request["QID"].ToString());
        string URL = context.Request["Path"].ToString();
        if (context.Request["QuizID"] != null)
        {
            QuizzID = context.Request["QuizID"].ToString();
        }
        if (QuizzID != null && QuizzID != "undefined")
        {
            QuizID = Convert.ToInt32(QuizzID);
        }
        string PageName = DreamUtil.getPageNameFromURL(URL);
        string DreamName = DreamUtil.getDreamNameFromURL(URL);
        string UserID = HttpContext.Current.User.Identity.GetUserId();
        DreamBirdEntities db = new DreamBirdEntities();
        string QType = db.QuestionBanks.Where(w => w.id == QuestionID).Select(s => s.QuestionType.QTypeName).First();
        if (QType == "MCQ's")
        {
            var CorrectOptions = db.MCQOptions.Where(w => w.QuestionID == QuestionID && w.isCorrect).Select(s => s.id).ToList();
            if (CorrectOptions.Count > 0)
            {
                MCQAnswers option = new MCQAnswers();
                option.QID = QuestionID;
                option.Qtype = QType;
                option.CorrectOptions = CorrectOptions;
                context.Response.ContentType = "text/plain";
                string response = new JavaScriptSerializer().Serialize(option);
                context.Response.Write(response);
            }
        }
        else if (QType == "FillInBlanks")
        {
            FIBAnswers option = new FIBAnswers();
            string CorrectOption = "No answer saved";
            if (db.FIBOptions.Any(a => a.QuestionID == QuestionID))
            {
                CorrectOption = db.FIBOptions.Where(w => w.QuestionID == QuestionID).Select(s => s.OptionText).First();
            }
            context.Response.ContentType = "text/plain";
            option.Qtype = QType;
            option.QID = QuestionID;
            option.Answer = CorrectOption;
            context.Response.Write(new JavaScriptSerializer().Serialize(option));
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