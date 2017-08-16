using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonBank_LessonDashBoard_LessonDashBoardAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindData();
        }
    }

    public void bindData()
    {
        if(Request.QueryString["PID"] !=null && Request.QueryString["DID"] != null && Request.QueryString["CID"] != null){ 
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            String cid = Request.QueryString["CID"].ToString();
            int did = int.Parse(Request.QueryString["DID"].ToString());
            DreamBirdEntities db = new DreamBirdEntities();

            var data = db.LessonProgressDashBoards.Where(q => q.LayoutID == pid && q.BaseControlID == cid).ToList();
            if (data.Count != 0)
            {
                LessonProgressDashBoard t = data[0];
                showSiblings.Checked = t.ShowSiblingsProgress;
            }
    }
    }
    protected void save_Click(object sender, EventArgs e)
    {
        if(Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
        {
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            String cid = Request.QueryString["CID"].ToString();
            int did = int.Parse(Request.QueryString["DID"].ToString());
            DreamBirdEntities db = new DreamBirdEntities();

            var data = db.LessonProgressDashBoards.Where(q => q.LayoutID == pid && q.BaseControlID == cid).ToList();
            if(data.Count!=0)
            {
                LessonProgressDashBoard t = data[0];
                t.ShowSiblingsProgress = showSiblings.Checked;

            }
            else
            {
                LessonProgressDashBoard t = new LessonProgressDashBoard
                {
                    ShowSiblingsProgress = showSiblings.Checked,
                    LayoutID = pid,
                    BaseControlID = cid,
                };
                db.LessonProgressDashBoards.Add(t);

            }
            db.SaveChanges();
        }
       
    }
}