using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonBank_Lesson_LessonVideoAdmin : CoreDreamControlAdapter
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if (Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
            {
                int pid = int.Parse(Request.QueryString["PID"].ToString());
                String cid = Request.QueryString["CID"].ToString();
                int did = int.Parse(Request.QueryString["DID"].ToString());
                var videocontrol = db.LessonVideos.Where(q => q.BaseControlID == cid && q.Layout_id == pid).ToList();
                if (videocontrol.Count != 0)
                {
                    LessonVideo lv = videocontrol[0];
                    video_id.Text = lv.MediaItem_id.ToString();
                    showTranscript_chk.Checked = lv.showTranscript;
                    video_tag.Src = lv.MediaItem.Path480;

                }
            }
            }
    }
    protected void MediaBankControl1_MediaSelected(object sender, EventArgs e)
    {

        MediaItem media_item;
        media_item = MediaBankControl1.SelectedMediaItem;
        video_tag.Src = media_item.PathWithResolution;//.path;
        video_id.Text = media_item.id.ToString();
        ViewState["selectedImageID"] = media_item.id;
         ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_key", "OpenMainsTabs()", true);

    }
    protected void MediaBankControl1_MyEvents(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void MediaBankControl_SomeThindDone(object sender, EventArgs e)
    {
         ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_key", "OpenMainsTabs()", true);
    }
    
    protected void save_video_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        MediaBankControl1.LoadScripts();
        if (Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
        {
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            String cid = Request.QueryString["CID"].ToString();
            int did = int.Parse(Request.QueryString["DID"].ToString());
            var videocontrol = db.LessonVideos.Where(q => q.BaseControlID == cid && q.Layout_id == pid).ToList();
            if (videocontrol.Count != 0)
            {
                LessonVideo lv = videocontrol[0];
                lv.MediaItem_id = int.Parse(video_id.Text);
                lv.showTranscript = showTranscript_chk.Checked;
            }
            else
            {
                LessonVideo t = new LessonVideo
                { Layout_id = pid, MediaItem_id = int.Parse(video_id.Text), BaseControlID = cid,showTranscript=showTranscript_chk.Checked };
                db.LessonVideos.Add(t);
            }
            db.SaveChanges();
        }
    }

    protected void cmdSelectImage_Click(object sender, EventArgs e)
    {
        
    }
}