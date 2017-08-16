using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_User_QuestionResult : System.Web.UI.UserControl, IQuestionResult
{
    public Components_QuestionBank_User_QuestionResult()
    {

    }

    public Components_QuestionBank_User_QuestionResult(int QuestionID)
    {
        BindData(QuestionID);
    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void BindData(int QID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        string UserID = HttpContext.Current.User.Identity.GetUserId();
        string PageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        string DreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        UserResponse response = new UserResponse();
        if(db.UserResponses.Any(w => w.QuestionID == QID && w.UserID == UserID && w.DreamLayout.Dream.DreamName == DreamName && w.DreamLayout.Page == PageName))
        {
            response = db.UserResponses.Where(w => w.QuestionID == QID && w.UserID == UserID && w.DreamLayout.Dream.DreamName == DreamName && w.DreamLayout.Page == PageName).First();
            db.MCQOptions.Where(w => w.QuestionID == QID && w.isCorrect == true).ToList().ForEach(s => CorrectAnswer.Text = CorrectAnswer.Text + s.OptionText + ",");
            GivenAnswer.Text = response.UserReply;
            AwardedMarks.Text = response.AwardedMarks.ToString();
            ResponseDuration.Text = response.ResponseTime.ToString() + " second(s)";
        }


    }
}