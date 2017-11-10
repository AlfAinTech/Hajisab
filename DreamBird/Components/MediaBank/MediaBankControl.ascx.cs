using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Net;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using ImageProcessor;
using System.Drawing;
using ImageProcessor.Imaging;

public partial class Components_MediaBank_MediaBankControl : System.Web.UI.UserControl, ICorePackageControl
{

    // Event Handlers
    public event EventHandler MediaSelectedEvent;
    public event EventHandler MyEvents;
    public event EventHandler SomeThindDone;
    public event EventHandler MoreSomethingElseDone;
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


    public void LoadScripts()
    {
        string path = ResolveUrl("~/Components/MediaBank/Content/js/MediaCode.js");
        string script10 = "<script src='" + path + "'></script>";
        TagControl.LoadScripts();
        ScriptManager.RegisterStartupScript(Panel1, Panel1.GetType(), "script_fffsssssh", script10, false);
        ScriptManager.RegisterStartupScript(Panel1, Panel1.GetType(), "a_upload", "UploaderFunction();", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            PackageEntities db = new PackageEntities();
            // Binding Category Lists, One for sorting and secong for selection of media item
            var categorylist = db.MediaCategories.ToList();
            ddl_cat.DataSource = categorylist;
            ddl_cat.DataTextField = "CategoryName";
            ddl_cat.DataValueField = "id";
            ddl_cat.DataBind();
            ddl_cat1.DataSource = categorylist;
            ddl_cat1.DataTextField = "CategoryName";
            ddl_cat1.DataValueField = "id";
            ddl_cat1.DataBind();
            // Enable or Disable Media Type Selection Checkboxes.
            if (ShowAudioTypeMedia)
            {

                allowedMediaTypes.Add("audio");
                ch_audio.Enabled = true;
                ch_audio.Checked = true;
            }
            if (ShowVideoTypeMedia)
            {
                allowedMediaTypes.Add("video");
                ch_video.Enabled = true;
                ch_video.Checked = true;
            }
            if (ShowImageTypeMedia)
            {
                allowedMediaTypes.Add("Image");
                ch_image.Enabled = true;
                ch_image.Checked = true;
            }
            if(!showAdditionControls)
            {
                Button2.Visible = false;
            }

            bindMedia();

            //bindMedia(0, "video");
            // binding the grids of categories and tags for insersion, deletion and editing
            var categories = db.MediaCategories.ToList();
            if (categories.Count == 0)
            {
                MediaCategory mt = new MediaCategory();
                categories.Add(mt);
            }
            grid_categories.DataSource = categories;
            grid_categories.DataBind();
            var tags = db.Tags.ToList();
            if (tags.Count == 0)
            {
                Tag tag = new Tag();
                tags.Add(tag);
            }
            grid_tags.DataSource = tags;
            grid_tags.DataBind();

        }
        LoadScripts();
    }

    // Populate and use Paging Module
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

