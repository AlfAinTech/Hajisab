using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_MainNews : CoreDreamControlAdapter
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            dl_featured_news.Visible = false;
            cmdsave.Visible = false;
        }
        
        if (!IsPostBack) {

            databind();
            databind_for_feature_news();
        }
        if (IsShowAdminControls) {

            dl_featured_news.Visible = true;
            cmdsave.Visible = true;

        }

    }
    private void databind()
    {
        News main_news = new News();
        DreamBirdEntities featured_news_context = new DreamBirdEntities();
      List<News> news = (from n in featured_news_context.News
                     where (n.is_main_news == true)
                     select n).ToList();

        if(news.Count != 0)
        {
            main_news = (from n in featured_news_context.News
                         where (n.is_main_news == true)
                         select n).First();
            lbl_defult_news_title.Text = main_news.news_title;
            DateTime d_to = (DateTime)main_news.to_date;
            lbl_to_date_default.Text = d_to.ToString("M", CultureInfo.InvariantCulture);
            lbl_lbl_defult_news_title_description.Text = main_news.news_description;
            main_img_default.ImageUrl = main_news.MediaItem.Path500;
            lblID_default.Text = main_news.id.ToString();
            //lbl_to_date.Text =(string) n1.to_date;
        }

        NewsRelatedNew n2 = new NewsRelatedNew();
        DreamBirdEntities related_news_context = new DreamBirdEntities();
        var var = (from n in related_news_context.NewsRelatedNews
                   where (n.news_id == main_news.id)
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
                dl_related_news_for_default.DataSource = related_news.ToList();
                dl_related_news_for_default.DataBind();
                dl_related_news_for_default.RepeatDirection = RepeatDirection.Vertical;
            }

            //DreamBirdEntities featured_news_context1 = new DreamBirdEntities();
            //var featured_news = (from n in featured_news_context1.News
            //                     where (n.is_feature_news == true)
            //                     select n).OrderByDescending(n => n.created_date).Take(4);
            //if (featured_news != null)
            //{
            //    dl_featured_news_for_default.DataSource = featured_news.ToList();
            //    dl_featured_news_for_default.DataBind();
            //    dl_featured_news_for_default.RepeatDirection = RepeatDirection.Horizontal;
            //}

        }
    }
    private void databind_with_news_id(int id)
    {
        News main_news = new News();
        DreamBirdEntities featured_news_context = new DreamBirdEntities();
        main_news = (from n in featured_news_context.News
                     where (n.id == id)
                     select n).First();

        if (main_news != null)
        {
            lbl_defult_news_title.Text = main_news.news_title;
            DateTime d_to = (DateTime)main_news.to_date;
            lbl_to_date_default.Text = d_to.ToString("M", CultureInfo.InvariantCulture);
            lbl_lbl_defult_news_title_description.Text = main_news.news_description;
            if (main_news.MediaItem.Path500 != null)
            {
                main_img_default.ImageUrl = main_news.MediaItem.Path500;
            }
            lblID_default.Text = main_news.id.ToString();
            //lbl_to_date.Text =(string) n1.to_date;
        }

        NewsRelatedNew n2 = new NewsRelatedNew();
        DreamBirdEntities related_news_context = new DreamBirdEntities();
        var var = (from n in related_news_context.NewsRelatedNews
                   where (n.news_id == main_news.id)
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
                dl_related_news_for_default.DataSource = related_news.ToList();
                dl_related_news_for_default.DataBind();
                dl_related_news_for_default.RepeatDirection = RepeatDirection.Vertical;
            }

            //DreamBirdEntities featured_news_context1 = new DreamBirdEntities();
            //var featured_news = (from n in featured_news_context1.News
            //                     where (n.is_feature_news == true)
            //                     select n).OrderByDescending(n => n.created_date).Take(4);
            //if (featured_news != null)
            //{
            //    dl_featured_news_for_default.DataSource = featured_news.ToList();
            //    dl_featured_news_for_default.DataBind();
            //    dl_featured_news_for_default.RepeatDirection = RepeatDirection.Horizontal;
            //}

        }
    }

    private void databind_for_feature_news() {
        DreamBirdEntities featured_news_context1 = new DreamBirdEntities();
        var featured_news = (from n in featured_news_context1.News
                             where (n.is_feature_news == true)
                             select n).OrderByDescending(n => n.created_date).Take(4);
        if (featured_news != null)
        {
            if (!IsShowAdminControls)
            {
                dl_featured_news_for_default.DataSource = featured_news.ToList();
                dl_featured_news_for_default.DataBind();
                dl_featured_news_for_default.RepeatDirection = RepeatDirection.Horizontal;
            }
            else {
                dl_featured_news.DataSource = featured_news.ToList();
                dl_featured_news.DataBind();
                dl_featured_news.RepeatDirection = RepeatDirection.Horizontal;

            }
        }

    }

    protected void lb_news_detail_default_Click(object sender, EventArgs e)
    {
        if(lblID_default.Text != "")
        {
            int Id = Convert.ToInt32(lblID_default.Text);
        
        Response.Redirect("../../News_Details.aspx?IsShowAdminControls=" + IsShowAdminControls + "&news_detail_id=" + Id);
        }
        
    }

    protected void dl_related_news_for_default_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int Id = Convert.ToInt32(dl_related_news_for_default.DataKeys[e.Item.ItemIndex].ToString());
        
        Response.Redirect("../../News_Details.aspx?IsShowAdminControls=" + IsShowAdminControls + "&news_detail_id=" + Id);
    }
    //featurenews itemCommand
    protected void dl_featured_news_for_default_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("id"))
        {
            int Id = Convert.ToInt32(dl_featured_news_for_default.DataKeys[e.Item.ItemIndex].ToString());

            databind_with_news_id(Id);
        } else if (e.CommandName.Equals("img_click")){

            int Id = Convert.ToInt32(dl_featured_news_for_default.DataKeys[e.Item.ItemIndex].ToString());

            databind_with_news_id(Id);
        }

    }

    protected void cmdEdit_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in dl_featured_news.Items)
        {

            CheckBox chk = (CheckBox)item.FindControl("cb_featured_news") as CheckBox;
            CheckBox chk1 = (CheckBox)item.FindControl("cb_is_main") as CheckBox;
            if (chk != null && chk1 != null)
            {
                Label id = (Label)item.FindControl("lblID") as Label;
                int int_id = Int32.Parse(id.Text.ToString());
                //chaging feature status
                if (chk.Checked)
                {

                }
                else
                {

                    if (id != null)
                    {
                        News news = new News();
                        DreamBirdEntities featured_news_context = new DreamBirdEntities();
                        news = (from n in featured_news_context.News
                                where (n.id == int_id)
                                select n).First();
                        news.is_feature_news = false;
                        featured_news_context.SaveChanges();
                    }
                }

                if (chk1.Checked)
                {

                    if (id != null)
                    {
                        // making all news is_main false first
                        DreamBirdEntities featured_news_context = new DreamBirdEntities();
                        News currently_main = new News();
                        foreach (var news in featured_news_context.News.Where(n => n.id != int_id).ToList())
                        {
                            news.is_main_news = false;

                        }
                        // making currently main news
                        currently_main = (from n in featured_news_context.News
                                          where (n.id == int_id)
                                          select n).First();
                        currently_main.is_main_news = true;
                        featured_news_context.SaveChanges();

                    }

                }
                else
                { }

            }
        }
        databind();
        databind_for_feature_news();
    }

    protected void dl_featured_news_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("id"))
        {
            int Id = Convert.ToInt32(dl_featured_news.DataKeys[e.Item.ItemIndex].ToString());

            databind_with_news_id(Id);
        }
    }
}