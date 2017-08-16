using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_User_FillInBlanksUserView : CoreDreamControlAdapter, ICoreDreamControl, IQuestion
{

    public event EventHandler DoSubmit;
    public string Quid = "";
    public Components_QuestionBank_User_FillInBlanksUserView()
    {

    }
    public Components_QuestionBank_User_FillInBlanksUserView(string dreamName, string pageName, string BaseDreamServerID)
    {
        ViewState["DreamName"] = dreamName;
        ViewState["PageName"] = pageName;
        ViewState["BaseDreamServerID"] = BaseDreamServerID;
        string userid = HttpContext.Current.User.Identity.GetUserId();
        DreamBirdEntities db = new DreamBirdEntities();
        Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
        if (db.LessonQuestions.Any(q => q.BaseControlID == BaseDreamServerID && q.Layout_id == page.id))
        {
            var lessonQuiz = db.LessonQuestions.Where(q => q.BaseControlID == BaseDreamServerID && q.Layout_id == page.id).First();
            if (db.UserResponses.Any(a => a.QuestionID == lessonQuiz.Question_id && a.UserID == userid && a.Page == page.id))
            {
                Notification.Visible = true;
                question.Visible = false;
                Notification.Text = "Quiz Already Submitted";
            }
            else
            {
                BindQuiz(lessonQuiz);
                question.Visible = true;
                Notification.Visible = false;
                submit_quiz.Visible = true;

            }
        }
        else
        {
            Notification.Visible = true;
            Notification.Text = "Quiz not configured! Go to Admin Page to select a quiz.";
        }
    }

    public Components_QuestionBank_User_FillInBlanksUserView(string dreamName, string pageName, int questionid, bool Repeat)
    {
        ViewState["DreamName"] = dreamName;
        ViewState["PageName"] = pageName;
        string userid = HttpContext.Current.User.Identity.GetUserId();
        DreamBirdEntities db = new DreamBirdEntities();
        Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
        if (Repeat)
        {
            if (db.UserResponses.Any(a => a.QuestionID == questionid && a.UserID == userid && a.Page == page.id))
            {
                Notification.Visible = true;
                question.Visible = false;
                Notification.Text = "Quiz Already Submitted";
            }
            else
            {
                BindQuiz(questionid);
                question.Visible = true;
                Notification.Visible = false;
            }
        }
        else
        {
            BindQuiz(questionid);
            question.Visible = true;
            Notification.Visible = false;
        }
    }

    public Components_QuestionBank_User_FillInBlanksUserView(string dreamName, string pageName, int questionid, bool Repeat, bool SelectedOption)
    {
        ViewState["DreamName"] = dreamName;
        ViewState["PageName"] = pageName;
        string userid = HttpContext.Current.User.Identity.GetUserId();
        DreamBirdEntities db = new DreamBirdEntities();
        Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
        ViewState["PageID"] = page.id;
        if (Repeat)
        {
            if (db.UserResponses.Any(a => a.QuestionID == questionid && a.UserID == userid && a.Page == page.id))
            {
                Notification.Visible = true;
                question.Visible = false;
                Notification.Text = "Quiz Already Submitted";
            }
            else
            {
                BindQuiz(questionid);
                question.Visible = true;
                Notification.Visible = false;
            }
        }
        else
        {
            BindQuiz(questionid, SelectedOption);
            question.Visible = true;
            Notification.Visible = false;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void BindQuiz(LessonQuestion lessonquiz)
    {
        QuestionHeading.Text = lessonquiz.QuestionBank.QuestionText;
        QuestionHeading.Attributes.Add("qid", lessonquiz.Question_id.ToString());
        fib_Correction.Attributes.Add("qidspan", lessonquiz.Question_id.ToString());
        if(lessonquiz.ShowAnswer == true)
        {
            show_answer.Visible = true;
        }
    }

    public void BindQuiz(int questionid, bool CorrectOption = false)
    {

        DreamBirdEntities db = new DreamBirdEntities();
        QuestionBank qb = db.QuestionBanks.Where(w => w.id == questionid).First();

        QuestionHeading.Text = qb.QuestionText;
        QuestionHeading.Attributes.Add("qid", qb.id.ToString());
        if(db.LessonQuestions.Where(w => w.Question_id == questionid).Select(s => s.ShowAnswer).First() == true)
        {
            show_answer.Visible = true;
        }
        if (CorrectOption)
        {
            int quizId = Convert.ToInt32(QuestionHeading.Attributes["qid"].ToString());
            String dreamName = ViewState["DreamName"].ToString();
            String pageName = ViewState["PageName"].ToString();
            int PageID = Convert.ToInt32(ViewState["PageID"].ToString());
            string UserID = HttpContext.Current.User.Identity.GetUserId();
            if (db.UserResponses.Any(w => w.UserID == UserID && w.QuestionID == quizId && w.Page == PageID))
            {
                var userResponse = db.UserResponses.Where(w => w.UserID == UserID && w.QuestionID == quizId && w.Page == PageID).First();
                user_reply_fib.Text = userResponse.UserReply;
            }
        }
    }

    protected void submit_quiz_Click(object sender, EventArgs e)
    {
        bool alreadyAttempted = false;
        int isCorrect = 0;
        String dreamName = ViewState["DreamName"].ToString();
        String pageName = ViewState["PageName"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        int pageid = db.DreamLayouts.Where(w => w.Dream.DreamName == dreamName && w.Page == pageName).Select(s => s.id).First();
        int quizId = Convert.ToInt32(QuestionHeading.Attributes["qid"].ToString());
        string userID = HttpContext.Current.User.Identity.GetUserId();
        UserResponse ur = new UserResponse();
        UserHintStatu uhs = new UserHintStatu();
        if (db.UserResponses.Any(a => a.Page == pageid && a.UserID == userID && a.QuestionID == quizId))
        {
            ur = db.UserResponses.Where(w => w.Page == pageid && w.UserID == userID && w.QuestionID == quizId).First();
            alreadyAttempted = true;
        }
        bool Response = false;
        var FIBOptions = db.FIBOptions.Where(w => w.QuestionID == quizId).First();
        string UserReply = user_reply_fib.Text;
        if (FIBOptions.OptionText == UserReply)
        {
            Response = true;
            if (db.UserHintStatus.Any(a => a.UserID == userID && a.Page == pageid && a.QuestionID == quizId))
            {
                uhs = db.UserHintStatus.Where(w => w.UserID == userID && w.Page == pageid && w.QuestionID == quizId).First();
                if(uhs.HintOption == "Zero")
                {
                    ur.AwardedMarks = 0;
                }
                else
                {
                    ur.AwardedMarks = uhs.HintMarks;
                }
            }
            else
            {
                string BaseDreamServerID = ViewState["BaseDreamServerID"].ToString();
                var lq = db.LessonQuestions.Where(w => w.Layout_id == pageid && w.Question_id == quizId && w.BaseControlID == BaseDreamServerID).First();
                ur.AwardedMarks = lq.HintMarks;
            }
        }
        else
        {
            Response = false;
            ur.AwardedMarks = 0;
        }
        ur.UserPerformance = Response;
        ur.UserReply = UserReply;
        if (!(alreadyAttempted))
        {
            ur.QuestionID = quizId;
            ur.UserID = HttpContext.Current.User.Identity.GetUserId();
            ur.Page = pageid;
            db.UserResponses.Add(ur);
        }
        if (db.LessonMenus.Any(a => a.DreamLayoutID == pageid))
        {
            var LessonMenu = db.LessonMenus.Where(w => w.DreamLayoutID == pageid).First();
            if (db.UserLessonProgresses.Any(a => a.menu_id == LessonMenu.id && a.AspNetUser_id == userID))
            {
                var ulp = db.UserLessonProgresses.Where(w => w.menu_id == LessonMenu.id && w.AspNetUser_id == userID).First();
                ulp.progress = Convert.ToDecimal(ur.AwardedMarks);
            }
            else
            {
                UserLessonProgress ulp = new UserLessonProgress();
                ulp.menu_id = LessonMenu.id;
                ulp.AspNetUser_id = userID;
                ulp.progress = Convert.ToDecimal(ur.AwardedMarks);
                db.UserLessonProgresses.Add(ulp);
            }
        }
        db.SaveChanges();
        if (DoSubmit != null)
        {
            EventArgDreamEdit evt = new EventArgDreamEdit();
            evt.DreamEditID = quizId;
            DoSubmit(this, evt);
        }
    }
    public int QuestionID()
    {
        return Convert.ToInt32(QuestionHeading.Attributes["qid"].ToString()); ;
    }
    public decimal isCorrect()
    {
        UserHintStatu uhs = new UserHintStatu();
        
        bool alreadyAttempted = false;
        int isCorrect = 0;
        decimal AchievedPercentage = 0;
        string dreamName = ViewState["DreamName"].ToString();
        String pageName = ViewState["PageName"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        int pageid = db.DreamLayouts.Where(w => w.Dream.DreamName == dreamName && w.Page == pageName).Select(s => s.id).First();
        int quizId = Convert.ToInt32(QuestionHeading.Attributes["qid"].ToString());
        string userID = HttpContext.Current.User.Identity.GetUserId();
        UserResponse ur = new UserResponse();
        if (db.UserResponses.Any(a => a.Page == pageid && a.UserID == userID && a.QuestionID == quizId))
        {
            ur = db.UserResponses.Where(w => w.Page == pageid && w.UserID == userID && w.QuestionID == quizId).First();
            alreadyAttempted = true;
        }
        bool Response = false;
        bool notAttempted = true;
        var FIBOptions = db.FIBOptions.Where(w => w.QuestionID == quizId).First();
        string UserReply = user_reply_fib.Text;
        if (!UserReply.Equals(""))
        {
            if (FIBOptions.OptionText == UserReply)
            {
                Response = true;
                AchievedPercentage = 100;
            }
            notAttempted = false;
        }
        else
        {
            ur.AwardedMarks = 0;
            AchievedPercentage = 0;
        }
        if (notAttempted)
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "key_alert", "alert('Fill the blank first');", true);
            return 0;
        }
        else
        {
            ur.UserPerformance = Response;
            ur.UserReply = UserReply;
            
            if (!(alreadyAttempted))
            {
                ur.QuestionID = quizId;
                ur.UserID = HttpContext.Current.User.Identity.GetUserId();
                ur.Page = pageid;
                db.UserResponses.Add(ur);
            }
            db.SaveChanges();
            return AchievedPercentage;
        }
    }

    public decimal GetCorrectionPercentage()
    {
        throw new NotImplementedException();
    }
}