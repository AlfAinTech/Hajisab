using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Assignments_FilterAssignments : System.Web.UI.UserControl
{
    public event EventHandler AssignmentSearched;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            ddl_cat.DataSource = db.AssignmentCategories.ToList();
            ddl_cat.DataTextField = "CategoryName";
            ddl_cat.DataValueField = "id";
            ddl_cat.DataBind();
            ListItem lst = new ListItem();
            lst.Value = "0";
            lst.Text = "Select Category";
            ddl_cat.Items.Insert(0, lst);
            var ListofPages = db.LessonAssignments.Select(s => s.Layout_id).Distinct().ToList();
            if(ListofPages.Count > 0)
            {
                var listofDreams = db.DreamLayouts.Where(w => ListofPages.Contains(w.id)).Select(s => s.Dream).ToList();
                if(listofDreams.Count > 0)
                {
                    ddl_dream.DataSource = listofDreams;
                    ddl_dream.DataTextField = "DreamName";
                    ddl_dream.DataValueField = "id";
                    ddl_dream.DataBind();
                }
            }
            ListItem list = new ListItem();
            list.Value = "0";
            list.Text = "Select Dream";
            ddl_dream.Items.Insert(0, list);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        EventArgControlSearch evt = new EventArgControlSearch();
        if(assignment_name.Text.Equals(""))
        {
            evt.SearchKeyword = "Default_value";
        }
        else
        {
            evt.SearchKeyword = assignment_name.Text;
        }
        evt.ControlCategory = Convert.ToInt32(ddl_cat.SelectedValue);
        evt.DreamID = Convert.ToInt32(ddl_dream.SelectedValue);
        if(AssignmentSearched != null)
        {
            AssignmentSearched(this, evt);
        }
    }
}