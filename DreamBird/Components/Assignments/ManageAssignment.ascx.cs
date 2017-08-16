using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Assignments_ManageAssignment : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            ddl_cat.DataSource = db.AssignmentCategories.ToList();
            ddl_cat.DataTextField = "CategoryName";
            ddl_cat.DataValueField = "id";
            ddl_cat.DataBind();
            if (Request.QueryString.HasKeys())
            {
                int assignment_id = Convert.ToInt32(Request.QueryString["IID"].ToString());
                if (db.AssignmentBanks.Any(a => a.id == assignment_id))
                {
                    var assignment = db.AssignmentBanks.Where(w => w.id == assignment_id).First();
                    assignment_name.Text = assignment.Name;
                    assignment_description.Text = assignment.Description;
                    ddl_cat.SelectedValue = assignment.CategoryID.ToString();
                }
                if (db.AssignmentResponses.Any(a => a.AssignmentID == assignment_id))
                {
                    rptr_user_assignments.DataSource = db.AssignmentResponses.Where(w => w.AssignmentID == assignment_id).ToList();
                    rptr_user_assignments.DataBind();
                }
            }
        }
    }

    protected void save_assignment_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        AssignmentBank assignment = new AssignmentBank();
        if (Request.QueryString.HasKeys())
        {
            int assignment_id = Convert.ToInt32(Request.QueryString["IID"].ToString());
            assignment = db.AssignmentBanks.Where(w => w.id == assignment_id).First();
            assignment.Name = assignment_name.Text;
            assignment.Description = assignment_description.Text;
            assignment.CategoryID = Convert.ToInt32(ddl_cat.SelectedValue);
        }
        else
        {
            assignment.Name = assignment_name.Text;
            assignment.Description = assignment_description.Text;
            assignment.CategoryID = Convert.ToInt32(ddl_cat.SelectedValue);
            if (!(Directory.Exists(HttpContext.Current.Server.MapPath("~/Components/Assignments/Content/Files/" + assignment.Name))))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/Components/Assignments/Content/Files/" + assignment.Name));
            }
            assignment.FileStorageDirectory = "~/Components/Assignments/Content/Files/" + assignment.Name + "/";
            db.AssignmentBanks.Add(assignment);
        }
        db.SaveChanges();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_close", "window.close();", true);
    }

    protected void rptr_user_assignments_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            string userid = DataBinder.Eval(e.Item.DataItem, "UserID").ToString();
            Label label = e.Item.FindControl("user_name") as Label;
            DreamBirdEntities db = new DreamBirdEntities();
            label.Text = db.AspNetUsers.Where(w => w.Id == userid).Select(s => s.UserName).First();
        }
    }

    protected void btn_save_marks_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((sender) as Control).NamingContainer;
        TextBox marks = item.FindControl("marks") as TextBox;
        Button button = sender as Button;
        int assignment_id = Convert.ToInt32(button.Attributes["aid"]);
        string userid = button.Attributes["user-id"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        AssignmentResponse assignment = db.AssignmentResponses.Where(w => w.AssignmentID == assignment_id && w.UserID == userid).First();
        assignment.AssignmentResult = Convert.ToDecimal(marks.Text);
        db.SaveChanges();
        if (db.AssignmentResponses.Any(a => a.AssignmentID == assignment_id))
        {
            rptr_user_assignments.DataSource = db.AssignmentResponses.Where(w => w.AssignmentID == assignment_id).ToList();
            rptr_user_assignments.DataBind();
        }
    }

    protected void file_item_Click(object sender, EventArgs e)
    {
        
    }
}