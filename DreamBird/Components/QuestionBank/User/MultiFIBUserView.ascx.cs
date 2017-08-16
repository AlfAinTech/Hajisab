using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_User_MultiFIBUserView : CoreDreamControlAdapter, ICoreDreamControl, IQuestion
{
    public event EventHandler DoSubmit;
    public Components_QuestionBank_User_MultiFIBUserView()
    {
        // not implemented
    }

    public Components_QuestionBank_User_MultiFIBUserView(string dreamName, string pageName, string BaseDreamServerID)
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

    public decimal isCorrect()
    {
        return 0;
    }

    public int QuestionID()
    {
        return 0;
    }

    public void BindQuiz(int QID)
    {

    }

    public void BindQuiz(LessonQuestion LessonQuiz)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        questionid.Value = LessonQuiz.Question_id.ToString();
        if (db.MultiFIBComponents.Any(a => a.QuestionID == LessonQuiz.Question_id))
        {
            var QuestionComponents = db.MultiFIBComponents.Where(w => w.QuestionID == LessonQuiz.Question_id).OrderBy(o => o.Sequence).ToList();
            foreach (var QuestionComponent in QuestionComponents)
            {
                if (QuestionComponent.TextType == "Text")
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl createDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    createDiv.Attributes.Add("class", "col-md-3");
                    createDiv.Attributes.Add("style", "padding:15px;");
                    Label L2 = new Label();
                    L2.ID = "text_" + QuestionComponent.Sequence;
                    L2.Text = QuestionComponent.TextContent;
                    createDiv.Controls.Add(L2);
                    ComponentHolder.Controls.Add(createDiv);
                }
                else if (QuestionComponent.TextType == "Blank")
                {
                    this.CreateTextBox("dynamic_" + QuestionComponent.Sequence);
                }
            }
        }
    }

   
    protected void Page_Load(object sender, EventArgs e)
    {
        //List<string> keys = Request.Form.AllKeys.Where(key => key.Contains("dynamic_")).ToList();
        //foreach (string str in keys)
        //{
        //    this.CreateTextBox(str);
        //}
    }


    protected void CreateTextBox(string ID)
    {
        //System.Web.UI.HtmlControls.HtmlGenericControl createDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        //createDiv.Attributes.Add("class", "col-md-3");
        //createDiv.Attributes.Add("style", "padding:15px;");
        TextBox txt = new TextBox();
        txt.ID = ID;
        txt.CssClass = "form-control";
        txt.TextMode = TextBoxMode.MultiLine;
        txt.Attributes.Add("style", "width:20% !important; float:left; margin:15px;");
        //createDiv.Controls.Add(txt);
        ComponentHolder.Controls.Add(txt);
    }
    protected void submit_quiz_Click(object sender, EventArgs e)
    {
        bool alreadyAttempted = false;
        String dreamName = ViewState["DreamName"].ToString();
        String pageName = ViewState["PageName"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        int pageid = db.DreamLayouts.Where(w => w.Dream.DreamName == dreamName && w.Page == pageName).Select(s => s.id).First();
        int quizId = Convert.ToInt32(questionid.Value);
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
        decimal CorrectPercentage = Convert.ToDecimal(db.MultiFIBComponents.Where(w => w.QuestionID == quizId).Select(s => s.Weightage).Sum());
        decimal AwardedMarks = 0;
        string UserReply = "";
        foreach (var Control in ComponentHolder.Controls)
        {
            if (Control is TextBox)
            {
                TextBox tbox = Control as TextBox;
                string data = tbox.Text.ToLower();
                int sequence = Convert.ToInt32(tbox.ID.Substring(tbox.ID.IndexOf("_") + 1, tbox.ID.Length - (tbox.ID.IndexOf("_") + 1)));

                var MultiFibOption = db.MultiFIBComponents.Where(w => w.Sequence == sequence && w.QuestionID == quizId).First();
                if (data.Equals(MultiFibOption.TextContent.ToLower()))
                {
                    Response = true;
                    UserReply = UserReply + ", " + data;
                    if (db.UserHintStatus.Any(a => a.Page == pageid && a.UserID == userID && a.QuestionID == quizId))
                    {
                        uhs = db.UserHintStatus.Where(w => w.Page == pageid && w.UserID == userID && w.QuestionID == quizId).First();
                        if (uhs.HintOption == "Zero")
                        {
                            AwardedMarks = 0;
                        }
                        else if (uhs.HintOption == "Negative" || uhs.HintOption == "Normal")
                        {
                            AwardedMarks = AwardedMarks + Convert.ToDecimal(uhs.HintMarks) * (Convert.ToDecimal(MultiFibOption.Weightage) / CorrectPercentage);
                        }
                    }
                    else
                    {
                        string BaseDreamServerID = ViewState["BaseDreamServerID"].ToString();
                        var lq = db.DreamPageControls.Where(w => w.Layout_ID == pageid && w.BaseDreamServer_ID == BaseDreamServerID).First();
                        AwardedMarks = AwardedMarks + Convert.ToDecimal(lq.TotalProgress) * (Convert.ToDecimal(MultiFibOption.Weightage) / CorrectPercentage);
                    }
                }
            }
        }
        ur.UserPerformance = Response;
        ur.UserReply = UserReply;
        ur.AwardedMarks = AwardedMarks;
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
        if (DoSubmit != null)
        {
            EventArgDreamEdit evt = new EventArgDreamEdit();
            evt.DreamEditID = quizId;
            DoSubmit(this, evt);
        }
        ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script_success", "alert('Quiz Submitted Successfully!');", true);

    }

    public void BindQuiz(int id, bool CorrectOption)
    {
        throw new NotImplementedException();
    }

    public decimal GetCorrectionPercentage()
    {
        throw new NotImplementedException();
    }
}