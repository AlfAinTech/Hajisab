using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuizBank_User_QuizResultSummary : System.Web.UI.UserControl
{
    public Components_QuizBank_User_QuizResultSummary()
    {
        // nothing to do here. just psudo constructor
    }

    public Components_QuizBank_User_QuizResultSummary(int QuizID)
    {
        BindData(QuizID);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            rptr_quizSummary.DataSource = db.UserResponses.ToList();
            rptr_quizSummary.DataBind();
        }
    }

    public void BindData(int QuizID)
    {
        string userid = HttpContext.Current.User.Identity.GetUserId();
        DreamBirdEntities db = new DreamBirdEntities();
        string DreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        string PageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        DreamLayout page = db.DreamLayouts.Where(w => w.Page == PageName && w.Dream.DreamName == DreamName).First();
        var UserResponses = db.UserResponses.Where(w => w.Page == page.id && w.UserID == userid && w.quizID == QuizID).ToList();
        rptr_quizSummary.DataSource = UserResponses;
        rptr_quizSummary.DataBind();
    }

    protected void rptr_quizSummary_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            UserResponse ur = e.Item.DataItem as UserResponse;
            Repeater correct_options = e.Item.FindControl("correct_options") as Repeater;
            DreamBirdEntities db = new DreamBirdEntities();
            correct_options.DataSource = db.MCQOptions.Where(w => w.QuestionID == ur.QuestionID).ToList();
            correct_options.DataBind();
        }
    }
}