    // Main method to bind the Media items into the Media bank
    private void bindMedia()
    {
        Repeater1.DataSource = null;
        Repeater1.DataBind();
        PackageEntities db = new PackageEntities();
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

    //set selected navigation's media item
    public void setMediaItem(int id)
    {
        MediaItem icon = new MediaItem();
        PackageEntities db = new PackageEntities();
        icon = db.MediaItems.Where(img => img.id == id).First();
        SelectedMediaItem = icon;
        if (MediaSelectedEvent != null)
            MediaSelectedEvent(this, EventArgs.Empty);
        TagControl.LoadScripts();
        LoadScripts();
        //if (id != 0)
        //{
        //   

        //    string type = icon.mediaType;

        //    if (type.Equals("Image") || type.Equals("image"))
        //        ch_image.Checked = true;
        //    else if (type.Equals("audio"))
        //        ch_audio.Checked = true;
        //    else if (type.Equals("video"))
        //        ch_video.Checked = true;
        //    var mediatags = db.MediaTags.Where(w => w.MediaItem_id == icon.id).Select(s => s.Tag_id).ToList();
        //    var tempString = db.Tags.Where(w => mediatags.Contains(w.id)).Select(s => s.Name).ToList();
        //    TagControl.LoadScripts();
        //    StringBuilder sb = new StringBuilder();
        //    sb.Append("<script>");
        //    //sb.Append("if(typeof(dataArray)  === 'undefined'){");
        //    //sb.Append("var dataArray = new Array;}");
        //    sb.Append("dataArray.length = 0;");
        //    //sb.Append("var dataArray = new Array;");
        //    foreach (string str in tempString)
        //    {
        //        sb.Append("dataArray.push('" + str + "');");
        //    }
        //    sb.Append("</script>");
        //    //LoadScripts();
        //    ScriptManager.RegisterStartupScript(Panel1, typeof(UpdatePanel), "DataArrayScript", sb.ToString(), false);
        //    //ScriptManager.RegisterStartupScript(Panel1, typeof(UpdatePanel), "a_keya", "Sys.Application.add_load(MyNewCode);", true);
        //    //ScriptManager.RegisterStartupScript(Panel1, typeof(UpdatePanel), "a_keys", "Sys.Application.add_load(SelectToolbars);", true);
        //    //ScriptManager.RegisterStartupScript(Panel1, typeof(UpdatePanel), "a_keys", "Sys.Application.add_load(UploaderFunction);", true);
        //    //ScriptManager.RegisterStartupScript(Panel1, typeof(UpdatePanel), "a_keys", "Sys.Application.add_load(MyCode);", true);
        //    //TagControl.LoadScripts();
        //   
        //}
    }

    protected void cmdImageSelected_Click(object sender, EventArgs e)
    {
        int id = int.Parse(ddlImages.SelectedItem.Value);
        MediaItem icon = new MediaItem();
        PackageEntities db = new PackageEntities();
        icon = (MediaItem)db.MediaItems.Where(img => img.id == id).First();

        SelectedMediaItem = icon;
        if (MediaSelectedEvent != null)
        {
            MediaSelectedEvent(this, EventArgs.Empty);
        }


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        MyEvents(this, EventArgs.Empty); // inform container control that this is the personal event; this is handy event for example to keep showing the popupExtender control.

    }


    protected void Preview(string CommandName)
    {
        try
        {
            details.Visible = true;
            t_details.Visible = false;
            //Panel2.Style.Add("width", "90%");
            //Panel2.Style.Add("height", "80%");
            string ImageName = CommandName;

            PackageEntities db = new PackageEntities();

            var item = db.MediaItems.Where(w => w.name == ImageName).First();
            Label1.Text = item.name;
            //LinkButton1.Value = "Preview";
            if (item.MediaCategory_id != null)
            {
                ddl_cat1.SelectedItem.Value = item.MediaCategory_id.ToString();
            }

            if (item.mediaType.Equals("image") || item.mediaType.Equals("Image"))
            {
                //Following Lines are commented in order work it with system
                //Image1.ImageUrl = item.path + "/100x100/" + item.name;
                ShowImagePreview(item);
                lbl_res.Visible = true;
                ddl_resolution.Visible = true;
                ddl_vidQuality.Visible = false;
                lbl_quality.Visible = false;
            }
            else if (item.mediaType.Equals("audio"))
            {
                //Image1.ImageUrl = "/Components/MediaBank/Content/Images/100x100/audio.png";
                ShowAudioPreview(item);
                lbl_res.Visible = false;
                ddl_resolution.Visible = false;
                ddl_vidQuality.Visible = false;
                lbl_quality.Visible = false;
            }
            else if (item.mediaType.Equals("video") || item.mediaType.Equals("video_t"))
            {
                //Image1.ImageUrl = "/Components/MediaBank/Content/Images/100x100/video.png";
                ShowVideoPreview(item);
                ddl_resolution.Visible = false;
                lbl_res.Visible = false;
                ddl_vidQuality.Visible = true;
                lbl_quality.Visible = true;
            }
            //previewblock.Visible = true;
            //if (MyEvents != null)
            //{
            //    MyEvents(this, EventArgs.Empty);

            //}
        }
        catch (Exception e)
        {

        }
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        PackageEntities db = new PackageEntities();


        details.Visible = true;
        t_details.Visible = false;
        //Panel2.Style.Add("width", "90%");
        //Panel2.Style.Add("height", "80%");
        ImageButton img = (ImageButton)sender;
        string ImageName = img.CommandName;
        var item = db.MediaItems.Where(w => w.name == ImageName).First();
        if (item.MediaCategory_id != null)
        {
            ddl_cat1.SelectedValue = item.MediaCategory_id.ToString();
        }
            var mediatags = db.MediaTags.Where(w => w.MediaItem_id == item.id).Select(s => s.Tag_id).ToList();
        var tempString = db.Tags.Where(w => mediatags.Contains(w.id)).Select(s => s.Name).ToList();
        //ScriptManager.RegisterStartupScript(UpdatePanel6, UpdatePanel6.GetType(), "a_keya", "<script type='text/javascript'>Sys.Application.add_load(ArrayCode);</script>", false);
        //LoadScripts();
        TagControl1.SetTags(tempString);
        //ScriptManager.RegisterStartupScript(Panel1, typeof(UpdatePanel), "a_keya", "Sys.Application.add_load(MyNewCode);", true);
        //ScriptManager.RegisterStartupScript(Panel1, typeof(UpdatePanel), "a_keys", "Sys.Application.add_load(SelectToolbars);", true);
        //ScriptManager.RegisterStartupScript(Panel1, typeof(UpdatePanel), "a_keys", "Sys.Application.add_load(UploaderFunction);", true);
        //ScriptManager.RegisterStartupScript(Panel1, typeof(UpdatePanel), "a_keys", "Sys.Application.add_load(MyCode);", true);
        Label1.Text = item.name;

        //LinkButton1.Value = "Preview";
        if (item.MediaCategory_id != null)
        {
            ddl_cat1.SelectedItem.Value = item.MediaCategory_id.ToString();
        }

        if (item.mediaType.Equals("image") || item.mediaType.Equals("Image"))
        {
            //Following Lines are commented in order work it with system
            //Image1.ImageUrl = item.path + "/100x100/" + item.name;
            ShowImagePreview(item);
            lbl_res.Visible = true;
            ddl_resolution.Visible = true;
            ddl_vidQuality.Visible = false;
            lbl_quality.Visible = false;
        }
        else if (item.mediaType.Equals("audio"))
        {
            //Image1.ImageUrl = "/Components/MediaBank/Content/Images/100x100/audio.png";
            ShowAudioPreview(item);
            lbl_res.Visible = false;
            ddl_resolution.Visible = false;
            ddl_vidQuality.Visible = false;
            lbl_quality.Visible = false;
        }
        else if (item.mediaType.Equals("video") || item.mediaType.Equals("video_t"))
        {
            //Image1.ImageUrl = "/Components/MediaBank/Content/Images/100x100/video.png";
            ShowVideoPreview(item);
            ddl_resolution.Visible = false;
            lbl_res.Visible = false;
            ddl_vidQuality.Visible = true;
            lbl_quality.Visible = true;
        }
        //previewblock.Visible = true;
        TagControl.LoadScripts();
        ModalPopupExtender1.Show();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);

        }

