using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_AddNewsDream : CoreDreamControlAdapter
{
    public event EventHandler Dreamids_Added_Event;
    public event EventHandler Cancel_Dream_Event;
    public event EventHandler MyEvents;
    List<int> dream_ids = new List<int>();


    public List<int> Dream_ids_
    {
        get { return this.dream_ids; }
        set { this.dream_ids = value; }
    }
    private string editMode = "false";
    public string EditMode
    {
        get
        {
            return editMode;
        }
        set
        {
            editMode = value;
        }
    }
    override
    public void BindData2(int id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var dreams = db.Dreams.ToList();
        foreach(var dream in dreams)
        {
            if (dream.MediaItem.mediaType.Equals("audio"))
            {
                dream.MediaItem.path = "~/Components/MediaBank/Content/Images/100x100/audio.png";
            }
            else if (dream.MediaItem.mediaType.Equals("video"))
            {
                dream.MediaItem.path = "~/Components/MediaBank/Content/Images/100x100/video.png";
            }
            else if (dream.MediaItem.mediaType.Equals("Image"))
            {
                dream.MediaItem.path = "~/Components/MediaBank/Content/Images/100x100/" + dream.MediaItem.name;
            }
        }
        if (dreams != null)
        {
            dl_dream.DataSource = dreams;
            dl_dream.DataBind();
            dl_dream.Visible = true;
            var dream_ids = db.NewsDreamNews.Where(w => w.news_id == id).Select(s => s.dream_id).ToList();
            foreach (RepeaterItem ri in dl_dream.Items)
            {
                Label lblID = ri.FindControl("lblID") as Label;
                foreach (int ids in dream_ids)
                {
                    if (lblID.Text == ids.ToString())
                    {
                        CheckBox chk = (CheckBox)ri.FindControl("cb_is_add") as CheckBox;
                        chk.Checked = true;
                    }
                }
            }
        }
    }

    public void ClearControl()
    {
        foreach (RepeaterItem item in dl_dream.Items)
        {
            CheckBox chk = (CheckBox)item.FindControl("cb_is_add") as CheckBox;
            if (chk != null)
            {
                chk.Checked = false;
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dl_dream.Visible = false;
            DreamBirdEntities db = new DreamBirdEntities();
            var dreams = from n in db.Dreams
                         select n;
            foreach (var dream in dreams)
            {
                if (dream.MediaItem.mediaType.Equals("audio"))
                {
                    dream.MediaItem.path = "~/Components/MediaBank/Content/Images/100x100/audio.png";
                }
                else if (dream.MediaItem.mediaType.Equals("video"))
                {
                    dream.MediaItem.path = "~/Components/MediaBank/Content/Images/100x100/video.png";
                }
                else if (dream.MediaItem.mediaType.Equals("Image"))
                {
                    dream.MediaItem.path = "~/Components/MediaBank/Content/Images/100x100/" + dream.MediaItem.name;
                }
            }
            if (dreams != null)
            {
                dl_dream.DataSource = dreams.ToList();
                dl_dream.DataBind();
                dl_dream.Visible = true;


            }
        }
    }
    protected void cmd_dream_search_Click(object sender, EventArgs e)
    {
        string value = tb_dream_search.Text.Trim();
        if (value != null)
        {
            News news = new News();
            DreamBirdEntities db = new DreamBirdEntities();
            var Dream_ = from n in db.Dreams
                         where n.DreamName.Contains(value)
                         select n;


            if (Dream_ != null)
            {
                dl_dream.DataSource = Dream_.ToList();
                dl_dream.DataBind();
                dl_dream.Visible = true;
            }
        }
        if (EditMode.Equals("true"))
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_keys", "ActivateNewsTabEdit('#selectDream_edit');", true);
        else
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_keys", "ActivateNewsTab('#selectDream');", true);
        // MyEvents(this, EventArgs.Empty);
    }



    protected void cmd_cancel_Click(object sender, EventArgs e)
    {
        if( Cancel_Dream_Event!=null){
            Cancel_Dream_Event(this, EventArgs.Empty);
        }

    }

    protected void cmd_add_dream_Click(object sender, EventArgs e)
    {
        Dream dream = new Dream();


        foreach (RepeaterItem item in dl_dream.Items)
        {
            int id = -1;
            CheckBox chk = (CheckBox)item.FindControl("cb_is_add") as CheckBox;
            if (chk != null)
            {
                if (chk.Checked)
                {

                    Label lblID = item.FindControl("lblID") as Label;
                    id = int.Parse(lblID.Text);
                    dream.id = id;
                    dream_ids.Add(id);


                }
            }
        }
        if (Dreamids_Added_Event != null)
        {
            Dreamids_Added_Event(this, EventArgs.Empty);
        }
        if (EditMode.Equals("true"))
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_keys", "ActivateNewsTabEdit('#publishingOptions_edit');", true);
        else
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_keys", "ActivateNewsTab('#publishingOptions');", true);

    }

    public List<int> GetDreamIDS()
    {
        List<int> DreamIDS = new List<int>();
        foreach (RepeaterItem item in dl_dream.Items)
        {
            int id = -1;
            CheckBox chk = (CheckBox)item.FindControl("cb_is_add") as CheckBox;
            if (chk != null)
            {
                if (chk.Checked)
                {

                    Label lblID = item.FindControl("lblID") as Label;
                    id = int.Parse(lblID.Text);
                    DreamIDS.Add(id);
                }
            }
        }
        return DreamIDS;
    }
}