using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_AddNewsRelatedNews : CoreDreamControlAdapter
{
    public event EventHandler MyEvents_for_related_news;
    public event EventHandler MyEvents_for_cancel;
    public event EventHandler Related_news_ids_Added_Event;
    public event EventHandler AddPreSelectedNews;
    List<int> related_news_ids = new List<int>();
    private int news_id = 0;
    public int news_id_
    {
        get
        {
            return news_id;
        }
        set
        {
            news_id = value;
        }
    }

    public List<int> Related_news_ids_
    {
        get { return this.related_news_ids; }
        set { this.related_news_ids = value; }
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
        var news = db.News.ToList();
        if (news != null)
        {
            dl_related_news.DataSource = news;
            dl_related_news.DataBind();
            dl_related_news.Visible = true;
            var news_ids = db.NewsRelatedNews.Where(w => w.news_id == id).Select(s => s.related_news_id).ToList();
            foreach (RepeaterItem ri in dl_related_news.Items)
            {
                Label lblID = ri.FindControl("lblID") as Label;
                foreach (int ids in news_ids)
                {
                    if (lblID.Text == ids.ToString())
                    {
                        CheckBox chk = (CheckBox)ri.FindControl("cb_is_add_related_news") as CheckBox;
                        chk.Checked = true;
                    }
                }
            }
            if (AddPreSelectedNews != null)
            {
                EventArgRelatedNews evt = new EventArgRelatedNews();
                evt.RelatedNewsId = news_ids;
                AddPreSelectedNews(this, evt);
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            DreamBirdEntities db = new DreamBirdEntities();
            var news_ = from n in db.News
                        select n;
            if (news_ != null)
            {
                dl_related_news.DataSource = news_.ToList();
                dl_related_news.DataBind();
                dl_related_news.Visible = true;
            }
        }
    }
    protected void cmd_related_news_search_Click(object sender, EventArgs e)
    {

        //dl_related_news.Visible = false;
        string value = tb_related_news_search.Text.Trim();
        if (value != null)
        {
            News news = new News();
            DreamBirdEntities db = new DreamBirdEntities();
            var news_ = from n in db.News
                        where n.news_title.Contains(value)
                        select n;


            if (news != null)
            {
                dl_related_news.DataSource = news_.ToList();
                dl_related_news.DataBind();
                dl_related_news.Visible = true;
            }
        }
        if (MyEvents_for_related_news != null)
        {
            MyEvents_for_related_news(this, EventArgs.Empty);
        }
        if (EditMode.Equals("true"))
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_keys", "ActivateNewsTabEdit('#relatedNews_edit');", true);
        else
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_keys", "ActivateNewsTab('#relatedNews');", true);
    }

    protected void cmd_cancel_Click(object sender, EventArgs e)
    {
        if (MyEvents_for_cancel != null)
        {
            MyEvents_for_cancel(this, EventArgs.Empty);
        }
    }

    public void ClearControl()
    {
        foreach (RepeaterItem item in dl_related_news.Items)
        {
            CheckBox chk = (CheckBox)item.FindControl("cb_is_add_related_news") as CheckBox;
            if (chk != null)
            {
                chk.Checked = false;
            }
        }
    }


    protected void cmd_add_related_news_Click(object sender, EventArgs e)
    {

        News news = new News();


        foreach (RepeaterItem item in dl_related_news.Items)
        {
            int id = -1;
            CheckBox chk = (CheckBox)item.FindControl("cb_is_add_related_news") as CheckBox;
            if (chk != null)
            {
                if (chk.Checked)
                {

                    Label lblID = item.FindControl("lblID") as Label;
                    id = int.Parse(lblID.Text);
                    news.id = id;
                    related_news_ids.Add(id);


                }
            }
        }
        if (Related_news_ids_Added_Event != null)
        {
            Related_news_ids_Added_Event(this, EventArgs.Empty);
        }
        if (EditMode.Equals("true"))
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_keys", "ActivateNewsTabEdit('#selectDream_edit');", true);
        else
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_keys", "ActivateNewsTab('#selectDream');", true);

    }

    public List<int> getIDs()
    {
        List<int> news_ids = new List<int>();
        foreach (RepeaterItem item in dl_related_news.Items)
        {
            int id = -1;
            CheckBox chk = (CheckBox)item.FindControl("cb_is_add_related_news") as CheckBox;
            if (chk != null)
            {
                if (chk.Checked)
                {

                    Label lblID = item.FindControl("lblID") as Label;
                    id = int.Parse(lblID.Text);
                   
                    news_ids.Add(id);


                }
            }
        }
        return news_ids;
    }

}