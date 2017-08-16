using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_AddNews : CoreDreamControlAdapter
{
    public event EventHandler MyEvents;
    List<int> dream_ids = new List<int>();
    List<int> related_news_ids = new List<int>();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (IsShowAdminControls) {
            if (!IsPostBack)
            {
                dream_ids = null;
                related_news_ids = null;
            }
        }
        
    }
    protected void cmd_save_news_Click(object sender, EventArgs e)
    {

        if (ViewState["selectedImageID_For_News"] == null)
        {

            News news = new News();
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
            news.created_date = DateTime.Today;
            news.Category = ddl_category.SelectedItem.Value;
            DreamBirdEntities db;
            db = new DreamBirdEntities();
            db.News.Add(news);
            db.SaveChanges();
            int id = news.id;
            dream_ids = (List<int>)ViewState["dream_ids"];
            if (dream_ids != null)
            {
                NewsDreamNew news_dream = new NewsDreamNew();
                foreach (var item in dream_ids)
                {
                    news_dream.news_id = id;
                    news_dream.dream_id = item;
                    DreamBirdEntities db1;
                    db1 = new DreamBirdEntities();
                    db1.NewsDreamNews.Add(news_dream);
                    db1.SaveChanges();
                }
            }
            related_news_ids = (List<int>)ViewState["related_news_ids"];
            if (related_news_ids != null)
            {
                NewsRelatedNew news_related_news = new NewsRelatedNew();
                foreach (var item in related_news_ids)
                {
                    news_related_news.news_id = id;
                    news_related_news.related_news_id = item;
                    DreamBirdEntities db_context_related_news;
                    db_context_related_news = new DreamBirdEntities();
                    db_context_related_news.NewsRelatedNews.Add(news_related_news);
                    db_context_related_news.SaveChanges();
                }
            }
        }
        else
        {
            News news = new News();
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
            DreamBirdEntities db;
            db = new DreamBirdEntities();
            db.News.Add(news);
            db.SaveChanges();
            int id = news.id;
            dream_ids = (List<int>)ViewState["dream_ids"];
            if (dream_ids != null)
            {
                NewsDreamNew news_dream = new NewsDreamNew();
                foreach (var item in dream_ids)
                {
                    news_dream.news_id = id;
                    news_dream.dream_id = item;
                    DreamBirdEntities db1;
                    db1 = new DreamBirdEntities();
                    db1.NewsDreamNews.Add(news_dream);
                    db1.SaveChanges();
                }
            }
            related_news_ids = (List<int>)ViewState["related_news_ids"];
            if (related_news_ids != null)
            {
                NewsRelatedNew news_related_news = new NewsRelatedNew();
                foreach (var item in related_news_ids)
                {
                    news_related_news.news_id = id;
                    news_related_news.related_news_id = item;
                    DreamBirdEntities db_context_related_news;
                    db_context_related_news = new DreamBirdEntities();
                    db_context_related_news.NewsRelatedNews.Add(news_related_news);
                    db_context_related_news.SaveChanges();
                }
            }

        }
        Response.Redirect(Request.RawUrl);
        //MyEvents(this, EventArgs.Empty);
        //ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_keys", "ActivateNewsTab('#relatedNews');", true);
        //ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_keys", "ActivateTabButtons();", true);

    }

    protected void lb_related_news_Click(object sender, EventArgs e)
    {
        //wuc_related_news_for_current_news.Visible = true;
       // ModalPopupExtender_for_related_news.Show();
        //if (MyEvents != null)
        //{
        //    MyEvents(this, EventArgs.Empty);
        //}
    }

    protected void lb_add_to_dream_Click(object sender, EventArgs e)
    {
       // ModalPopupExtender_for_dream.Show();
    }
    protected void wuc_related_news_for_current_news_MyEvents(object sender, EventArgs e)
    {
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
       // ModalPopupExtender_for_related_news.Show();



    }
    protected void MyEvents_for_cancel_hundler(object sender, EventArgs e)
    {
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }




    }
    

     protected void Cancel_Dream_Event_hundler(object sender, EventArgs e)
    {
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }




    }
    protected void p_popup_add_dream_news_panel_MyEvents(object sender, EventArgs e)
    {
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }

     //   ModalPopupExtender_for_dream.Show();

    }

    protected void Dreamids_Added_Event_hundler(object sender, EventArgs e)
    {
        if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }

        dream_ids = AddNewsDream.Dream_ids_;
        ViewState["dream_ids"] = dream_ids;


    }

    protected void Related_news_ids_Added_Event_hundler(object sender, EventArgs e)
    {
       if (MyEvents != null)
        {
            MyEvents(this, EventArgs.Empty);
        }
 
        related_news_ids = AddNewsRelatedNews.Related_news_ids_;
        ViewState["related_news_ids"] = related_news_ids;


    }



    protected void MediaBankControl1_MediaSelected(object sender, EventArgs e)
    {
        //if (MyEvents != null)
        //{
        //    MyEvents(this, EventArgs.Empty);
        //}

        MediaItem media_item;
        media_item = new MediaItem();

        //img_News.ImageUrl = media_item.path;
        img_News.ImageUrl = media_item.PathWithResolution;
        img_id.Text = img_News.ID;
        //dreamImg_id.Text = media_item.id.ToString();
        ViewState["selectedImageID_For_News"] = media_item.id;
        //ModalPopupExtender1.Show();
    }
    protected void MediaBankControl1_MyEvents(object sender, EventArgs e)
    {
        
        ModalPopupExtender1.Show();
        //if (MyEvents != null)
        //{
        //    MyEvents(this, EventArgs.Empty);
        //}
    }


    //protected void MyEventsForClose_hundler(object sender, EventArgs e)
    //{
    //    if (MyEvents != null)
    //    {
    //        MyEvents(this, EventArgs.Empty);
    //    }




    //}


    protected void cancel_btn_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}