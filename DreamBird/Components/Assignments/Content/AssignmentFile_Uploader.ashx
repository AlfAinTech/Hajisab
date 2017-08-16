<%@ WebHandler Language="C#" Class="AssignmentFile_Uploader" %>

using System;
using System.Web;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using Microsoft.AspNet.Identity;


public class AssignmentFile_Uploader : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        int assignment_id = Convert.ToInt32(context.Request["AID"]);
        DreamBirdEntities db = new DreamBirdEntities();
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            LessonAssignment assignment = db.LessonAssignments.Where(w => w.Assignment_id == assignment_id).First();
            string uploadDirectoryPath = assignment.AssignmentBank.FileStorageDirectory;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                string Extension = Path.GetExtension(file.FileName);
                if ((Extension.Equals(".doc") || Extension.Equals(".docx") || Extension.Equals(".pdf") || Extension.Equals(".xls") || Extension.Equals(".xlsx") || Extension.Equals(".ppt") || Extension.Equals(".pptx")))
                {
                    AssignmentResponse ass_response = new AssignmentResponse();
                    string filepath = HttpContext.Current.Server.MapPath(uploadDirectoryPath) + HttpContext.Current.User.Identity.GetUserId() + "_" + assignment.AssignmentBank.Name + Extension;
                    file.SaveAs(filepath);

                    ass_response.UploadedFilePath = filepath;
                    ass_response.UserID = HttpContext.Current.User.Identity.GetUserId();
                    ass_response.Page = assignment.Layout_id;
                    ass_response.isSubmitted = true;
                    ass_response.AssignmentID = assignment_id;
                    ass_response.AssignmentResult = 0;
                    ass_response.UploadedFileType = Extension;
                    db.AssignmentResponses.Add(ass_response);
                    db.SaveChanges();
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("File Uploaded Successfully!");
                }
                else
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Your file type is in restricted List, Cannot be uploaded");
                }
            }

        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }



}