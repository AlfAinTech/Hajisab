using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewsDetail : System.Web.UI.UserControl
{
    public int news_id = -1;
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
        if (!IsPostBack) {
            Panel1.Visible = false;
            p_news_detail_admin.Visible = false;
            data_bind();
        }
       

        
    }
    private void data_bind() {
        bool is_admin = false;
        int news_id_ = -1;
        String admin= Request.QueryString["IsShowAdminControls"];
        is_admin = bool.Parse(admin.ToLower());
        news_id_ = Int32.Parse( Request.QueryString["news_detail_id"].ToString());
        if (is_admin)
        {
            p_news_detail_admin.Visible = true;
            if (news_id_!=-1)
            {
                //news_id = (int)Session["news_detail_id"];
                int id = news_id_;

                News n1 = new News();
                DreamBirdEntities news_detail_context = new DreamBirdEntities();
                n1 = (from n in news_detail_context.News
                      where (n.id == id)
                      select n).First();

                if (n1 != null)
                {

                    tb_news_title.Text = n1.news_title.Trim();
                    tb_desription.Text = n1.news_description.Trim();
                    img_detail_news_admin.ImageUrl = n1.MediaItem.Path500;
                    DateTime d_to = (DateTime)n1.to_date;
                    DateTime d_from = (DateTime)n1.to_date;
                    tb_to_date.Text = d_to.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                    tb_from_date.Text = d_to.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                    cb_is_feature.Checked = (bool)n1.is_feature_news;
                    cb_is_leatest.Checked = (bool)n1.is_latest_news;


                }
                NewsRelatedNew n2 = new NewsRelatedNew();
                DreamBirdEntities related_news_context = new DreamBirdEntities();
                var var = (from n in related_news_context.NewsRelatedNews
                           where (n.news_id == id)
                           select n).Take(4).ToList();

                if (var != null)
                {
                    List<int> related_news_ids = new List<int>();
                    foreach (NewsRelatedNew a in var)
                    {
                        int news_id = a.related_news_id;
                        related_news_ids.Add(news_id);

                    }
                    DreamBirdEntities related_news_context1 = new DreamBirdEntities();
                    var related_news = related_news_context1.News.Where(n => related_news_ids.Contains(n.id));
                    if (related_news != null)
                    {
                        dl_related_news_admin.DataSource = related_news.ToList();
                        dl_related_news_admin.DataBind();
                        dl_related_news_admin.RepeatDirection = RepeatDirection.Horizontal;
                    }
                }
            }

        }
        else {
            Panel1.Visible = true;
            if (news_id_!=-1)
            {
                //news_id = (int)Session["news_detail_id"];
                int id = news_id_;

                News n1 = new News();
                DreamBirdEntities news_detail_context = new DreamBirdEntities();
                n1 = (from n in news_detail_context.News
                      where (n.id == id)
                      select n).First();

                if (n1 != null)
                {

                    lbl_news_title.Text = n1.news_title;
                    lbl_news_description.Text = n1.news_description;
                    img_detail_news.ImageUrl = n1.MediaItem.Path500;
                    DateTime d_to =Convert.ToDateTime( n1.to_date);
                    lbl_to_date.Text = d_to.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);


                }
                NewsRelatedNew n2 = new NewsRelatedNew();
                DreamBirdEntities related_news_context = new DreamBirdEntities();
                var var = (from n in related_news_context.NewsRelatedNews
                           where (n.news_id == id)
                           select n).Take(4).ToList();

                if (var != null)
                {
                    List<int> related_news_ids = new List<int>();
                    foreach (NewsRelatedNew a in var)
                    {
                        int news_id = a.related_news_id;
                        related_news_ids.Add(news_id);

                    }
                    DreamBirdEntities related_news_context1 = new DreamBirdEntities();
                    var related_news = related_news_context1.News.Where(n => related_news_ids.Contains(n.id));
                    if (related_news != null)
                    {
                        dl_related_news.DataSource = related_news.ToList();
                        dl_related_news.DataBind();
                        dl_related_news.RepeatDirection = RepeatDirection.Horizontal;
                    }
                }
            }

        }

        
    }

    protected void lb_save_news_detail_Click(object sender, EventArgs e)
    {
        int news_id = Int32.Parse(Request.QueryString["news_detail_id"].ToString());
       
            News n1 = new News();
            DreamBirdEntities news_detail_context = new DreamBirdEntities();
            n1 = (from n in news_detail_context.News
                  where (n.id == news_id)
                  select n).First();

            if (n1 != null)
            {

            n1.news_title = tb_news_title.Text.Trim();
            n1.news_description = tb_desription.Text.Trim();
            n1.to_date = Convert.ToDateTime(tb_to_date.Text);
            n1.from_date = Convert.ToDateTime(tb_from_date.Text);
            n1.is_feature_news = cb_is_feature.Checked;
            n1.is_latest_news = cb_is_leatest.Checked;
            news_detail_context.SaveChanges();


            }
        
    }
}