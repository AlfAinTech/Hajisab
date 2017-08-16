using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuizBank_Admin_QuizGrid : System.Web.UI.UserControl
{
    private string GridMode = "";
    public string gridMode
    {
        set
        {
            GridMode = value;
        }
        get
        {
            return GridMode;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            rptr_quizGrid.DataSource = db.QuizBanks.ToList();
            rptr_quizGrid.DataBind();
        }
    }

    protected void rptr_quizGrid_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            var AnotherLinkButton = e.Item.FindControl("setQuiz");
            if (GridMode.Equals("Selection"))
            {
                AnotherLinkButton.Visible = true;
            }
        }
    }

    protected void setQuiz_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        if (Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
        {
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            String cid = Request.QueryString["CID"].ToString();
            int did = int.Parse(Request.QueryString["DID"].ToString());

            int QuizId = Convert.ToInt32(btn.Attributes["data-quizid"].ToString());
            ViewState["QuizID"] = QuizId;
            DreamBirdEntities db = new DreamBirdEntities();
            decimal TotalMarkss = 0;
            bool isProgress = false;
            if (db.DreamPageControls.Any(a => a.BaseDreamServer_ID == cid && a.Layout_ID == pid))
            {
                var dreampagecontrol = db.DreamPageControls.Where(w => w.BaseDreamServer_ID == cid && w.Layout_ID == pid).First();
                TotalMarkss = Convert.ToDecimal(dreampagecontrol.TotalProgress);
                isProgress = true;
            }
            else
            {
                TotalMarkss = 0;
                isProgress = false;
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
            //QuizName.Text = quizbank.Name;
            no_of_questions.Text = quizbank.QuizBankQuestions.Count.ToString();
            popup_quiz_paremeters.Show();
        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "key_alert", "alert('Direct access not allowed'); window.close();", true);
        }
    }

    public void RenderQuiz(List<int> QuizIDS)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        rptr_quizGrid.DataSource = db.QuizBanks.Where(w => QuizIDS.Contains(w.id)).ToList();
        rptr_quizGrid.DataBind();
    }

    protected void set_Quiz_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
        {
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            String cid = Request.QueryString["CID"].ToString();
            int did = int.Parse(Request.QueryString["DID"].ToString());
            int QuizId = Convert.ToInt32(ViewState["QuizID"].ToString());

            DreamBirdEntities db = new DreamBirdEntities();
            LessonQuiz lq = new LessonQuiz();
            if (db.LessonQuizs.Any(w => w.QuizID == QuizId && w.Layout_id == pid && w.BaseControlID == cid))
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