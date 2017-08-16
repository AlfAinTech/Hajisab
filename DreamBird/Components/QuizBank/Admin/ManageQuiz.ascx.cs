using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuizBank_Admin_ManageQuiz : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            ddl_cat.DataSource = db.QuizCategories.ToList();
            ddl_cat.DataTextField = "CategoryName";
            ddl_cat.DataValueField = "id";
            ddl_cat.DataBind();
            if(Request.QueryString.HasKeys())
            {
                int quizid = Convert.ToInt32(Request.QueryString["QID"].ToString());
                BindQuiz(quizid);
                if(db.QuizBankQuestions.Any(w => w.QuizID == quizid))
                {
                    rptr_quizQuestions.DataSource = db.QuizBankQuestions.Where(w => w.QuizID == quizid).ToList();
                    rptr_quizQuestions.DataBind();
                }
                select_Questions.Visible = true;

            }
        }
    }

    protected void MediaSelection_closeMediaBank(object sender, EventArgs e)
    {
        popup_media.Hide();
    }

    protected void MediaSelection_MyEvents(object sender, EventArgs e)
    {
        popup_media.Show();
    }

    public void BindQuiz(int QuizID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        QuizBank quiz = db.QuizBanks.Where(w => w.id == QuizID).First();
        QuizName.Text = quiz.Name;
        QuizDescription.Text = quiz.Description;
        ddl_cat.SelectedValue = quiz.Categoryid.ToString();
        quizmedia.ImageUrl = quiz.MediaItem.Path500;
        mediaIdHolder.Text = quiz.MediaItemID.ToString();
        quizid.Value = quiz.id.ToString();
        select_Questions.Attributes.Add("onclick", "window.open('../../../Components/QuestionBank/Admin/QuizAdmin.aspx?QID=" + quiz.id.ToString() + "', 'mywin','left=20,top=20,width=1300,height=600,toolbar=1,resizable=0')");

    }

    protected void MediaSelection_MediaSelectedEvent(object sender, EventArgs e)
    {
        EventArgMediaSelection evt = (EventArgMediaSelection)e;
        int media_id = evt.SelectedMedia;
        DreamBirdEntities db = new DreamBirdEntities();
        MediaItem item = db.MediaItems.Where(w => w.id == media_id).First();
        quizmedia.ImageUrl = item.Path500;
           
        //Dream_img.ImageUrl = item.PathWithResolution;//.path;
        mediaIdHolder.Text = item.id.ToString();
        ViewState["selectedImageID"] = item.id;
        popup_media.Hide();
    }

    protected void save_Quiz_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        QuizBank quiz = new QuizBank();
        if(quizid.Value.Equals("0"))
        {
            quiz.Name = QuizName.Text;
            quiz.Categoryid = Convert.ToInt32(ddl_cat.SelectedValue);
            quiz.MediaItemID = Convert.ToInt32(mediaIdHolder.Text);
            quiz.Description = QuizDescription.Text;
            db.QuizBanks.Add(quiz);
        }
        else
        {
            int id = Convert.ToInt32(quizid.Value);
            quiz = db.QuizBanks.Where(w => w.id == id).First();
            quiz.Name = QuizName.Text;
            quiz.Categoryid = Convert.ToInt32(ddl_cat.SelectedValue);
            quiz.MediaItemID = Convert.ToInt32(mediaIdHolder.Text);
            quiz.Description = QuizDescription.Text;
        }
        db.SaveChanges();
        select_Questions.Visible = true;
        select_Questions.Attributes.Add("onclick", "window.open('../../../Components/QuestionBank/Admin/QuizAdmin.aspx?QID=" + quiz.id.ToString() + "', 'mywin','left=20,top=20,width=1300,height=600,toolbar=1,resizable=0')");
    }

    protected void isActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox cbox = sender as CheckBox;
        int qid = Convert.ToInt32(cbox.Attributes["data-qid"].ToString());
        DreamBirdEntities db = new DreamBirdEntities();
        QuizBankQuestion qbq = db.QuizBankQuestions.Where(w => w.id == qid).First();
        qbq.isActive = cbox.Checked;
        db.SaveChanges();
    }

    protected void delete_quiz_question_Click(object sender, EventArgs e)
    {
        Button button = sender as Button;
        int entryid = Convert.ToInt32(button.CommandName);
        DreamBirdEntities db = new DreamBirdEntities();
        QuizBankQuestion qbq = db.QuizBankQuestions.Where(w => w.id == entryid).First();
        db.QuizBankQuestions.Remove(qbq);
        db.SaveChanges();
        if (Request.QueryString.HasKeys())
        {
            int quizid = Convert.ToInt32(Request.QueryString["QID"].ToString());
            if (db.QuizBankQuestions.Any(w => w.QuizID == quizid))
            {
                rptr_quizQuestions.DataSource = db.QuizBankQuestions.Where(w => w.QuizID == quizid).ToList();
                rptr_quizQuestions.DataBind();
            }
            else
            {
                List<QuizBankQuestion> lst = new List<QuizBankQuestion>();
                rptr_quizQuestions.DataSource = lst;
                rptr_quizQuestions.DataBind();
            }
        }
    }
}