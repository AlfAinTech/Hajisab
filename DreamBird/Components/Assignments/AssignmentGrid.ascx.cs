using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Assignments_AssignmentGrid : System.Web.UI.UserControl
{
    public string mode
    {
        get; set;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            rptr_assignmentGrid.DataSource = db.AssignmentBanks.ToList();
            rptr_assignmentGrid.DataBind();
        }
    }

    public void BindData(string keyword, int cat_id, int dream_id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (keyword.Equals("Default_value") && cat_id != 0 && dream_id != 0)
        {
            var dreamlayouts = db.LessonAssignments.Where(w => w.DreamLayout.Dream.id == dream_id).Select(s => s.AssignmentBank.id).ToList();
            if (db.AssignmentBanks.Any(a => a.CategoryID == cat_id && dreamlayouts.Contains(a.id)))
            {
                rptr_assignmentGrid.DataSource = db.AssignmentBanks.Where(w => w.CategoryID == cat_id && dreamlayouts.Contains(w.id)).ToList();
                rptr_assignmentGrid.DataBind();
            }
        }
        else
        {
            if (keyword.Equals("Default_value"))
            {
                if (dream_id == 0)
                {
                    if (db.AssignmentBanks.Any(a => a.Name == keyword && a.CategoryID == cat_id))
                    {
                        rptr_assignmentGrid.DataSource = db.AssignmentBanks.Where(w => w.CategoryID == cat_id).ToList();
                        rptr_assignmentGrid.DataBind();
                    }
                }
                else if (cat_id == 0)
                {
                    var dreamlayouts = db.LessonAssignments.Where(w => w.DreamLayout.Dream.id == dream_id).Select(s => s.AssignmentBank.id).ToList();
                    rptr_assignmentGrid.DataSource = db.AssignmentBanks.Where(w => dreamlayouts.Contains(w.id)).ToList();
                    rptr_assignmentGrid.DataBind();
                }
                else
                {
                    var dreamlayouts = db.LessonAssignments.Where(w => w.DreamLayout.Dream.id == dream_id).Select(s => s.AssignmentBank.id).ToList();
                    if (db.AssignmentBanks.Any(a => a.CategoryID == cat_id && dreamlayouts.Contains(a.id)))
                    {
                        rptr_assignmentGrid.DataSource = db.AssignmentBanks.Where(w => w.CategoryID == cat_id && dreamlayouts.Contains(w.id) && w.Name == keyword).ToList();
                        rptr_assignmentGrid.DataBind();
                    }
                }
            }
            else
            {
                if (cat_id == 0 && dream_id == 0)
                {
                    if (db.AssignmentBanks.Any(a => a.Name == keyword))
                    {
                        rptr_assignmentGrid.DataSource = db.AssignmentBanks.Where(w => w.Name == keyword).ToList();
                        rptr_assignmentGrid.DataBind();
                    }
                }
                else
                {
                    if (dream_id == 0)
                    {
                        if (db.AssignmentBanks.Any(a => a.Name == keyword && a.CategoryID == cat_id && a.Name == keyword))
                        {
                            rptr_assignmentGrid.DataSource = db.AssignmentBanks.Where(w => w.CategoryID == cat_id && w.Name == keyword).ToList();
                            rptr_assignmentGrid.DataBind();
                        }
                    }
                    else if (cat_id == 0)
                    {
                        var dreamlayouts = db.LessonAssignments.Where(w => w.DreamLayout.Dream.id == dream_id).Select(s => s.AssignmentBank.id).ToList();
                        rptr_assignmentGrid.DataSource = db.AssignmentBanks.Where(w => dreamlayouts.Contains(w.id) && w.Name == keyword).ToList();
                        rptr_assignmentGrid.DataBind();
                    }
                    else
                    {
                        var dreamlayouts = db.LessonAssignments.Where(w => w.DreamLayout.Dream.id == dream_id).Select(s => s.AssignmentBank.id).ToList();
                        if (db.AssignmentBanks.Any(a => a.CategoryID == cat_id && dreamlayouts.Contains(a.id) && a.Name == keyword))
                        {
                            rptr_assignmentGrid.DataSource = db.AssignmentBanks.Where(w => w.CategoryID == cat_id && dreamlayouts.Contains(w.id) && w.Name == keyword).ToList();
                            rptr_assignmentGrid.DataBind();
                        }
                        else
                        {
                            rptr_assignmentGrid.DataSource = null;
                            rptr_assignmentGrid.DataBind();
                        }
                    }
                }
            }


        }

    }

    protected void select_assignment_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            String cid = Request.QueryString["CID"].ToString();
            int did = int.Parse(Request.QueryString["DID"].ToString());

            Button button = sender as Button;
            int QuizID = Convert.ToInt32(button.Attributes["data-assignmentid"].ToString());
            LessonAssignment assignment = new LessonAssignment();
            if (db.LessonAssignments.Any(a => a.Layout_id == pid && a.BaseControlID == cid))
            {
                assignment = db.LessonAssignments.Where(w => w.Layout_id == pid && w.BaseControlID == cid).First();
                assignment.Assignment_id = QuizID;
            }
            else
            {
                assignment.BaseControlID = cid;
                assignment.Layout_id = pid;
                assignment.Assignment_id = QuizID;
                db.LessonAssignments.Add(assignment);
            }
            db.SaveChanges();
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "key_close", "window.close();", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "key_alert", "alert('Direct access not allowed'); window.close();", true);
        }
    }

    protected void rptr_assignmentGrid_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Button button = e.Item.FindControl("select_assignment") as Button;
        if (mode.Equals("Selection"))
        {
            button.Visible = true;
        }
    }
}