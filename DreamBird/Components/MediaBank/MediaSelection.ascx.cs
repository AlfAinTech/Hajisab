using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;

public partial class Components_MediaBank_MediaSelection : System.Web.UI.UserControl
{
    // Event Handlers
    public event EventHandler MediaSelectedEvent;
    public event EventHandler MyEvents;
    public event EventHandler closeMediaBank;

    // Data Item
    private MediaItem selectedMediaItem;
    private bool showImageTypeMedia = false;
    private bool showVideoTypeMedia = false;
    private bool showAudioTypeMedia = false;
    private bool showTranscriptOptions = false;
    private bool showAdditionControls = true;
    private List<String> allowedMediaTypes = new List<string>();

    // Member Functions (Getters and Setters)
    public MediaItem SelectedMediaItem
    {
        get
        {
            return selectedMediaItem;
        }

        set
        {
            selectedMediaItem = value;
        }
    }
    public bool ShowAdditionControls
    {
        get
        {
            return showAdditionControls;
        }
        set
        {
            showAdditionControls = value;
        }
    }
    public bool ShowTranscriptOptions
    {
        get
        {
            return showTranscriptOptions;
        }
        set
        {
            showTranscriptOptions = value;
        }
    }
    public bool ShowImageTypeMedia
    {
        get
        {
            return showImageTypeMedia;
        }

        set
        {
            showImageTypeMedia = value;
        }
    }
    public bool ShowVideoTypeMedia
    {
        get
        {
            return showVideoTypeMedia;
        }

        set
        {
            showVideoTypeMedia = value;
        }
    }
    public bool ShowAudioTypeMedia
    {
        get
        {
            return showAudioTypeMedia;
        }

        set
        {
            showAudioTypeMedia = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ShowAudioTypeMedia)
        {

            allowedMediaTypes.Add("audio");
            //ch_audio.Enabled = true;
            //ch_audio.Checked = true;
        }
        if (ShowVideoTypeMedia)
        {
            allowedMediaTypes.Add("video");
            //ch_video.Enabled = true;
            //ch_video.Checked = true;
        }
        if (ShowImageTypeMedia)
        {
            allowedMediaTypes.Add("Image");
            //ch_image.Enabled = true;
            //ch_image.Checked = true;
        }
        if (!IsPostBack)
        {

            MediaBind();
        }
    }

    protected void ddl_paging_SelectedIndexChanged(object sender, EventArgs e)
    {
        MediaBind();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
    }

    protected void MediaBind()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        PagedDataSource pds = new PagedDataSource();
        var medialist = db.MediaItems.Where(img => allowedMediaTypes.Contains(img.mediaType)).OrderBy(ddl_sort.SelectedItem.Value).ToList();
        foreach (var mediaitem in medialist)
        {
            if (mediaitem.mediaType.Equals("audio"))
            {
                mediaitem.path = "~/Components/MediaBank/Content/Images/100x100/audio.png";
            }
            else if (mediaitem.mediaType.Equals("video"))
            {
                mediaitem.path = "~/Components/MediaBank/Content/Images/100x100/video.png";
            }
            else if (mediaitem.mediaType.Equals("image") || mediaitem.mediaType.Equals("Image"))
            {
                mediaitem.path = "~/Components/MediaBank/Content/Images/500x500/" + mediaitem.name;
            }
        }
        int totalcount = 0;
        int currentcount = 0;
        if (ddl_paging.SelectedItem.Value.Equals("all"))
        {
            currentcount = medialist.Count;
            pds.DataSource = medialist;
            pds.CurrentPageIndex = 0;
            pds.AllowPaging = false;
            Repeater2.Visible = false;
            ViewState["PageNo"] = 0;
        }
        else
        {
            if (ddl_paging.SelectedItem.Value.Equals("10"))
            {
                totalcount = Convert.ToInt32(ddl_paging.SelectedItem.Value);
                pds.DataSource = medialist;
                pds.AllowPaging = true;
                pds.PageSize = totalcount;
                pds.CurrentPageIndex = (int)ViewState["PageNo"];
                currentcount = db.MediaItems.Where(img => allowedMediaTypes.Contains(img.mediaType)).Count();
            }
            else if (ddl_paging.SelectedItem.Value.Equals("100"))
            {
                totalcount = Convert.ToInt32(ddl_paging.SelectedItem.Value);
                pds.DataSource = medialist;
                pds.AllowPaging = true;
                pds.PageSize = totalcount;
                pds.CurrentPageIndex = (int)ViewState["PageNo"];
                currentcount = db.MediaItems.Where(img => allowedMediaTypes.Contains(img.mediaType)).Count();
            }
        }
        if (totalcount != 0)
        {
            decimal pageNo = Math.Ceiling((Convert.ToDecimal(currentcount) / Convert.ToDecimal(totalcount)));
            PopulatePager(pageNo, currentcount, totalcount);
        }
        else if (currentcount <= totalcount)
        {
            Repeater2.Visible = false;
        }

