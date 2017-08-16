using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_QuestionTypeList : System.Web.UI.UserControl
{
    public event EventHandler TypeClicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            rptr_QuestionTypes.DataSource = db.QuestionTypes.ToList();
            rptr_QuestionTypes.DataBind();
        }
    }

    protected void questionType_CheckedChanged(object sender, EventArgs e)
    {
        if(TypeClicked != null)
        {
            EventArgQuestionTypes evt = new EventArgQuestionTypes();
            List<int> QuestionIDs = new List<int>();
            foreach (RepeaterItem item in rptr_QuestionTypes.Items)
            {
                CheckBox cbox = (CheckBox)item.FindControl("questionType");
                int id = Convert.ToInt32(cbox.Attributes["data-id"].ToString());
                if (cbox.Checked)
                {
                    QuestionIDs.Add(id);
                }
            }
            evt.QuestionTypeIDs = QuestionIDs;
            TypeClicked(this, evt);
        }
    }

    protected void add_qtype_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        string controlName = TypeName.Text;
        string editcontrolPath = EditControlPath.Text;
        string viewControlpath = ViewControlPath.Text;
        if(db.QuestionTypes.Any(a => a.QTypeName == controlName))
        {
            var pathName = db.QuestionTypes.Where(w => w.QTypeName == controlName).First();
            pathName.ViewTypeControl = viewControlpath;
            pathName.EditTypeControl = editcontrolPath;
        }
        else
        {
            QuestionType type = new QuestionType();
            type.ViewTypeControl = viewControlpath;
            type.EditTypeControl = editcontrolPath;
            type.QTypeName = controlName;
        }
        db.SaveChanges();
        rptr_QuestionTypes.DataSource = db.QuestionTypes.ToList();
        rptr_QuestionTypes.DataBind();
    }
}