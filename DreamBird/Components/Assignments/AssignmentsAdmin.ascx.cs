using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Assignments_AssignmentsAdmin : System.Web.UI.UserControl
{
    public string mode
    {
        get; set;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        AssignmentGrid.mode = mode;
        if(mode.Equals("Selection"))
        {
            add_assignment.Visible = false;
        }
    }

    protected void FilterAssignments_AssignmentSearched(object sender, EventArgs e)
    {
        EventArgControlSearch evt = e as EventArgControlSearch;
        AssignmentGrid.BindData(evt.SearchKeyword, evt.ControlCategory, evt.DreamID);
    }
}