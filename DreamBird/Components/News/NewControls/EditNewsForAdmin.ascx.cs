using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewControls_EditNewsForAdmin : CoreDreamControlAdapter
{
    public event EventHandler SaveNews;
    List<int> dream_ids = new List<int>();
    List<int> related_news_ids = new List<int>();
    public int news_id = 0;
    public int News_id_
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
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void ClearControl()
    {
        tb_news_title.Text = "";
        tb_news_description.Text = "";
        tb_news_from_date.Text = "";
        tb_news_to_date.Text = "";
        img_id.Text = "";
        img_News.ImageUrl = "";
        cb_is_latest_news.Checked = false;
        cb_is_featured_news.Checked = false;
        AddNewsRelatedNews.ClearControl();
        AddNewsDream.ClearControl();
        HF1.Value = "";
    }

    override
    public void BindData2(int news_id)
    {
        if (news_id != 0)
        {
            HF1.Value = news_id.ToString();
            DreamBirdEntities db = new DreamBirdEntities();
            var news = db.News.Where(w => w.id == news_id).First();
            tb_news_title.Text = news.news_title.Trim();
            tb_news_description.Text = news.news_description.Trim();
            MediaBankControl.setMediaItem(news.MediaItem.id);
            img_News.ImageUrl = news.MediaItem.Path500;
            DateTime d_to = (DateTime)news.to_date;
            DateTime d_from = (DateTime)news.from_date;
            tb_news_to_date.Text = d_to.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            tb_news_from_date.Text = d_from.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            cb_is_featured_news.Checked = (bool)news.is_feature_news;
            cb_is_latest_news.Checked = (bool)news.is_latest_news;
            //ListItem li = ddl_category.Items.FindByValue(news.category.ToString());
            ddl_category.SelectedIndex = ddl_category.Items.IndexOf(ddl_category.Items.FindByValue(news.Category));
            ddl_category.DataBind();
            AddNewsRelatedNews.BindData2(news_id);
            AddNewsDream.BindData2(news_id);
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db;
        db = new DreamBirdEntities();
        
        News news;
        int id = 0;
        if(HF1.Value.Equals(""))
        {
            news = new News();
        }
        else
        {
            id = Convert.ToInt32(HF1.Value);
            news = db.News.Where(w => w.id == id).First();
        }
        news.news_title = tb_news_title.Text.ToString();
        news.news_description = tb_news_description.Text.ToString();
        string to_dateString = tb_news_to_date.Text.ToString();
        DateTime to_Date = Convert.ToDateTime(to_dateString.ToString());
        news.to_date = to_Date;
        string from_dateString = tb_news_from_date.Text.ToString();
        DateTime from_Date = Convert.ToDateTime(from_dateString.ToString());
        news.from_date = from_Date;
        news.is_feature_news = cb_is_featured_news.Checked;
        news.is_latest_news = cb_is_latest_news.Checked;
        news.is_main_news = false;
        news.MediaItem_id = (int)ViewState["selectedImageID_For_News"];
        news.created_date = DateTime.Today;
        news.Category = ddl_category.SelectedValue;
        if (HF1.Value.Equals(""))
        {
            db.News.Add(news);
        }
        db.SaveChanges();
        dream_ids = AddNewsDream.GetDreamIDS();
        if (dream_ids != null)
        {
            NewsDreamNew news_dream = new NewsDreamNew();
            foreach (var item in dream_ids)
            {
                news_dream.news_id = news.id;
                news_dream.dream_id = item;
                DreamBirdEntities db1;
                db1 = new DreamBirdEntities();
                db1.NewsDreamNews.Add(news_dream);
                db1.SaveChanges();
            }
        }
        related_news_ids = AddNewsRelatedNews.getIDs();
        if (related_news_ids != null)
        {
            NewsRelatedNew news_related_news = new NewsRelatedNew();
            foreach (var item in related_news_ids)
            {
                news_related_news.news_id = news.id;
                news_related_news.related_news_id = item;
                DreamBirdEntities db_context_related_news;
                db_context_related_news = new DreamBirdEntities();
                db_context_related_news.NewsRelatedNews.Add(news_related_news);
                db_context_related_news.SaveChanges();
            }


        }

        Response.Redirect("~/Admin/News");
    }

    protected void MediaBankControl_MediaSelectedEvent(object sender, EventArgs e)
    {
        MediaItem media_item;
        media_item = MediaBankControl.SelectedMediaItem;

        //img_News.ImageUrl = media_item.path;
        img_News.ImageUrl = media_item.PathWithResolution;
        img_id.Text = img_News.ID;
        //dreamImg_id.Text = media_item.id.ToString();
        ViewState["selectedImageID_For_News"] = media_item.id;
        // ModalPopupExtender_for_MediaBankControl.Show();
    }

    protected void MediaBankControl_MyEvents(object sender, EventArgs e)
    {
        ModalPopupExtender_for_MediaBankControl.Show();
    }

    protected void AddNewsRelatedNews_AddPreSelectedNews(object sender, EventArgs e)
    {
        EventArgRelatedNews evt = (EventArgRelatedNews)e;
        ViewState["related_news_ids"] = evt.RelatedNewsId;
    }
}