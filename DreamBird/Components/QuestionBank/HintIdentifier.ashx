<%@ WebHandler Language="C#" Class="HintIdentifier" %>

using System;
using System.Web;
using System.Linq;
using System.Web.Script.Serialization;
using Microsoft.AspNet.Identity;
using System.Collections.Generic;

public class HintIdentifier : IHttpHandler
{

    public class FIBHintOptions
    {
        public string CorrectionOption;
        public int QuestionID;
    }

    public void ProcessRequest(HttpContext context)
    {
        string QuizzID = null;
        int QuizID = 0;
        int QuestionID = Convert.ToInt32(context.Request["QID"].ToString());
        string URL = context.Request["Path"].ToString();
        if(context.Request["QuizID"] != null)
        {
            QuizzID = context.Request["QuizID"].ToString();
        }
        if(QuizzID != null && QuizzID != "undefined")
        {
            QuizID = Convert.ToInt32(QuizzID);
        }
        string PageName = DreamUtil.getPageNameFromURL(URL);
        string DreamName = DreamUtil.getDreamNameFromURL(URL);
        string UserID = HttpContext.Current.User.Identity.GetUserId();
        DreamBirdEntities db = new DreamBirdEntities();
        int PageID = db.DreamLayouts.Where(w => w.Page == PageName && w.Dream.DreamName == DreamName).Select(s => s.id).First();
        if (QuizID == 0)
        {
            var lessQuestion = db.LessonQuestions.Where(w => w.Layout_id == PageID && w.Question_id == QuestionID).First();
            if (db.UserHintStatus.Any(a => a.UserID == UserID && a.Page == PageID && a.QuestionID == QuestionID))
            {
                var HintStatus = db.UserHintStatus.Where(w => w.UserID == UserID && w.Page == PageID && w.QuestionID == QuestionID).First();
                HintStatus.HintOption = lessQuestion.HintOption;
                HintStatus.HintMarks = lessQuestion.HintMarks;
                db.SaveChanges();
            }
            else
            {
                UserHintStatu HintStatus = new UserHintStatu();
                HintStatus.HintOption = lessQuestion.HintOption;
                HintStatus.HintMarks = lessQuestion.HintMarks;
                HintStatus.UserID = UserID;
                HintStatus.QuestionID = QuestionID;
                HintStatus.Page = PageID;
                db.UserHintStatus.Add(HintStatus);
                db.SaveChanges();
            }
        }
        else
        {
            var lessonquiz = db.LessonQuizs.Where(w => w.QuizID == QuizID).First();
            if (db.UserHintStatus.Any(a => a.UserID == UserID && a.Page == PageID && a.QuestionID == QuestionID))
            {
                var HintStatus = db.UserHintStatus.Where(w => w.UserID == UserID && w.Page == PageID && w.QuestionID == QuestionID).First();
                HintStatus.HintOption = lessonquiz.HintOption;
                HintStatus.HintMarks = Convert.ToDecimal(lessonquiz.Marks / lessonquiz.QuizBank.QuizBankQuestions.Count);
                db.SaveChanges();
            }
            else
            {
                UserHintStatu HintStatus = new UserHintStatu();
                HintStatus.HintOption = lessonquiz.HintOption;
                HintStatus.HintMarks = Convert.ToDecimal(lessonquiz.Marks / lessonquiz.QuizBank.QuizBankQuestions.Count);
                HintStatus.UserID = UserID;
                HintStatus.QuestionID = QuestionID;
                HintStatus.Page = PageID;
                db.UserHintStatus.Add(HintStatus);
                db.SaveChanges();
            }

        }
        //string QType = db.QuestionBanks.Where(w => w.id == QuestionID).Select(s => s.QuestionType.QTypeName).First();
        //if (QType == "MCQ's")
        //{
        //    var CorrectOptions = db.MCQOptions.Where(w => w.QuestionID == QuestionID && w.isCorrect).Select(s => s.id).ToList();
        //    if (CorrectOptions.Count > 0)
        //    {
        //        MCQHintOptions option = new MCQHintOptions();
        //        option.Qtype = QType;
        //        option.CorrectOptions = CorrectOptions;
        //        context.Response.ContentType = "text/plain";
        //        string response = new JavaScriptSerializer().Serialize(option);
        //        context.Response.Write(response);
        //    }
        //}
        //else if (QType == "FillInBlanks")
        //{
        //    FIBHintOptions option = new FIBHintOptions();
        //    string CorrectOption = db.FIBOptions.Where(w => w.QuestionID == QuestionID).Select(s => s.OptionText).First();
        //    context.Response.ContentType = "text/plain";
        //    option.Qtype = QType;
        //    option.QuestionID = QuestionID;
        //    option.CorrectionOption = CorrectOption;
        //    context.Response.Write(new JavaScriptSerializer().Serialize(option));
        //}
        if(db.QuestionHints.Any(a => a.QuestionID == QuestionID))
        {
            FIBHintOptions option = new FIBHintOptions();
            var Hint = db.QuestionHints.Where(w => w.QuestionID == QuestionID).First();
            option.QuestionID = QuestionID;
            option.CorrectionOption = Hint.HintText;
            context.Response.ContentType = "text/plain";
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