        Repeater1.DataSource = pds;
        Repeater1.DataBind();
    }

    protected void ddl_sort_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    private void bindMedia()
    {

        DreamBirdEntities db = new DreamBirdEntities();
        PagedDataSource pds = new PagedDataSource();
        var medialist = db.MediaItems.Where(img => allowedMediaTypes.Contains(img.mediaType)).OrderBy(ddl_sort.SelectedItem.Value).ToList();
        foreach (var mediaitem in medialist)
        {
            if (mediaitem.mediaType.Equals("audio"))
            {
                mediaitem.path = "~/Components/MediaBank/Content/Images/100x100/audio.png";
            }
            else if (mediaitem.mediaType.Equals("video"))
            {
                mediaitem.path = "~/Components/MediaBank/Content/Images/100x100/video.png";
            }
            else if (mediaitem.mediaType.Equals("image") || mediaitem.mediaType.Equals("Image"))
            {
                mediaitem.path = "~/Components/MediaBank/Content/Images/100x100/" + mediaitem.name;
            }
        }
        int totalcount = 0;
        int currentcount = 0;
        if (ddl_paging.SelectedItem.Value.Equals("all"))
        {
            currentcount = medialist.Count;
            pds.DataSource = medialist;
            pds.CurrentPageIndex = 0;
            pds.AllowPaging = false;
            Repeater2.Visible = false;
            ViewState["PageNo"] = 0;
        }
        else
        {
            if (ddl_paging.SelectedItem.Value.Equals("10"))
            {
                totalcount = Convert.ToInt32(ddl_paging.SelectedItem.Value);
                pds.DataSource = medialist;
                pds.AllowPaging = true;
                pds.PageSize = totalcount;
                pds.CurrentPageIndex = (int)ViewState["PageNo"];
                currentcount = db.MediaItems.Where(img => allowedMediaTypes.Contains(img.mediaType)).Count();
            }
            else if (ddl_paging.SelectedItem.Value.Equals("100"))
            {
                totalcount = Convert.ToInt32(ddl_paging.SelectedItem.Value);
                pds.DataSource = medialist;
                pds.AllowPaging = true;
                pds.PageSize = totalcount;
                pds.CurrentPageIndex = (int)ViewState["PageNo"];
                currentcount = db.MediaItems.Where(img => allowedMediaTypes.Contains(img.mediaType)).Count();
            }
        }
        if (totalcount != 0)
        {
            decimal pageNo = Math.Ceiling((Convert.ToDecimal(currentcount) / Convert.ToDecimal(totalcount)));
            PopulatePager(pageNo, currentcount, totalcount);
        }
        else if (currentcount <= totalcount)
        {
            Repeater2.Visible = false;
        }

        Repeater1.DataSource = pds;
        Repeater1.DataBind();
    }

    private void PopulatePager(decimal recordCount, int totalrecords, int limit)
    {
        List<ListItem> pages = new List<ListItem>();
        if (recordCount > 0)
        {
            int difference = totalrecords - limit;
            for (int i = 1; i <= recordCount; i++)
            {
                if (i == ((int)ViewState["PageNo"]) + 1)
                {
                    pages.Add(new ListItem(difference.ToString(), i.ToString(), false));
                }
                else
                {
                    pages.Add(new ListItem(difference.ToString(), i.ToString(), true));
                }
            }
        }
        Repeater2.Visible = true;
        Repeater2.DataSource = pages;
        Repeater2.DataBind();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        string commandname = lb.CommandName;
        ViewState["PageNo"] = Convert.ToInt32(commandname) - 1;
        List<CheckBox> lcb = new List<CheckBox>();
        //lcb.Add(ch_audio);
        //lcb.Add(ch_video);
        //lcb.Add(ch_image);
        foreach (CheckBox chb in lcb)
        {
            if (chb.ID.Equals("ch_audio"))
            {
                if (!(allowedMediaTypes.Any(a => a.Equals("audio"))))
                {
                    if (chb.Checked)
                        allowedMediaTypes.Add("audio");
                    else
                        allowedMediaTypes.Remove("audio");
                }
            }
            else if (chb.ID.Equals("ch_video"))
            {
                if (!(allowedMediaTypes.Any(a => a.Equals("video"))))
                {
                    if (chb.Checked)
                        allowedMediaTypes.Add("video");
                    else
                        allowedMediaTypes.Remove("video");
                }
            }
            else if (chb.ID.Equals("ch_image"))
            {
                if (!(allowedMediaTypes.Any(a => a.Equals("Image"))))
                {
                    if (chb.Checked)
                        allowedMediaTypes.Add("Image");
                    else
                        allowedMediaTypes.Remove("Image");
                }
            }
        }
        bindMedia();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        if (closeMediaBank != null)
        {
            closeMediaBank(this, EventArgs.Empty);
        }
    }

    protected void thumb_media_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton img = (ImageButton)sender;
        int media_id = Convert.ToInt32(img.Attributes["data-id"].ToString());

        if (MediaSelectedEvent != null)
        {
            EventArgMediaSelection evt = new EventArgMediaSelection();
            evt.SelectedMedia = media_id;
            MediaSelectedEvent(this, evt);
        }

    }
}