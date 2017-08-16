using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuizBank_Admin_FilterQuiz : System.Web.UI.UserControl
{
    public event EventHandler QuizSearched;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if(db.QuizBanks.Any())
            {
                ddl_qcat.DataSource = db.QuizCategories.ToList();
                ddl_qcat.DataTextField = "CategoryName";
                ddl_qcat.DataValueField = "id";
                ddl_qcat.DataBind();
            }
        }
    }

    protected void search_quiz_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        EventArgQuestionTypes evt = new EventArgQuestionTypes();
        int CatID = Convert.ToInt32(ddl_qcat.SelectedValue);
        string QuizName = quizName.Text;
        if(db.QuizBanks.Any(a => a.Name == QuizName && a.Categoryid == CatID))
        {
            evt.QuestionTypeIDs = db.QuizBanks.Where(w => w.Name == QuizName && w.Categoryid == CatID).Select(s => s.id).ToList();
        }
        else if (db.QuizBanks.Any(a => a.Name.Contains(QuizName)))
        {
            evt.QuestionTypeIDs = db.QuizBanks.Where(w => w.Name.Contains(QuizName)).Select(s => s.id).ToList();
        }
        else if (db.QuizBanks.Any(a => a.Categoryid == CatID))
        {
            evt.QuestionTypeIDs = db.QuizBanks.Where(a => a.Categoryid == CatID).Select(s => s.id).ToList();
        }

        if(QuizSearched != null)
        {
            QuizSearched(this, evt);
        }
    }
}