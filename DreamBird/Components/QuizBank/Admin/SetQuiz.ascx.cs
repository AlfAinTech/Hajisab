using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuizBank_Admin_SetQuiz : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.QueryString.HasKeys())
            {
                int QuizId = Convert.ToInt32(Request.QueryString["QID"].ToString());
                int pid = int.Parse(Request.QueryString["PID"].ToString());
                String cid = Request.QueryString["CID"].ToString();
                int did = int.Parse(Request.QueryString["DID"].ToString());

                DreamBirdEntities db = new DreamBirdEntities();
                decimal TotalMarkss = 0;
                bool isProgress = false;
                if(db.DreamPageControls.Any(a => a.BaseDreamServer_ID == cid && a.Layout_ID == pid))
                {
                    var dreampagecontrol = db.DreamPageControls.Where(w => w.BaseDreamServer_ID == cid && w.Layout_ID == pid).First();
                    TotalMarkss = Convert.ToDecimal(dreampagecontrol.TotalProgress);
                    isProgress = true;
                }
                if (isProgress)
                {
                    isGraded.Checked = isProgress;
                    TotalMarks.Text = TotalMarkss.ToString();
                }
                else
                {
                    isGraded.Enabled = false;
                    TotalMarks.Enabled = false;
                    ddl_qopt.Enabled = false;
                }
                var quizbank = db.QuizBanks.Where(w => w.id == QuizId).First();
                if (db.LessonQuizs.Any(a => a.BaseControlID == cid && a.QuizID == QuizId && a.Layout_id == pid))
                {
                    var lessonquiz = db.LessonQuizs.Where(w => w.BaseControlID == cid && w.QuizID == QuizId && w.Layout_id == pid).First();
                    
                    isTimeBased.Checked = lessonquiz.TimeBased;
                    TotalTime.Text = lessonquiz.TotalTime.ToString();
                    visibleQuestions.Text = lessonquiz.visibleQuestions.ToString();
                    questionPerPage.Text = lessonquiz.QuestionsPerPage.ToString();
                }
                QuizName.Text = quizbank.Name;
                no_of_questions.Text = quizbank.QuizBankQuestions.Count.ToString();
            }
        }
        
    }

    protected void SetQuiz_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["PID"] != null && Request.QueryString["QID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
        {
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            String cid = Request.QueryString["CID"].ToString();
            int did = int.Parse(Request.QueryString["DID"].ToString());
            int QuizId = Convert.ToInt32(Request.QueryString["QID"].ToString());

            DreamBirdEntities db = new DreamBirdEntities();
            LessonQuiz lq = new LessonQuiz();
            if(db.LessonQuizs.Any(w => w.QuizID == QuizId && w.Layout_id == pid && w.BaseControlID == cid))
            {
                lq = db.LessonQuizs.Where(w => w.QuizID == QuizId).First();
                lq.Graded = isGraded.Checked;
                lq.Marks = Convert.ToDecimal(TotalMarks.Text);
                lq.TimeBased = isTimeBased.Checked;
                lq.TotalTime = Convert.ToInt32(TotalTime.Text);
                lq.visibleQuestions = Convert.ToInt32(visibleQuestions.Text);
                lq.QuestionsPerPage = Convert.ToInt32(questionPerPage.Text);
                lq.HintOption = ddl_qopt.SelectedValue;
            }
            else
            {
                lq.QuizID = QuizId;
                lq.Layout_id = pid;
                lq.BaseControlID = cid;
                lq.Graded = isGraded.Checked;
                lq.Marks = Convert.ToDecimal(TotalMarks.Text);
                lq.TimeBased = isTimeBased.Checked;
                lq.TotalTime = Convert.ToInt32(TotalTime.Text);
                lq.visibleQuestions = Convert.ToInt32(visibleQuestions.Text);
                lq.QuestionsPerPage = Convert.ToInt32(questionPerPage.Text);
                lq.HintOption = ddl_qopt.SelectedValue;
                db.LessonQuizs.Add(lq);
            }
            db.SaveChanges();
        }
    }
}