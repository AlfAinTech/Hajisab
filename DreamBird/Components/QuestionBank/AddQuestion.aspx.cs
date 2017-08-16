using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_AddQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            rptr_typeList.DataSource = db.QuestionTypes.ToList();
            rptr_typeList.DataBind();
        }
    }

    protected void question_type_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        string QuestionType = lb.Attributes["aria-controls"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        string EditContrlPath = db.QuestionTypes.Where(w => w.QTypeName == QuestionType).Select(s => s.EditTypeControl).First();
        string id = lb.Attributes["data-typeid"].ToString();
        AddPage.Src = "~/" + EditContrlPath;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_highlight_button", "$('a[data-typeid=" + '"' + id + '"' + "]').addClass('active');", true);
    }

}