        if (SomeThindDone != null)
        {
            SomeThindDone(this, EventArgs.Empty);
        }
        if (MoreSomethingElseDone != null)
        {
            MoreSomethingElseDone(this, EventArgs.Empty);
        }

    }

    public void ShowImagePreview(MediaItem item)
    {
        if (File.Exists(Server.MapPath("~" + item.path + "/Original/" + item.name)))
        {

            System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath("~" + item.path + "/Original/" + item.name));

            System.Web.UI.WebControls.Image temp = new System.Web.UI.WebControls.Image();
            temp.ImageUrl = item.path + "/Original/" + item.name;
            //temp.Attributes.Add("style", "max-width:100%; max-height:100%; height:inherit !important");
            //temp.Attributes.Add("Width", "100%");()

            //preview.Attributes.Add("style", "overflow:hidden;");
            preview.Controls.Add(temp);
            Name.Text = item.name;
            Resolution.Text = "Resulution " + image.Width + " x " + image.Height;
            ScriptManager.RegisterStartupScript(preview, preview.GetType(), "script_size", "AdjustImageSize(" + image.Width + ", " + image.Height + ");", true);
            //Size.Text = (Convert.ToDecimal((new FileInfo(Server.MapPath("~" + Image1.ImageUrl))).Length.ToString()) / Convert.ToDecimal(10)).ToString()+" kb";

        }
    }

    public void ShowAudioPreview(MediaItem item)
    {
        System.Web.UI.HtmlControls.HtmlGenericControl html = new System.Web.UI.HtmlControls.HtmlGenericControl("AUDIO");
        html.Attributes.Add("src", "../../" + item.path + "/" + item.name);
        html.Attributes.Add("controls", "");
        html.Attributes.Add("loop", "");
        html.InnerText = "Your Browser Does Not Support Audio Player";
        TagLib.File f = TagLib.File.Create(Server.MapPath("~/") + item.path + "/" + item.name, TagLib.ReadStyle.Average);
        int duration = (int)f.Properties.Duration.TotalMinutes;
        Name.Text = item.name;
        Resolution.Text = "Duration " + duration.ToString() + " Minutes";
        Size.Text = (Convert.ToDecimal((new FileInfo(Server.MapPath("~/") + item.path + "/" + item.name)).Length.ToString()) / Convert.ToDecimal(10)).ToString() + " kb";
        preview.Controls.Add(html);
    }

    public void ShowVideoPreview(MediaItem item)
    {
        Session["mediaItem"] = item;
        System.Web.UI.HtmlControls.HtmlGenericControl html = new System.Web.UI.HtmlControls.HtmlGenericControl("VIDEO");
        System.Web.UI.HtmlControls.HtmlGenericControl source = new System.Web.UI.HtmlControls.HtmlGenericControl("SOURCE");
        string filepath = null;
        if (ShowTranscriptOptions)
        {
            btn_addvt.Visible = true;
        }
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
        source.Attributes.Add("src", "../.." + filepath);
        source.Attributes.Add("type", "video/mp4");
        html.Attributes.Add("width", "100%");
        //html.Attributes.Add("height", "400px");
        html.Attributes.Add("class", "video-js");
        html.Attributes.Add("controls", "");
        html.Attributes.Add("preload", "auto");
        html.InnerText = "Your Browser Does Not Support Video Player";
        TagLib.File f = TagLib.File.Create(Server.MapPath("~/") + filepath, TagLib.ReadStyle.Average);
        int duration = (int)f.Properties.Duration.TotalMinutes;
        Name.Text = item.name;
        Resolution.Text = "Duration " + duration.ToString() + " Minutes";
        Size.Text = (Convert.ToDecimal((new FileInfo(Server.MapPath("~/") + filepath)).Length.ToString()) / Convert.ToDecimal(10)).ToString() + " kb";
        html.Controls.Add(source);
        preview.Controls.AddAt(0, html);

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        MediaItem mi = db.MediaItems.Where(u => u.name == Label1.Text).First();
        mi.MediaCategory_id = Convert.ToInt32(ddl_cat1.SelectedItem.Value);
        db.SaveChanges();
        MyEvents(this, EventArgs.Empty);
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        string categoryid = ddl_cat1.SelectedItem.Value;

        string mediaName = Label1.Text; // This Label shows the Name of the Media File that is being used as Query paremeter below
        MediaItem icon = new MediaItem();
        string resOption = null; // 
        PackageEntities db = new PackageEntities();
        icon = db.MediaItems.Where(img => img.name == mediaName).First();
        if (icon.mediaType.Equals("image") || icon.mediaType.Equals("Image"))
        {
            //Following Lines are commented in order work it with system
            resOption = ddl_resolution.SelectedItem.Value;
        }
        else if (icon.mediaType.Equals("audio"))
        {

        }
        else if (icon.mediaType.Equals("video") || icon.mediaType.Equals("video_t"))
        {
            resOption = ddl_vidQuality.SelectedItem.Value;
        }
        icon.MediaCategory_id = Convert.ToInt32(categoryid);
        icon.PathWithResolution = icon.path + "/" + resOption + "/" + icon.name;
        SelectedMediaItem = icon;

        // Saving Tags into Media Tags Table
        //string text = Text2.Text;
        List<string> newstring = TagControl1.GetTags();
        if (newstring != null)
        {
            List<Tag> tags = new List<Tag>();
            foreach (string name in newstring)
            {
                if (db.Tags.Any(a => a.Name == name))
                {
                    tags.Add(db.Tags.Where(w => w.Name == name).First());
                }
                else
                {
                    Tag tag = new Tag();
                    tag.Name = name;
                    db.Tags.Add(tag);
                    db.SaveChanges();
                    tags.Add(db.Tags.Where(w => w.Name == tag.Name).First());
                }
            }


            foreach (var tag in tags)
            {
                if (!(db.MediaTags.Any(a => (a.MediaItem_id == icon.id) && (a.Tag_id == tag.id))))
                {
                    MediaTag mt = new MediaTag();
                    mt.MediaItem_id = icon.id;
                    mt.Tag_id = tag.id;
                    db.MediaTags.Add(mt);
                    db.SaveChanges();
                }

            }
        }
        List<string> tempString = new List<string>();
        var list = db.Tags.ToList();
        foreach (var lst in list)
        {
            tempString.Add(lst.Name);
        }
        StringBuilder sb = new StringBuilder();
        sb.Append("<script>");
        sb.Append("testArray.length = 0;");
        sb.Append("</script>");
        sb.Append("<script>");
        foreach (string str in tempString)
        {
            sb.Append("testArray.push('" + str + "');");
        }
        sb.Append("</script>");

        ScriptManager.RegisterStartupScript(UpdatePanel_Gallery, UpdatePanel_Gallery.GetType(), "TestArrayScript1", sb.ToString(), false);
        ScriptManager.RegisterStartupScript(UpdatePanel_Gallery, UpdatePanel_Gallery.GetType(), "a_keyu", "<script type='text/javascript'>Sys.Application.add_load(refreshFiels);</script>", false);

        db.SaveChanges();
        TagControl.LoadScripts();
        if (MediaSelectedEvent != null)
        {
            MediaSelectedEvent(this, EventArgs.Empty);
        }
    }

    protected void ch_audio_CheckedChanged(object sender, EventArgs e)
    {
        List<CheckBox> lcb = new List<CheckBox>();
        lcb.Add(ch_audio);
        lcb.Add(ch_video);
        lcb.Add(ch_image);
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
        ScriptManager.RegisterStartupScript(UpdatePanel_Gallery, UpdatePanel_Gallery.GetType(), "a_keys", "<script type='text/javascript'>Sys.Application.add_load(SelectToolbars);</script>", false);
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
    }

    protected void btn_filter_Click(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        //string text = Text1.Text;
        List<string> newstring = TagControl.GetTags();
        var tags = db.Tags.Where(w => newstring.Contains(w.Name)).Select<Tag, int?>(s => s.id).ToList();
        var mediatags = db.MediaTags.Where(w => tags.Contains(w.Tag_id)).Select(s => s.MediaItem_id).ToList();
        var categories = db.MediaCategories.Where(w => w.CategoryName == ddl_cat.SelectedItem.Text).Select(s => s.id).ToList();
        if (ddl_choice.SelectedItem.Value.Equals("AND"))
        {
            if (mediatags.Count != 0)
            {
                int? i = categories.First();
                var mediaitems = db.MediaItems.Where(w => (mediatags.Contains(w.id) && w.MediaCategory_id == i)).ToList();
                foreach (var mediaitem in mediaitems)
                {
                    mediaitem.path = mediaitem.path + "/100x100/" + mediaitem.name;
                }
                Repeater1.DataSource = mediaitems;
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = null;
                Repeater1.DataBind();
            }

        }
        else if (ddl_choice.SelectedItem.Value.Equals("OR"))
        {
            int? i = categories.First();
            var mediaitems = db.MediaItems.Where(w => w.MediaCategory_id == i).ToList().Union(db.MediaItems.Where(w => mediatags.Contains(w.id)).ToList());
            foreach (var mediaitem in mediaitems)
            {
                mediaitem.path = mediaitem.path + "/100x100/" + mediaitem.name;
            }
            Repeater1.DataSource = mediaitems;
            Repeater1.DataBind();
        }
        TagControl.LoadScripts();
        if (MyEvents != null)
            MyEvents(this, EventArgs.Empty);
    }



    protected void btn_addtag_Click(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        string text = "ASD";
        if (text != null || !(text.Equals("")))
        {
            List<string> newstring = TagControl1.GetTags();
            foreach (string tag in newstring)
            {
                Tag dt = new Tag();
                dt.Name = tag;
                db.Tags.Add(dt);
                db.SaveChanges();
            }
        }
        if (MyEvents != null)
            MyEvents(this, EventArgs.Empty);
    }

    protected void Add_row_Click(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        TextBox tb = (TextBox)grid_categories.FooterRow.FindControl("txt_categoryname");
        if (tb != null && !tb.Text.Equals(""))
        {
            MediaCategory mc = new MediaCategory();
            mc.CategoryName = tb.Text;
            db.MediaCategories.Add(mc);
            db.SaveChanges();
            var ds = db.MediaCategories.ToList();
            grid_categories.DataSource = ds;
            grid_categories.DataBind();
            ddl_cat.DataSource = ds;
            ddl_cat.DataBind();
            ddl_cat1.DataSource = ds;
            ddl_cat1.DataBind();

        }
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if (item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if (item.mediaType == "udio")
        {
            ShowAudioPreview(item);
        }
        else if (item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender2.Show();
    }

    protected void Add_row_Click1(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        TextBox tb = (TextBox)grid_tags.FooterRow.FindControl("txt_Name");
        if (tb != null && !tb.Text.Equals(""))
        {
           
            Tag mc = new Tag();
            mc.Name = tb.Text;
            db.Tags.Add(mc);
            db.SaveChanges();
            var ds = db.Tags.ToList();
            grid_tags.DataSource = ds;
            grid_tags.DataBind();
            List<string> tempString = new List<string>();
            var list = db.Tags.ToList();
            foreach (var lst in list)
            {
                tempString.Add(lst.Name);
            }
            StringBuilder sb = new StringBuilder();
            sb.Append("<script>");
            sb.Append("testArray.length = 0;");
            sb.Append("</script>");
            sb.Append("<script>");
            foreach (string str in tempString)
            {
                sb.Append("testArray.push('" + str + "');");
            }
            sb.Append("</script>");

            ScriptManager.RegisterStartupScript(UpdatePanel_Gallery, UpdatePanel_Gallery.GetType(), "TestArrayScript1", sb.ToString(), false);
            ScriptManager.RegisterStartupScript(UpdatePanel_Gallery, UpdatePanel_Gallery.GetType(), "a_keyu", "<script type='text/javascript'>Sys.Application.add_load(refreshFiels);</script>", false);
        }
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if (item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if (item.mediaType == "audio")
        {
            ShowAudioPreview(item);
        }
        else if (item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender3.Show();

    }

    protected void ddl_paging_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<CheckBox> lcb = new List<CheckBox>();
        lcb.Add(ch_audio);
        lcb.Add(ch_video);
        lcb.Add(ch_image);
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

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        string commandname = lb.CommandName;
        ViewState["PageNo"] = Convert.ToInt32(commandname) - 1;
        List<CheckBox> lcb = new List<CheckBox>();
        lcb.Add(ch_audio);
        lcb.Add(ch_video);
        lcb.Add(ch_image);
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

    protected void thumb_videoTranscript_Click(object sender, ImageClickEventArgs e)
    {

        //ScriptManager.RegisterStartupScript(UpdatePanel_Gallery, UpdatePanel_Gallery.GetType(), "a_keyu", "<script type='text/javascript'>Sys.Application.add_load(SelectToolbar);</script>", false);
        //ImageButton img = (ImageButton)sender;
        //string ImageName = img.CommandName;
        //PackageEntities db = new PackageEntities();
        //Panel2.Style.Add("width", "90%");
        //var item = db.MediaItems.Where(w => w.name == ImageName).First();
        //var mediatags = db.MediaTags.Where(w => w.MediaItem_id == item.id).Select(s => s.Tag_id).ToList();
        //var tempString = db.Tags.Where(w => mediatags.Contains(w.id)).Select(s => s.Name).ToList();
        ////ScriptManager.RegisterStartupScript(UpdatePanel6, UpdatePanel6.GetType(), "a_keya", "<script type='text/javascript'>Sys.Application.add_load(ArrayCode);</script>", false);
        //StringBuilder sb = new StringBuilder();
        //sb.Append("<script>");
        //sb.Append("dataArray.length = 0;");
        ////sb.Append("var dataArray = new Array;");
        //foreach (string str in tempString)
        //{
        //    sb.Append("dataArray.push('" + str + "');");
        //}
        //sb.Append("</script>");
        //ScriptManager.RegisterStartupScript(UpdatePanel_Gallery, typeof(UpdatePanel), "DataArrayScript", sb.ToString(), false);
        //ScriptManager.RegisterStartupScript(UpdatePanel_Gallery, UpdatePanel_Gallery.GetType(), "a_keya", "<script type='text/javascript'>Sys.Application.add_load(MyNewCode);</script>", false);
        //Label1.Text = item.name;
        //if (item.mediaType.Equals("video"))
        //{
        //    //Image1.ImageUrl = "/Components/MediaBank/Content/Images/100x100/video.png";
        //    AddTranscriptDetail(item);
        //}
        ////LinkButton1.Value = "Add Transcript Detail";
        //IVideoTranscript ivt = (IVideoTranscript)VideoTranscript1;
        //ivt.AddScripts();
        //ivt.BindMedia(item);
        //ivt.BindMediaTranscript(item);
        //ivt.CallJavaScript();
        ////previewblock.Visible = true;
        //ddl_resolution.Visible = false;
        //lbl_res.Visible = false;
        //ddl_vidQuality.Visible = true;
        //lbl_quality.Visible = true;
        //if (MyEvents != null)
        //{
        //    MyEvents(this, EventArgs.Empty);
        //}

    }

    protected void Add_row_Click2(object sender, EventArgs e)
    {
        TextBox timestamp = (TextBox)gw_transcript.FooterRow.FindControl("txt_timeStamp");
        TextBox text = (TextBox)gw_transcript.FooterRow.FindControl("txt_text");
        string ItemName = Label1.Text;
        PackageEntities db = new PackageEntities();
        var mediaItem = db.MediaItems.Where(w => w.name == ItemName).First();
        if (!(timestamp.Text.Equals("") && text.Text.Equals("")))
        {
            decimal d = 0;
            if (Decimal.TryParse(timestamp.Text, out d))
            {
                VideoTranscript vt = new VideoTranscript();
                vt.MediaItem_id = mediaItem.id;
                vt.TimeStamp = Convert.ToDecimal(timestamp.Text);
                vt.Text = text.Text;
                db.VideoTranscripts.Add(vt);
                db.SaveChanges();
            }

        }
        AddTranscriptDetail(mediaItem);
        ModalPopupExtender1.Show();
        if (MyEvents != null)
            MyEvents(this, EventArgs.Empty);
    }

    protected void btn_saveTranscript_Click1(object sender, EventArgs e)
    {
        //string ItemName = Label1.Text;
        //PackageEntities db = new PackageEntities();
        //var mediaItem = db.MediaItems.Where(w => w.name == ItemName).First();


        //IVideoTranscript ivt = (IVideoTranscript)VideoTranscript1;
        ////mediaItem.mediaType = "video_t";
        ////db.SaveChanges();
        //ivt.CallJavaScript();
        //ivt.BindMediaTranscript(mediaItem);
        //ivt.BindMedia(mediaItem);
        //if (MyEvents != null)
        //{
        //    MyEvents(this, EventArgs.Empty);

        //}
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        List<CheckBox> lcb = new List<CheckBox>();
        lcb.Add(ch_audio);
        lcb.Add(ch_video);
        lcb.Add(ch_image);
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
        //bindMedia(0, "video");
        if (MyEvents != null)
            MyEvents(this, EventArgs.Empty);
    }

    protected void grid_categories_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_categories.EditIndex = e.NewEditIndex;
        BindData();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        PackageEntities db = new PackageEntities();
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if(item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if(item.mediaType == "udio")
        {
            ShowAudioPreview(item);
        }
        else if(item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender2.Show();
    }

    protected void grid_categories_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int ID = Convert.ToInt32(((Label)grid_categories.Rows[e.RowIndex]
                        .FindControl("Label2")).Text);
        string Name = ((TextBox)grid_categories.Rows[e.RowIndex]
                            .FindControl("TextBox1")).Text;
        PackageEntities db = new PackageEntities();
        var category = db.MediaCategories.Where(w => w.id == ID).First();
        category.CategoryName = Name;
        db.SaveChanges();
        grid_categories.EditIndex = -1;
        BindData();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if (item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if (item.mediaType == "udio")
        {
            ShowAudioPreview(item);
        }
        else if (item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender2.Show();
    }

    protected void BindData()
    {
        PackageEntities db = new PackageEntities();
        grid_categories.DataSource = db.MediaCategories.ToList();
        grid_categories.DataBind();
    }

    protected void grid_categories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_categories.EditIndex = -1;
        BindData();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        PackageEntities db = new PackageEntities();
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if (item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if (item.mediaType == "udio")
        {
            ShowAudioPreview(item);
        }
        else if (item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender2.Show();
    }

    protected void grid_categories_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(((Label)grid_categories.Rows[e.RowIndex]
                        .FindControl("Label_id")).Text);
        PackageEntities db = new PackageEntities();
        var instance = db.MediaCategories.Where(w => w.id == ID).First();
        db.MediaCategories.Remove(instance);
        db.SaveChanges();
        BindData();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if (item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if (item.mediaType == "audio")
        {
            ShowAudioPreview(item);
        }
        else if (item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender2.Show();
    }

    protected void grid_tags_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(((Label)grid_tags.Rows[e.RowIndex]
                        .FindControl("Label_tags")).Text);
        PackageEntities db = new PackageEntities();
        var instance = db.Tags.Where(w => w.id == ID).First();
        db.Tags.Remove(instance);
        db.SaveChanges();
        BindDataTags();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if (item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if (item.mediaType == "audio")
        {
            ShowAudioPreview(item);
        }
        else if (item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender3.Show();
    }

    protected void grid_tags_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_tags.EditIndex = e.NewEditIndex;
        BindDataTags();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        PackageEntities db = new PackageEntities();
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if (item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if (item.mediaType == "audio")
        {
            ShowAudioPreview(item);
        }
        else if (item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender3.Show();
    }

    protected void grid_tags_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int ID = Convert.ToInt32(((Label)grid_tags.Rows[e.RowIndex]
                        .FindControl("label_tagid")).Text);
        string Name = ((TextBox)grid_tags.Rows[e.RowIndex]
                            .FindControl("txt_tagName")).Text;
        PackageEntities db = new PackageEntities();
        var category = db.Tags.Where(w => w.id == ID).First();
        category.Name = Name;
        db.SaveChanges();
        grid_tags.EditIndex = -1;
        BindDataTags();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if (item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if (item.mediaType == "audio")
        {
            ShowAudioPreview(item);
        }
        else if (item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender3.Show();
    }

    protected void grid_tags_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_tags.EditIndex = -1;
        BindDataTags();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        PackageEntities db = new PackageEntities();
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if (item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if (item.mediaType == "audio")
        {
            ShowAudioPreview(item);
        }
        else if (item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender3.Show();
    }

    protected void BindDataTags()
    {
        PackageEntities db = new PackageEntities();
        grid_tags.DataSource = db.Tags.ToList();
        grid_tags.DataBind();
    }

    protected void BindDataTranscript()
    {
        PackageEntities db = new PackageEntities();
        gw_transcript.DataSource = db.VideoTranscripts.ToList();
        gw_transcript.DataBind();
    }

    protected void gw_transcript_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int ID = Convert.ToInt32(((Label)gw_transcript.Rows[e.RowIndex]
                        .FindControl("Lbl_id")).Text);
        string TimeStamp = ((TextBox)gw_transcript.Rows[e.RowIndex]
                            .FindControl("txt_etimestamp")).Text;
        string text = ((TextBox)gw_transcript.Rows[e.RowIndex]
                            .FindControl("txt_etext")).Text;
        PackageEntities db = new PackageEntities();
        var vt = db.VideoTranscripts.Where(w => w.id == ID).First();
        vt.TimeStamp = Convert.ToDecimal(TimeStamp);
        vt.Text = text;
        db.SaveChanges();
        string ItemName = Label1.Text;
        var mediaItem = db.MediaItems.Where(w => w.name == ItemName).First();
        AddTranscriptDetail(mediaItem);
        gw_transcript.EditIndex = -1;
        BindDataTranscript();
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
        string medianame = Label1.Text;
        MediaItem item = db.MediaItems.Where(w => w.name == medianame).First();
        if (item.mediaType == "Image")
        {
            ShowImagePreview(item);
        }
        else if (item.mediaType == "audio")
        {
            ShowAudioPreview(item);
        }
        else if (item.mediaType == "video")
        {
            ShowVideoPreview(item);
        }
        ModalPopupExtender1.Show();
        ModalPopupExtender1.Show();
    }

    protected void gw_transcript_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(((Label)gw_transcript.Rows[e.RowIndex]
                        .FindControl("Label1")).Text);
        PackageEntities db = new PackageEntities();
        var instance = db.VideoTranscripts.Where(w => w.id == ID).First();
        db.VideoTranscripts.Remove(instance);
        db.SaveChanges();
        BindDataTranscript();
        string ItemName = Label1.Text;
        var mediaItem = db.MediaItems.Where(w => w.name == ItemName).First();
        AddTranscriptDetail(mediaItem);
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
            

        ModalPopupExtender1.Show();
    }

    protected void gw_transcript_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gw_transcript.EditIndex = -1;
        BindDataTranscript();
        string ItemName = Label1.Text;
        PackageEntities db = new PackageEntities();
        var mediaItem = db.MediaItems.Where(w => w.name == ItemName).First();
        AddTranscriptDetail(mediaItem);
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
           

        ModalPopupExtender1.Show();
    }

    protected void gw_transcript_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gw_transcript.EditIndex = e.NewEditIndex;
        BindDataTranscript();
        string ItemName = Label1.Text;
        PackageEntities db = new PackageEntities();
        var mediaItem = db.MediaItems.Where(w => w.name == ItemName).First();
        AddTranscriptDetail(mediaItem);
        if (MyEvents != null)
            MyEvents(this, EventArgs.Empty);

        ModalPopupExtender1.Show();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        TagControl.LoadScripts();
        if (closeMediaBank != null)
        {
            closeMediaBank(this, EventArgs.Empty);
        }
    }

    void ICorePackageControl.BindData()
    {
        //throw new NotImplementedException();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
        //throw new NotImplementedException();
    }

    protected void btn_addvt_Click(object sender, EventArgs e)
    {
        MediaItem item = (MediaItem)Session["mediaItem"];
        AddTranscriptDetail(item);
        ModalPopupExtender1.Show();
    }
    private void AddTranscriptDetail(MediaItem item)
    {
        if (item != null)
        {
            t_details.Visible = true;
            string filepath = null;
            preview.Attributes["class"] = "col-md-6";
            detail.Attributes["class"] = "col-md-6";
            System.Web.UI.HtmlControls.HtmlGenericControl html = new System.Web.UI.HtmlControls.HtmlGenericControl("VIDEO");
            System.Web.UI.HtmlControls.HtmlGenericControl source = new System.Web.UI.HtmlControls.HtmlGenericControl("SOURCE");
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
            source.Attributes.Add("src", "../.." + filepath);
            source.Attributes.Add("type", "video/mp4");
            html.Attributes.Add("width", "100%");
            html.Attributes.Add("class", "video-js");
            html.Attributes.Add("controls", "");
            html.Attributes.Add("preload", "auto");
            html.InnerText = "Your Browser Does Not Support Video Player";
            html.Controls.Add(source);
            preview.Controls.AddAt(0, html);
            PackageEntities db = new PackageEntities();
            var trans = db.VideoTranscripts.Where(w => w.MediaItem_id == item.id).ToList();
            if (trans.Count == 0)
            {
                VideoTranscript vt = new VideoTranscript();
                trans.Add(vt);
            }
            gw_transcript.DataSource = trans;
            gw_transcript.DataBind();
        }

    }

}
