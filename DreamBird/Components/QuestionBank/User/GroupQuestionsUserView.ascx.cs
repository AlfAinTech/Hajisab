using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_User_GroupQuestionsUserView : CoreDreamControlAdapter, ICoreDreamControl, IQuestion
{
    public Components_QuestionBank_User_GroupQuestionsUserView()
    { }

    public Components_QuestionBank_User_GroupQuestionsUserView(string dreamName, string pageName, string BaseDreamServerID)
    {
        ViewState["DreamName"] = dreamName;
        ViewState["PageName"] = pageName;
        ViewState["BaseDreamServerID"] = BaseDreamServerID;
        ViewState["QuestionStartTime"] = System.DateTime.Now;
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

    public Components_QuestionBank_User_GroupQuestionsUserView(string dreamName, string pageName, int questionid, bool Repeat)
    {
        ViewState["DreamName"] = dreamName;
        ViewState["PageName"] = pageName;
        ViewState["QuestionStartTime"] = System.DateTime.Now;
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

    public Components_QuestionBank_User_GroupQuestionsUserView(string dreamName, string pageName, int questionid, bool Repeat, bool SelectedOption)
    {
        ViewState["DreamName"] = dreamName;
        ViewState["PageName"] = pageName;
        ViewState["QuestionStartTime"] = System.DateTime.Now;
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
                BindQuiz(questionid, SelectedOption);
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

    public event EventHandler DoSubmit;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void BindQuiz(int QuestionID, bool CorrectOption = false)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        QuestionBank qb = db.QuestionBanks.Where(w => w.id == QuestionID).First();
        QuestionHeading.Text = qb.QuestionText;
        QuestionHeading.Attributes.Add("qid", QuestionID.ToString());
        fib_Correction.Attributes.Add("qidspan", QuestionID.ToString());
        if (db.LessonQuestions.Where(w => w.Question_id == QuestionID).Select(s => s.ShowAnswer).First() == true)
        {
            show_answer.Visible = true;
        }
        var GroupQuestions = db.GroupQuestions.Where(w => w.PrimaryQuestionID == QuestionID).Select(s => s.SecondaryQuestionID).ToList();
        foreach (var QID in GroupQuestions)
        {
            var QuestionType = db.QuestionBanks.Where(w => w.id == QID).Select(s => s.QuestionType).First();
            Control control = LoadControl(QuestionType.ViewTypeControl, QID);
            GroupQuestionPlaceholder.Controls.Add(control);
        }
    }

    public void BindQuiz(LessonQuestion lessonquiz)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        QuestionHeading.Text = lessonquiz.QuestionBank.QuestionText;
        QuestionHeading.Attributes.Add("qid", lessonquiz.Question_id.ToString());
        fib_Correction.Attributes.Add("qidspan", lessonquiz.Question_id.ToString());
        if (lessonquiz.ShowAnswer == true)
        {
            show_answer.Visible = true;
        }
        var GroupQuestions = db.GroupQuestions.Where(w => w.PrimaryQuestionID == lessonquiz.Question_id).Select(s => s.SecondaryQuestionID).ToList();
        foreach (var QuestionID in GroupQuestions)
        {
            var QuestionType = db.QuestionBanks.Where(w => w.id == QuestionID).Select(s => s.QuestionType).First();
            Control control = LoadControl(QuestionType.ViewTypeControl, QuestionID);
            GroupQuestionPlaceholder.Controls.Add(control);
        }
    }

    protected void submit_quiz_Click(object sender, EventArgs e)
    {
        bool alreadyAttempted = false;
        String dreamName = ViewState["DreamName"].ToString();
        String pageName = ViewState["PageName"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        int pageid = db.DreamLayouts.Where(w => w.Dream.DreamName == dreamName && w.Page == pageName).Select(s => s.id).First();
        int quizId = Convert.ToInt32(QuestionHeading.Attributes["qid"].ToString());
        string userID = HttpContext.Current.User.Identity.GetUserId();
        UserResponse ur = new UserResponse();
        decimal AchievedPercentage = 0;
        decimal TotalPercentage = GroupQuestionPlaceholder.Controls.Count;
        foreach (var Controls in GroupQuestionPlaceholder.Controls)
        {
            IQuestion question = Controls as IQuestion;
            AchievedPercentage = AchievedPercentage + question.GetCorrectionPercentage();
        }
        if (db.UserResponses.Any(a => a.Page == pageid && a.UserID == userID && a.QuestionID == quizId))
        {
            ur = db.UserResponses.Where(w => w.Page == pageid && w.UserID == userID && w.QuestionID == quizId).First();
            alreadyAttempted = true;
        }
        UserHintStatu uhs = new UserHintStatu();
        bool Response = false;
        decimal AwardedMarks = AchievedPercentage / TotalPercentage;
        string UserReply = "Grouped Question";

        DateTime StartTime = Convert.ToDateTime(ViewState["QuestionStartTime"].ToString());
        DateTime currentTime = System.DateTime.Now;
        double responseTime = currentTime.Subtract(StartTime).TotalSeconds;
        ur.UserPerformance = Response;
        ur.UserReply = UserReply;
        ur.AwardedMarks = AwardedMarks;
        ur.ResponseTime = Convert.ToInt32(responseTime);
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
                ulp.progress = AwardedMarks;
            }
            else
            {
                UserLessonProgress ulp = new UserLessonProgress();
                ulp.menu_id = LessonMenu.id;
                ulp.AspNetUser_id = userID;
                ulp.progress = AwardedMarks;
                db.UserLessonProgresses.Add(ulp);
            }
        }
        db.SaveChanges();
        submit_quiz.Enabled = false;
        submit_quiz.Text = "Question Submitted";
        if (DoSubmit != null)
        {
            EventArgDreamEdit evt = new EventArgDreamEdit();
            evt.DreamEditID = quizId;
            DoSubmit(this, evt);
        }
        //ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script_success", "alert('Quiz Submitted Successfully!');", true);
    }

    public decimal isCorrect()
    {
        bool alreadyAttempted = false;
        int isCorrect = 0;
        decimal CorrectionPercentage = 0;
        decimal AchievedPercentage = 0;
        string dreamName = ViewState["DreamName"].ToString();
        String pageName = ViewState["PageName"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        int pageid = db.DreamLayouts.Where(w => w.Dream.DreamName == dreamName && w.Page == pageName).Select(s => s.id).First();
        int quizId = Convert.ToInt32(QuestionHeading.Attributes["qid"].ToString());
        string userID = HttpContext.Current.User.Identity.GetUserId();
        UserResponse ur = new UserResponse();
        foreach (var Controls in GroupQuestionPlaceholder.Controls)
        {
            IQuestion question = Controls as IQuestion;
            AchievedPercentage = AchievedPercentage + question.GetCorrectionPercentage();
        }
        if (db.UserResponses.Any(a => a.Page == pageid && a.UserID == userID && a.QuestionID == quizId))
        {
            ur = db.UserResponses.Where(w => w.Page == pageid && w.UserID == userID && w.QuestionID == quizId).First();
            alreadyAttempted = true;
        }
        UserHintStatu uhs = new UserHintStatu();
        bool Response = false;
        bool notAttempted = true;
        var Options = db.MCQOptions.Where(w => w.QuestionID == quizId).ToList();
        int correctOptions = db.MCQOptions.Where(w => w.QuestionID == quizId && w.isCorrect == true).Count();
        if (correctOptions != 0)
        {
            CorrectionPercentage = 1 / Convert.ToDecimal(correctOptions);
        }
        string UserReply = "";


        ur.UserPerformance = Response;
        ur.UserReply = UserReply;
        DateTime StartTime = Convert.ToDateTime(ViewState["QuestionStartTime"].ToString());
        DateTime currentTime = System.DateTime.Now;
        double responseTime = currentTime.Subtract(StartTime).TotalSeconds;
        ur.ResponseTime = Convert.ToInt32(responseTime);
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


    public int QuestionID()
    {
        return Convert.ToInt32(QuestionHeading.Attributes["qid"].ToString());
    }

    private UserControl LoadControl(string UserControlPath, params object[] constructorParameters)
    {
        // get the list of parameters and generate type parameters 
        List<Type> constParamTypes = new List<Type>();
        foreach (object constParam in constructorParameters)
        {
            constParamTypes.Add(constParam.GetType());
        }

        // load the user control from given path in old fashioned way
        UserControl control = Page.LoadControl(UserControlPath) as UserControl;

        // get the constructor info with given parameter list
        ConstructorInfo constructor = control.GetType().BaseType.GetConstructor(constParamTypes.ToArray());

        if (constructor == null)
        {
            throw new MemberAccessException("The requested constructor was not found on : " + control.GetType().BaseType.ToString());
        }
        else
        {
            // call the corresponding constructor for pre-activation of the control. 
            constructor.Invoke(control, constructorParameters);
        }

        // return the activated control to be used on the page
        return control;
    }

    public decimal GetCorrectionPercentage()
    {
        throw new NotImplementedException();
    }
}