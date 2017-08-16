using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_MultimediaBank_MultimediaSelection : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void MultimediaList_ItemClicked(object sender, EventArgs e)
    {
        if (Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
        {
            EventArgDreamEdit evt = e as EventArgDreamEdit;
            int multimediaID = evt.DreamEditID;
            DreamBirdEntities db = new DreamBirdEntities();
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            String cid = Request.QueryString["CID"].ToString();
            int did = int.Parse(Request.QueryString["DID"].ToString());
            if (db.LessonMultimedias.Any(a => a.Layout_id == pid && a.BaseControlID == cid))
            {
                LessonMultimedia multimedia = db.LessonMultimedias.Where(w => w.Layout_id == pid && w.BaseControlID == cid).First();
                multimedia.MultimediaID = multimediaID;
            }
            else
            {
                LessonMultimedia multimedia = new LessonMultimedia();
                multimedia.Layout_id = pid;
                multimedia.BaseControlID = cid;
                multimedia.MultimediaID = multimediaID;
                db.LessonMultimedias.Add(multimedia);
            }
            db.SaveChanges();
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_close", "window.close();", true);
    }
}