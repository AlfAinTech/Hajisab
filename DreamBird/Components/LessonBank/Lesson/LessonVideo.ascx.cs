using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using WMPLib;

public partial class Components_LessonBank_Lesson_LessonVideo : CoreDreamControlAdapter, ICoreDreamControl
{


    protected void Page_Load(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
        var videos= db.LessonVideos.Where(q => q.BaseControlID == this.BaseDreamControl_ServerID && q.Layout_id == page.id).ToList();
        if(videos.Count !=0)
        {
            LessonVideo current_video = videos[0];
            VideoTranscript.ShowTranscript = current_video.showTranscript;
            VideoTranscript.MediaItemID = current_video.MediaItem_id.Value;
            //var mediaitem = db.MediaItems.Where(w => w.id == current_video.MediaItem_id.Value).First();
            //VideoTranscript.BindMedia(mediaitem);
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_baseControl", "var BaseDreamID = '" + BaseDreamControl_ServerID + "';", true);
        // int i = video.Controls.Count;
    }
}