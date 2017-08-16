using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Assignments_AssignmentUserView : CoreDreamControlAdapter, ICoreDreamControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
        string userid = HttpContext.Current.User.Identity.GetUserId();
        ViewState["BaseDreamControlName"] = this.BaseDreamControl_ServerID;
        string basedreamserverid = ViewState["BaseDreamControlName"].ToString();
        if(db.LessonAssignments.Any(a => a.BaseControlID == basedreamserverid && a.Layout_id == page.id))
        {
            var lessonAssignment = db.LessonAssignments.Where(w => w.BaseControlID == basedreamserverid && w.Layout_id == page.id).First();
            ViewState["UploadDirectoryPath"] = lessonAssignment.AssignmentBank.FileStorageDirectory;
            assignment_title.Text = lessonAssignment.AssignmentBank.Name;
            assignment_description.Text = lessonAssignment.AssignmentBank.Description;
            submit_assignment_2.Attributes.Add("aid", lessonAssignment.Assignment_id.ToString());
            submit_assignmet_1.Attributes.Add("aid", lessonAssignment.Assignment_id.ToString());
        }
        else
        {
            assignment_title.Text = "No assignment selected for the dream!";
        }

    }

    //protected void submit_assignment_2_Click(object sender, EventArgs e)
    //{
    //    if(FileUpload2.HasFile)
    //    {
    //        try
    //        {
    //            string path = ViewState["UploadDirectoryPath"].ToString();
    //            string filename = Path.GetFileName(FileUpload2.FileName);
    //            FileUpload2.SaveAs(Server.MapPath(path) + filename);
    //            FileUpload2.Visible = false;
    //            submit_assignment_2.Text = "File Uploaded Successfully";
    //            submit_assignment_2.Enabled = false;
    //        }
    //        catch (Exception ex)
    //        {
    //            assignment_title.Text = "The file could not be uploaded. The following error occured: " + ex.Message;
    //        }
    //    }
    //}

    //protected void submit_assignmet_1_Click(object sender, EventArgs e)
    //{
    //    if(FileUpload1.HasFile)
    //    {
    //        try
    //        {
    //            string path = ViewState["UploadDirectoryPath"].ToString();
    //            string filename = Path.GetFileName(FileUpload1.FileName);
    //            FileUpload1.SaveAs(Server.MapPath(path) + filename);
    //            FileUpload1.Visible = false;
    //            submit_assignmet_1.Text = "File Uploaded Successfully";
    //            submit_assignmet_1.Enabled = false;
    //        }
    //        catch (Exception ex)
    //        {
    //            assignment_title.Text = "The file could not be uploaded. The following error occured: " + ex.Message;
    //        }
    //    }
    //}
}