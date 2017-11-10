using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_MediaBank_VideoTranscript : CorePackageControlAdapter, IVideoTranscript, ICorePackageControl
{
    private int mediaItemID = 49;
    private bool showTranscript = true;

    public int MediaItemID
    {
        get
        {
            return mediaItemID;
        }
        set
        {
            mediaItemID = value;
        }
    }

    public bool ShowTranscript
    {
        get
        {
            return showTranscript;
        }
        set
        {
            showTranscript = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        //string script = "<script src='/Components/Video_Transcript/Assets/js/app.js'></script>";
        ////string scripts = "<script src='https://code.jquery.com/jquery-3.1.0.js'></script>";
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_ff", script, false);
        ////ScriptManager.RegisterStartupScript(Page, typeof(Page), "a_keyss", "<script type='text/javascript'>Sys.Application.add_load(MyNewCode);</script>", false);
        ////ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_ffs", scripts, false);
        if (!IsPostBack)
        {
            AddScripts();
            PackageEntities db = new PackageEntities();
            
            if(db.MediaItems.Where(a => a.id == MediaItemID).Count()!=0)
            {
                MediaItem item = db.MediaItems.Where(w => w.id == MediaItemID).First();
                BindMedia(item);
                if(showTranscript)
                BindMediaTranscript(item);
            }
        }
    }

    public void CallJavaScript()
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_fg", "<script type='text/javascript'>myAppCode;</script>", false);
    }

    public void AddScripts()
    {
        //ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), null, "<script type='text/javascript' src='../../Components/Video_Transcript/Assets/js/app.js'>Sys.Application.add_load(myVideoCode);</script>", false);
        string script = "<script src='../../Components/Video_Transcript/Assets/js/app.js'></script>";
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_ff", script, false);
    }
    public void BindMedia(MediaItem item)
    {
        video.Controls.Clear();
        video.ClientIDMode = ClientIDMode.Static;
        PackageEntities db = new PackageEntities();
        System.Web.UI.HtmlControls.HtmlGenericControl VideoSource = new System.Web.UI.HtmlControls.HtmlGenericControl("SOURCE");
        string filepath = null;
        if (File.Exists(Server.MapPath("~/") + item.path + "/480p/" + item.name))
        {
            filepath = item.path + "/480p/" + item.name;
        }
        else if (File.Exists(Server.MapPath("~/") + item.path + "/720p/" + item.name))
        {
            filepath = item.path + "/720p/" + item.name;
        }
        else if (File.Exists(Server.MapPath("~/") + item.path + "/1080p/" + item.name))
        {
            filepath = item.path + "/1080p/" + item.name;
        }
        VideoSource.Attributes.Add("src", "../../" + filepath);
        //string extension = Path.GetExtension(Server.MapPath("~/") + item.path +"/"+ item.name);

        VideoSource.Attributes.Add("type", "video/mp4");
        video.Controls.Add(VideoSource);
        if(showTranscript)
        {
            BindMediaTranscript(item);
        }
    }

    public void BindMediaTranscript(MediaItem item)
    {
        transcript.Controls.Clear();
        transcript.ClientIDMode = ClientIDMode.Static;
        PackageEntities db = new PackageEntities();
        if (item.mediaType == "video")
        {
            var TranscriptText = db.VideoTranscripts.Where(w => w.MediaItem_id == item.id).ToList();
            System.Web.UI.HtmlControls.HtmlGenericControl Div = new System.Web.UI.HtmlControls.HtmlGenericControl("P");
            foreach (var transcripts in TranscriptText)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl InnerDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("SPAN");
                InnerDiv.Attributes.Add("data-start", transcripts.TimeStamp.ToString());
                InnerDiv.Attributes.Add("id", transcripts.TimeStamp.ToString());
                InnerDiv.Attributes.Add("class", "MyTranscript");
                InnerDiv.Attributes.Add("style", "display:block;");
                InnerDiv.InnerText = transcripts.Text;
                Div.Controls.Add(InnerDiv);
            }
            transcript.Controls.Add(Div);
        }
        //preview_block.Attributes.Remove("style");
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "myAppCode()", true);
    }
    
}