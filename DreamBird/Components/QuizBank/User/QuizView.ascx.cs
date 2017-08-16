using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuizBank_User_QuizView : CoreDreamControlAdapter, ICoreDreamControl
{
    Random Rand = new Random();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Show the quiz start time on the page. 
            CurrentTime.Text = System.DateTime.Now.ToString();
            DreamBirdEntities db = new DreamBirdEntities();
            String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
            DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
            string userid = HttpContext.Current.User.Identity.GetUserId(); // identity user id
            ViewState["BaseDreamControlName"] = this.BaseDreamControl_ServerID; // base dream control server id as defined in the parent class
            string basedreamserverid = ViewState["BaseDreamControlName"].ToString();

            // Stored Quizes for particular page. 
            if (db.LessonQuizs.Any(q => q.BaseControlID == basedreamserverid && q.Layout_id == page.id))
            {
                var lessonquiz = db.LessonQuizs.Where(q => q.BaseControlID == basedreamserverid && q.Layout_id == page.id).First();
                int quizid = Convert.ToInt32(lessonquiz.QuizID);
                hidden_quizid.Text = quizid.ToString();
                quiz_name.Text = lessonquiz.QuizBank.Name;
                total.Text = "of " + lessonquiz.QuizBank.QuizBankQuestions.Count.ToString("00");
                int currentcount = 1;
                ViewState["CurrentCounter"] = currentcount;
                current.Text = "Question Number " + currentcount.ToString("00");
                int questionperPage = lessonquiz.QuestionsPerPage;
                ViewState["TotalQuestions"] = questionperPage;

                // if the quiz has already been submitted, show result summary by loading Quiz Result summary control
                if (db.UserResponses.Any(a => a.UserID == userid && a.Page == page.id && a.quizID == quizid))
                {
                    Control control = LoadControl("~/Components/QuizBank/User/QuizResultSummary.ascx", quizid);
                    RenderQuiz.Controls.Add(control);
                    current.Text = "Quiz Already attempted";
                    total.Visible = false;
                    Next.Visible = false;
                    return;
                }

                // List of Question Ids selected for the quiz. 
                var Quizids = db.QuizBankQuestions.Where(w => w.QuizID == quizid).Select(s => s.QuestionID).OrderBy(o => Guid.NewGuid()).ToList();
                TotalTime.Value = System.DateTime.Now.AddSeconds(Convert.ToDouble(lessonquiz.TotalTime)).ToString();
                
                // Enable the timer for quiz 
                DateTime time = System.DateTime.Now.AddSeconds(Convert.ToDouble(lessonquiz.TotalTime));
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_timer", "$('#simple_timer').syotimer({ year: " + time.Year + ", month: " + time.Month + ", day: " + time.Day + ", hour: " + time.Hour + ", minute: " + time.Minute + ", second: " + time.Second + ",   afterDeadline: PerformNecessaryAction('0')  });", true);

                // Generate a temporary list for selected questions for randome appearence of questions during Quiz attempation 
                foreach (var questionid in Quizids)
                {
                    if (!(db.UserQuizStatus.Any(a => a.QuizID == quizid && a.QuestionID == questionid && a.UserID == userid && a.Page == page.id)))
                    {
                        UserQuizStatu uqs = new UserQuizStatu();
                        uqs.QuizID = quizid;
                        uqs.QuestionID = questionid;
                        uqs.UserID = userid;
                        uqs.Page = page.id;
                        uqs.QuestionStatus = false;
                        db.UserQuizStatus.Add(uqs);
                    }
                }
                db.SaveChanges();

                // Pickup questions id from above generated list, number of question ids to be selected is defined in the quiz parameter setting control  
                List<int> Quizid = db.UserQuizStatus.Where(w => w.Page == page.id && w.UserID == userid && w.QuizBank.id == lessonquiz.QuizID && w.QuestionStatus == false).Select(s => s.QuestionID).Take(questionperPage).ToList();
                // Keep the currently selected question(s) in the view state 
                ViewState["CurrentQuestions"] = Quizid;
                // Generate a unique id for allocation to the dynamically loaded control based on the selected question type and keep it in the view state 
                string controlid = "MyUserControl" + Guid.NewGuid().ToString("N");
                ViewState["ControlID"] = controlid;

                // if selected question is more than one, than generate a list of unique id for onward allotment and keep those in view state
                List<string> ListofIDs = new List<string>();
                for (int i = 0; i < questionperPage; i++)
                {
                    ListofIDs.Add("MyUserControl" + Guid.NewGuid().ToString("N"));
                }
                ViewState["ControlIDs"] = ListofIDs;
            }
        }
        // function to load the particular user controls in placeholder based on the selected question type
        // reason for calling it here is to prevent the dynamically loaded control to disappear during postback. 
        RenderTheQuiz(true);
    }
    public void RenderTheQuiz(bool Repeat, bool SelectedOption = false)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        List<int> CurretQuestions = ViewState["CurrentQuestions"] as List<int>; // get the list of selected questions 
        if (!Repeat)
        {
            // assign every control a unique id
            int questionperPage = Convert.ToInt32(ViewState["TotalQuestions"].ToString());
            List<string> ListofIDs = new List<string>();
            for (int i = 0; i < questionperPage; i++)
            {
                ListofIDs.Add("MyUserControl" + Guid.NewGuid().ToString("N"));
            }
            ViewState["ControlIDs"] = ListofIDs;
        }
        int j = 0;
        foreach (int item in CurretQuestions)
        {
            List<string> ListofIDs = ViewState["ControlIDs"] as List<string>; // fetch the list of selected questions stored in view state
            // get the address of user control stored in the database against the specific question type 
            string usercontrolPath = db.QuestionBanks.Where(w => w.id == item).Select(s => s.QuestionType.ViewTypeControl).First();

            // load the control by the overridden method of LoadControl() defined later  
            Control control = LoadControl(usercontrolPath, dreamName, pageName, item, false, SelectedOption);
            // assign unique id to the user control that has just been loaded. 
            control.ID = ListofIDs[j];
            // render the control in the placeholder on the ascx page
            RenderQuiz.Controls.Add(control);
            j++;
        }
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

    // When user clicks Next button in the quiz page
    protected void Next_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        string BaseDreamServerID = ViewState["BaseDreamControlName"].ToString();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
        string userid = HttpContext.Current.User.Identity.GetUserId();
        var lessonquiz = db.LessonQuizs.Where(w => w.BaseControlID == BaseDreamServerID && w.Layout_id == page.id).First();
        DateTime TotalQuizTime = Convert.ToDateTime(TotalTime.Value);
        DateTime CurrentNowTime = DateTime.Now;
        if (CurrentNowTime > TotalQuizTime)
        {
            // if somehow user has disabled the javascript based timer, check on the server for expiration of time
            hidden_timeup_Click(sender, EventArgs.Empty);
        }

        // get the already loaded question control 
        foreach (Control control in RenderQuiz.Controls)
        {
            // interface for invokation of necessary methods for loaded question. 
            IQuestion question = control as IQuestion;
            // check wheter user has responded correctly or not and sumbit user response to database
            decimal iscorrect = question.isCorrect();
            // get the current question id from child control. 
            int currentQuestionID = question.QuestionID();

            // this is user response that has been saved by the child component as desceibed above
            UserResponse ur = db.UserResponses.Where(w => w.QuestionID == currentQuestionID && w.Page == page.id && w.UserID == userid).First();
            ur.quizID = lessonquiz.QuizID;
            // divide the total marks for quiz on number of questions. 
            decimal MarksPerQuestion = Convert.ToDecimal(lessonquiz.Marks) / lessonquiz.QuizBank.QuizBankQuestions.Count;

            // hint options in case user has availed the opportunity for hint
            if (db.UserHintStatus.Any(a => a.UserID == userid && a.Page == page.id && a.QuestionID == currentQuestionID))
            {
                var uhs = db.UserHintStatus.Where(w => w.UserID == userid && w.Page == page.id && w.QuestionID == currentQuestionID).First();
                if (uhs.HintOption == "Zero")
                {
                    ur.AwardedMarks = 0;
                }
                else if (uhs.HintOption == "Normal" || uhs.HintOption == "Negative")
                {
                    ur.AwardedMarks = iscorrect * uhs.HintMarks;
                }
            }
            else
            {
                // store the marks based on the correction percentage for the user. 
                ur.AwardedMarks = MarksPerQuestion * iscorrect;
            }
            // mark the question as attempted in temporary list generated earlier. 
            UserQuizStatu usq = db.UserQuizStatus.Where(w => w.Page == page.id && w.QuestionID == currentQuestionID && w.UserID == userid && w.QuizBank.id == lessonquiz.QuizID && w.QuestionStatus == false).First();
            usq.QuestionStatus = true;
            db.SaveChanges();
        }

        // if questons are not completely attempted and tempoaray list still has entries 
        if (db.UserQuizStatus.Any(a => a.Page == page.id && a.UserID == userid && a.QuizBank.id == lessonquiz.QuizID && a.QuestionStatus == false))
        {
            int questionperPage = Convert.ToInt32(ViewState["TotalQuestions"].ToString());
            List<int> Quizid = db.UserQuizStatus.Where(w => w.Page == page.id && w.UserID == userid && w.QuizBank.id == lessonquiz.QuizID && w.QuestionStatus == false).Select(s => s.QuestionID).Take(questionperPage).ToList();
            int currentcount = Convert.ToInt32(ViewState["CurrentCounter"].ToString());
            current.Text = (++currentcount).ToString("00");
            ViewState["CurrentCounter"] = currentcount;
            ViewState["CurrentQuestions"] = Quizid;
            RenderQuiz.Controls.Clear();
            RenderTheQuiz(false);
            Previous.Visible = true;
        }
        else
        {
           // if all the questions have been attempted. 
            RenderQuiz.Controls.Clear();
            current.Text = "Quiz attempted successfully";
            total.Visible = false;
            Next.Visible = false;
            Previous.Visible = false;
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                String user_id = HttpContext.Current.User.Identity.GetUserId();
                Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
                if (db.LessonMenus.Any(a => a.DreamLayoutID == page.id))
                {
                    LessonMenu menu = db.LessonMenus.Where(q => q.DreamLayoutID == page.id).First();
                    var marks = db.UserResponses.Where(w => w.UserID == userid && w.quizID == lessonquiz.QuizID).Select(s => s.AwardedMarks).Sum();
                    if (db.UserLessonProgresses.Any(a => a.menu_id == menu.id && a.AspNetUser_id == userid && a.LessonMenu.DreamLayoutID == page.id))
                    {
                        var UserLessonProgress = db.UserLessonProgresses.Where(w => w.menu_id == menu.id && w.AspNetUser_id == userid && w.LessonMenu.DreamLayoutID == page.id).First();
                        UserLessonProgress.progress = Convert.ToDecimal(marks);
                    }
                    else
                    {
                        // mark the progress in progress dashboard
                        UserLessonProgress ulp = new UserLessonProgress
                        {
                            menu_id = menu.id,
                            AspNetUser_id = user_id,
                            progress = Convert.ToDecimal(marks),
                        };
                        db.UserLessonProgresses.Add(ulp);
                    }
                    db.SaveChanges();
                    //ShowStatus(ulp);

                }

            }
            // generate the result summary for the quiz. 
            Control control = LoadControl("~/Components/QuizBank/User/QuizResultSummary.ascx", lessonquiz.QuizID);
            RenderQuiz.Controls.Add(control);

        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "calcheight", "parent.calcHeight();", true);

    }
    // in case if the timer expires, submit all the questions with zero marking and set the status accordingly. 
    protected void hidden_timeup_Click(object sender, EventArgs e)
    {
        int currentQuestionID = Convert.ToInt32(ViewState["CurrentQuestion"]);
        string BaseDreamServerID = ViewState["BaseDreamControlName"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
        string userid = HttpContext.Current.User.Identity.GetUserId();
        var lessonquiz = db.LessonQuizs.Where(w => w.BaseControlID == BaseDreamServerID && w.Layout_id == page.id).First();
        var QuizResponses = db.UserQuizStatus.Where(w => w.QuizID == lessonquiz.QuizID && w.Page == page.id && w.UserID == userid && w.QuestionStatus == false).ToList();
        foreach (var QuizResponse in QuizResponses)
        {
            QuizResponse.QuestionStatus = true;
            UserResponse ur = new UserResponse();
            ur.QuestionID = currentQuestionID;
            ur.quizID = lessonquiz.QuizID;
            ur.UserPerformance = false;
            ur.UserReply = "Time_out";
            ur.Page = page.id;
            ur.UserID = userid;
            db.UserResponses.Add(ur);
            db.SaveChanges();
        }
       // remaining_times.Visible = false;
        current.Text = "Time out. Quiz submitted!";
        total.Visible = false;
        RenderQuiz.Controls.Clear();
        Next.Visible = false;
        return;
    }
    // if user clicks on previous button, than show user the previous queston with submitted answer. 
    protected void Previous_Click(object sender, EventArgs e)
    {
        int questionperPage = Convert.ToInt32(ViewState["TotalQuestions"].ToString());
        string BaseDreamServerID = ViewState["BaseDreamControlName"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
        string userid = HttpContext.Current.User.Identity.GetUserId();
        var lessonquiz = db.LessonQuizs.Where(w => w.BaseControlID == BaseDreamServerID && w.Layout_id == page.id).First();
        var QuizResponses = db.UserQuizStatus.Where(w => w.QuizID == lessonquiz.QuizID && w.Page == page.id && w.UserID == userid && w.QuestionStatus == true).ToList();
        int attemptedQuestions = QuizResponses.Count;
        var attemptedPrevious = QuizResponses.OrderBy(o => o.id).Skip(attemptedQuestions - questionperPage).Take(questionperPage).ToList();
        foreach (var item in attemptedPrevious)
        {
            item.QuestionStatus = false;
        }
        db.SaveChanges();
        ViewState["CurrentQuestions"] = attemptedPrevious.Select(s => s.QuestionID).ToList();
        RenderQuiz.Controls.Clear();
        RenderTheQuiz(false, true);
        if (attemptedQuestions - questionperPage == 0)
        {
            Previous.Visible = false;
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "calcheight", "parent.calcHeight();", true);
    }
}