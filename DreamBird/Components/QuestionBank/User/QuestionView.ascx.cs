using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_User_QuestionView : CoreDreamControlAdapter, ICoreDreamControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string userid = HttpContext.Current.User.Identity.GetUserId();
            DreamBirdEntities db = new DreamBirdEntities();
            String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
            string basedreamserverid = this.BaseDreamControl_ServerID;
            DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
            if (db.LessonQuestions.Any(q => q.BaseControlID == basedreamserverid && q.Layout_id == page.id))
            {
                var lessonquiz = db.LessonQuestions.Where(q => q.BaseControlID == basedreamserverid && q.Layout_id == page.id).First();
                if (db.UserResponses.Any(a => a.UserID == userid && a.DreamLayout.Page == pageName && a.DreamLayout.Dream.DreamName == dreamName && a.QuestionID == lessonquiz.Question_id))
                {
                    Control resultControl = LoadControl("~/Components/QuestionBank/User/QuestionResult.ascx", lessonquiz.Question_id);
                    quizrender.Controls.Add(resultControl);
                    return;
                }
            }
        }
        RenderTheQuiz();
        
    }

    private void RenderTheQuiz()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        string basedreamserverid = this.BaseDreamControl_ServerID;
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
        if (db.LessonQuestions.Any(q => q.BaseControlID == basedreamserverid && q.Layout_id == page.id))
        {
            var lessonquiz = db.LessonQuestions.Where(q => q.BaseControlID == basedreamserverid && q.Layout_id == page.id).First();
            string UserControlPath = lessonquiz.QuestionBank.QuestionType.ViewTypeControl;
            Control control = LoadControl(UserControlPath, dreamName, pageName, basedreamserverid);
            IQuestion question = control as IQuestion;
            question.DoSubmit += Question_DoSubmit;
            quizrender.Controls.Add(control);
            DateTime time = System.DateTime.Now.AddSeconds(Convert.ToDouble(lessonquiz.TotalTime));
            //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_timer", "$('#simple_timer').syotimer({ year: " + time.Year + ", month: " + time.Month + ", day: " + time.Day + ", hour: " + time.Hour + ", minute: " + time.Minute + ", second: " + time.Second + ",   afterDeadline: PerformNecessaryAction('0')  });", true);
        }
    }

    private void Question_DoSubmit(object sender, EventArgs e)
    {
        EventArgDreamEdit evt = e as EventArgDreamEdit;
        int questionid = evt.DreamEditID;
        Control control = LoadControl("~/Components/QuestionBank/User/QuestionResult.ascx", questionid);
        quizrender.Controls.Add(control);
    }

    private UserControl LoadControl(string UserControlPath, params object[] constructorParameters)
    {
        List<Type> constParamTypes = new List<Type>();
        foreach (object constParam in constructorParameters)
        {
            constParamTypes.Add(constParam.GetType());
        }

        UserControl control = Page.LoadControl(UserControlPath) as UserControl;

        ConstructorInfo constructor = control.GetType().BaseType.GetConstructor(constParamTypes.ToArray());

        if (constructor == null)
        {
            throw new MemberAccessException("The requested constructor was not found on : " + control.GetType().BaseType.ToString());
        }
        else
        {
            constructor.Invoke(control, constructorParameters);
        }

        return control;
    }
}