using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_User_MCQUserView : CoreDreamControlAdapter, ICoreDreamControl, IQuestion
{
    public event EventHandler DoSubmit;

    public Components_QuestionBank_User_MCQUserView()
    {

    }

    public Components_QuestionBank_User_MCQUserView(int QuestionID)
    {
        BindQuiz(QuestionID, true);
        question.Visible = true;
        Notification.Visible = false;
        submit_quiz.Visible = false;
    }
    public Components_QuestionBank_User_MCQUserView(string dreamName, string pageName, string BaseDreamServerID)
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

    public Components_QuestionBank_User_MCQUserView(string dreamName, string pageName, int questionid, bool Repeat)
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

    public Components_QuestionBank_User_MCQUserView(string dreamName, string pageName, int questionid, bool Repeat, bool SelectedOption)
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
        //if(db.LessonQuestions.Where(w => w.Question_id == QuestionID).Select(s => s.ShowAnswer).First() == true)
        //{
        //    show_answer.Visible = true;
        //}
        if (CorrectOption == false)
        {
            rptr_QuestionOptions.ItemDataBound += Rptr_QuestionOptions_ItemDataBound;
        }

        rptr_QuestionOptions.DataSource = db.MCQOptions.Where(w => w.QuestionID == qb.id).ToList();
        rptr_QuestionOptions.DataBind();
        if (db.MCQOptions.Where(w => w.QuestionID == qb.id && w.isCorrect == true).Count() == 1)
        {
            HF1.Text = "single";
        }
        else
        {
            HF1.Text = "Multiple";
        }
        HF1.Attributes.Add("data-qid", qb.id.ToString());
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "checkboxEvent", "$(document).on('click', 'input[type=checkbox]:checked', function(){ var qid = $(this).parent().data('qid'); var id = $(this).parent().data('opid'); var qtype = $('input[type=text][data-qid='+qid+']').val(); if(qtype == 'single'){ $('span[data-qid='+qid+']').each(function(){ if($(this).data('opid')!=id){ $(this).children('input[type=checkbox]').prop('checked', false); } }); } });", true);
    }

    private void Rptr_QuestionOptions_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            int quizId = Convert.ToInt32(QuestionHeading.Attributes["qid"].ToString());
            //String dreamName = ViewState["DreamName"].ToString();
            //String pageName = ViewState["PageName"].ToString();
            if(ViewState["PageID"] != null)
            {
                int PageID = Convert.ToInt32(ViewState["PageID"].ToString());
                string UserID = HttpContext.Current.User.Identity.GetUserId();
                DreamBirdEntities db = new DreamBirdEntities();
                if (db.UserResponses.Any(w => w.UserID == UserID && w.QuestionID == quizId && w.Page == PageID))
                {
                    var userResponse = db.UserResponses.Where(w => w.UserID == UserID && w.QuestionID == quizId && w.Page == PageID).First();
                    Label OptionText = e.Item.FindControl("OptionText") as Label;
                    string CorrectOption = userResponse.UserReply;
                    if (OptionText.Text.Equals(CorrectOption))
                    {
                        CheckBox cbox = e.Item.FindControl("CheckedOption") as CheckBox;
                        cbox.Checked = true;
                    }
                }
            }
            
        }
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
        DreamBirdEntities db = new DreamBirdEntities();
        rptr_QuestionOptions.DataSource = db.MCQOptions.Where(w => w.QuestionID == lessonquiz.QuestionBank.id).ToList();
        rptr_QuestionOptions.DataBind();
        if (db.MCQOptions.Where(w => w.QuestionID == lessonquiz.QuestionBank.id && w.isCorrect == true).Count() == 1)
        {
            HF1.Text = "single";
        }
        else
        {
            HF1.Text = "Multiple";
        }
        HF1.Attributes.Add("data-qid", lessonquiz.Question_id.ToString());
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "checkboxEvent", "$(document).on('click', 'input[type=checkbox]:checked', function(){ var qid = $(this).parent().data('qid'); var id = $(this).parent().data('opid'); var qtype = $('input[type=text][data-qid='+qid+']').val(); if(qtype == 'single'){ $('span[data-qid='+qid+']').each(function(){ if($(this).data('opid')!=id){ $(this).children('input[type=checkbox]').prop('checked', false); } }); } });", true);
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
        if (db.UserResponses.Any(a => a.Page == pageid && a.UserID == userID && a.QuestionID == quizId))
        {
            ur = db.UserResponses.Where(w => w.Page == pageid && w.UserID == userID && w.QuestionID == quizId).First();
            alreadyAttempted = true;
        }
        UserHintStatu uhs = new UserHintStatu();
        bool Response = false;
        var Options = db.MCQOptions.Where(w => w.QuestionID == quizId).ToList();
        int correctoptions = db.MCQOptions.Where(w => w.QuestionID == quizId && w.isCorrect == true).Count();
        decimal CorrectPercentage = 0;
        decimal AwardedMarks = 0;
        if (correctoptions != 0)
        {
            CorrectPercentage = Convert.ToDecimal(1) / Convert.ToDecimal(correctoptions);
        }
        string UserReply = "";
        foreach (RepeaterItem item in rptr_QuestionOptions.Items)
        {
            CheckBox cbox = (CheckBox)item.FindControl("CheckedOption");
            if (cbox.Checked)
            {
                int OptionID = Convert.ToInt32(cbox.Attributes["data-opid"].ToString());
                foreach (var option in Options)
                {
                    if (option.id == OptionID && option.isCorrect == true)
                    {
                        Response = true;
                        UserReply = UserReply + option.OptionText + ", ";
                        if (db.UserHintStatus.Any(a => a.Page == pageid && a.UserID == userID && a.QuestionID == quizId))
                        {
                            uhs = db.UserHintStatus.Where(w => w.Page == pageid && w.UserID == userID && w.QuestionID == quizId).First();
                            if (uhs.HintOption == "Zero")
                            {
                                AwardedMarks = 0;
                            }
                            else if (uhs.HintOption == "Negative" || uhs.HintOption == "Normal")
                            {
                                AwardedMarks = AwardedMarks + Convert.ToDecimal(uhs.HintMarks) * CorrectPercentage;
                            }
                        }
                        else
                        {
                            string BaseDreamServerID = ViewState["BaseDreamServerID"].ToString();
                            var lq = db.DreamPageControls.Where(w => w.Layout_ID == pageid && w.BaseDreamServer_ID == BaseDreamServerID).First();
                            AwardedMarks = AwardedMarks + Convert.ToDecimal(lq.TotalProgress) * CorrectPercentage;
                        }
                    }
                    else
                    {
                        Response = false;
                    }
                }
            }
        }
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
        if(db.LessonMenus.Any(a => a.DreamLayoutID == pageid))
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

    public int QuestionID()
    {
        return Convert.ToInt32(QuestionHeading.Attributes["qid"].ToString());
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
        if(correctOptions != 0)
        {
            CorrectionPercentage = 1 / Convert.ToDecimal(correctOptions);
        }
        string UserReply = "";
        foreach (RepeaterItem item in rptr_QuestionOptions.Items)
        {
            CheckBox cbox = (CheckBox)item.FindControl("CheckedOption");
            if (cbox.Checked)
            {
                notAttempted = false;
                int OptionID = Convert.ToInt32(cbox.Attributes["data-opid"].ToString());
                foreach (var option in Options)
                {
                    if (option.id == OptionID && option.isCorrect == true)
                    {
                        Response = true;
                        UserReply = option.OptionText;
                        AchievedPercentage = AchievedPercentage + CorrectionPercentage;
                    }
                    else if (option.id == OptionID && option.isCorrect == false)
                    {
                        UserReply = option.OptionText;
                        isCorrect = 2;
                    }
                }
            }
        }
        if (notAttempted)
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "key_alert", "alert('Select an Option First');", true);
            return 0;
        }
        else
        {
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
    }

    public decimal GetCorrectionPercentage()
    {
        decimal CorrectionPercentage = 0;
        decimal AchievedPercentage = 0;
        int QuestionID = Convert.ToInt32(QuestionHeading.Attributes["qid"].ToString());
        DreamBirdEntities db = new DreamBirdEntities();
        int correctOptions = db.MCQOptions.Where(w => w.QuestionID == QuestionID && w.isCorrect == true).Count();
        var Options = db.MCQOptions.Where(w => w.QuestionID == QuestionID).ToList();

        if (correctOptions != 0)
        {
            CorrectionPercentage = 1 / Convert.ToDecimal(correctOptions);
        }
        foreach (RepeaterItem item in rptr_QuestionOptions.Items)
        {
            CheckBox cbox = (CheckBox)item.FindControl("CheckedOption");
            if (cbox.Checked)
            {
                int OptionID = Convert.ToInt32(cbox.Attributes["data-opid"].ToString());
                foreach (var option in Options)
                {
                    if (option.id == OptionID && option.isCorrect == true)
                    {
                        AchievedPercentage = AchievedPercentage + CorrectionPercentage;
                    }
                }
            }
        }
        return AchievedPercentage;
    }
}