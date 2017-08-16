using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_FeatureNewsHome : CoreDreamControlAdapter
{
 
   protected void Page_Load(object sender, EventArgs e)
    {
        ErrorMessage.Visible = false;
        if (!IsPostBack)
        {
            p_main_news.Visible = false;
            panal_for_default.Visible = false;
            p_for_admin.Visible = false;
            cmd_add_news.Visible = false;
            p_add_news.Visible = false;
            p_search_news.Visible = false;
            p_for_news_feed.Visible = false;
            p_for_news_feed_admin.Visible = false;
            cmdEdit.Visible = false;
        }

        if (IsShowAdminControls)
        {
            //show_checkbox_for_user();

            cmdEdit.Visible = false;
            p_for_admin.Visible = true;
            cmd_add_news.Visible = true;
            p_for_news_feed_admin.Visible = true;
            databind();
        }
        else {

            //hide_checkbox_for_user();
            panal_for_default.Visible = false;
            p_main_news.Visible = true;
            p_for_news_feed.Visible = true;
            databind_for_default();
        }

       

    }


    private void databind() {
        //News main_news = new News();
        //DreamBirdEntities featured_news_context = new DreamBirdEntities();
        //main_news = (from n in featured_news_context.News
        //             where (n.is_main_news == true)
        //             select n).First();

        //if (main_news != null)
        //{
        //    lbl_title.Text = main_news.news_title;
        //    DateTime d_to = (DateTime)main_news.to_date;
        //    lbl_to_date_admin.Text = d_to.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
        //    lbl_description.Text = main_news.news_description;
        //    main_img_admin.ImageUrl = main_news.MediaItem.Path500;
        //    lbl_id_admin.Text = main_news.id.ToString();
        //    //lbl_to_date.Text =(string) n1.to_date;
        //}

        //NewsRelatedNew n2 = new NewsRelatedNew();
        //DreamBirdEntities related_news_context = new DreamBirdEntities();
        //var var = (from n in related_news_context.NewsRelatedNews
        //           where (n.news_id == main_news.id)
        //           select n).ToList();

        //if (var != null)
        //{
        //    List<int> related_news_ids = new List<int>();
        //    foreach (NewsRelatedNew a in var)
        //    {
        //        int news_id = a.related_news_id;
        //        related_news_ids.Add(news_id);

        //    }
        //    DreamBirdEntities related_news_context1 = new DreamBirdEntities();
        //    var related_news = related_news_context1.News.Where(n => related_news_ids.Contains(n.id));
        //    if (related_news != null)
        //    {
        //        dl_related_news.DataSource = related_news.ToList();
        //        dl_related_news.DataBind();
        //        dl_related_news.RepeatDirection = RepeatDirection.Vertical;
        //    }

        //    DreamBirdEntities featured_news_context1 = new DreamBirdEntities();
        //    var featured_news = (from n in featured_news_context1.News
        //                         where (n.is_feature_news == true)
        //                         select n).OrderByDescending(n => n.created_date).Take(4);
        //    if (featured_news != null)
        //    {
        //        dl_featured_news.DataSource = featured_news.ToList();
        //        dl_featured_news.DataBind();
        //        dl_featured_news.RepeatDirection = RepeatDirection.Horizontal;
        //    }

        //}
    }


    private void databind_for_default()
    {
        News main_news = new News();
        DreamBirdEntities featured_news_context = new DreamBirdEntities();
        List<News> news = (from n in featured_news_context.News
                     where (n.is_main_news == true)
                     select n).ToList();

        if (news.Count != 0)
        {
            main_news = news.First();
            lbl_defult_news_title.Text = main_news.news_title;
            DateTime d_to = (DateTime)main_news.to_date;
            lbl_to_date_default.Text= d_to.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            lbl_lbl_defult_news_title_description.Text = main_news.news_description;
            main_img_default.ImageUrl = main_news.MediaItem.Path500;
            lblID_default.Text = main_news.id.ToString();
            //lbl_to_date.Text =(string) n1.to_date;
        }

        NewsRelatedNew n2 = new NewsRelatedNew();
        DreamBirdEntities related_news_context = new DreamBirdEntities();
        var var = (from n in related_news_context.NewsRelatedNews
                   where (n.news_id == main_news.id)
                   select n).ToList();

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

            DreamBirdEntities featured_news_context1 = new DreamBirdEntities();
            var featured_news = (from n in featured_news_context1.News
                                 where (n.is_feature_news == true)
                                 select n).OrderByDescending(n => n.created_date).Take(4);
            if (featured_news != null)
            {
                dl_featured_news_for_default.DataSource = featured_news.ToList();
                dl_featured_news_for_default.DataBind();
                dl_featured_news_for_default.RepeatDirection = RepeatDirection.Horizontal;
            }

        }
    }

//Not in use right now
    //private void hide_checkbox_for_user() {
    //    foreach (DataListItem item in dl_featured_news.Items)
    //    {

    //        CheckBox chk = (CheckBox)item.FindControl("cb_featured_news") as CheckBox;
    //        CheckBox chk1 = (CheckBox)item.FindControl("cb_is_main") as CheckBox;
    //        if (chk != null && chk1 != null)
    //        {

    //            chk.Visible = false;
    //            chk1.Visible = false;


    //        }
   
    //    }
    //    //databind();

    //}
    //private void show_checkbox_for_user()
    //{
    //    foreach (DataListItem item in dl_featured_news.Items)
    //    {

    //        CheckBox chk = (CheckBox)item.FindControl("cb_featured_news") as CheckBox;
    //        CheckBox chk1 = (CheckBox)item.FindControl("cb_is_main") as CheckBox;
    //        if (chk != null && chk1 != null)
    //        {

    //            chk.Visible = true;
    //            chk1.Visible = true;


    //        }

    //    }
    //    //databind();
    //}




    protected void cmdEdit_Click(object sender, EventArgs e)
    {
        //foreach (DataListItem item in dl_featured_news.Items)
        //{

        //    CheckBox chk = (CheckBox)item.FindControl("cb_featured_news") as CheckBox;
        //    CheckBox chk1 = (CheckBox)item.FindControl("cb_is_main") as CheckBox;
        //    if (chk != null && chk1 != null)
        //    {
        //        Label id = (Label)item.FindControl("lblID") as Label;
        //        int int_id = Int32.Parse(id.Text.ToString());
        //        //chaging feature status
        //        if (chk.Checked)
        //        {

        //        }
        //        else
        //        {

        //            if (id != null)
        //            {
        //                News news = new News();
        //                DreamBirdEntities featured_news_context = new DreamBirdEntities();
        //                news = (from n in featured_news_context.News
        //                        where (n.id == int_id)
        //                        select n).First();
        //                news.is_feature_news = false;
        //                featured_news_context.SaveChanges();
        //            }
        //        }

        //        if (chk1.Checked)
        //         {

        //                if (id != null)
        //                {
        //                    // making all news is_main false first
        //                    DreamBirdEntities featured_news_context = new DreamBirdEntities();
        //                    News currently_main = new News();
        //                    foreach (var news in featured_news_context.News.Where(n => n.id != int_id).ToList())
        //                    {
        //                        news.is_main_news = false;

        //                    }
        //                    // making currently main news
        //                    currently_main = (from n in featured_news_context.News
        //                                      where (n.id == int_id)
        //                                      select n).First();
        //                    currently_main.is_main_news = true;
        //                    featured_news_context.SaveChanges();

        //                }

        //            }
        //            else
        //            { }


                

               


        //    }
            

        //}
        //databind();
    }

    protected void dl_related_news_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //if (e.CommandName.Equals("id")) {
        //    int Id = Convert.ToInt32(dl_related_news.DataKeys[e.Item.ItemIndex].ToString());

        //    //Session["news_detail_id"] = Id;
        //    //Response.Redirect("../../News_Details.aspx");
        //    Response.Redirect("../../News_Details.aspx?IsShowAdminControls=" + IsShowAdminControls + "&news_detail_id=" + Id);

        //}
    }

    protected void dl_related_news_for_default_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("id"))
        {
            int Id = Convert.ToInt32(dl_related_news_for_default.DataKeys[e.Item.ItemIndex].ToString());
            //Session["news_detail_id"] = Id;
            //Response.Redirect("../../News_Details.aspx");
            Response.Redirect("../../News_Details.aspx?IsShowAdminControls=" + IsShowAdminControls + "&news_detail_id=" + Id);

        }

    }

    protected void dl_featured_news_for_default_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("id"))
        {
            int Id = Convert.ToInt32(dl_featured_news_for_default.DataKeys[e.Item.ItemIndex].ToString());
            //Session["news_detail_id"] = Id;
            //Response.Redirect("../../News_Details.aspx");
            Response.Redirect("../../News_Details.aspx?IsShowAdminControls=" + IsShowAdminControls + "&news_detail_id=" + Id);

        }
    }

    protected void dl_featured_news_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //if (e.CommandName.Equals("id"))
        //{
        //    int Id = Convert.ToInt32(dl_featured_news.DataKeys[e.Item.ItemIndex].ToString());
        //    //Session["news_detail_id"] = Id;
        //    //Response.Redirect("../../News_Details.aspx");
        //    Response.Redirect("../../News_Details.aspx?IsShowAdminControls=" + IsShowAdminControls + "&news_detail_id=" + Id);

        //}
    }

    protected void lb_news_detail_default_Click(object sender, EventArgs e)
    {
        int Id = Convert.ToInt32(lblID_default.Text);
        //Session["news_detail_id"] = Id;
        //ViewState["news_detail_id"] = Id;
        //Response.Redirect("../../News_Details.aspx");
        Response.Redirect("../../News_Details.aspx?IsShowAdminControls=" + IsShowAdminControls + "&news_detail_id=" + Id);

    }

    protected void lb_news_detail_for_admin_Click(object sender, EventArgs e)
    {
        //int Id = Convert.ToInt32(lbl_id_admin.Text);
        ////Session["news_detail_id"] = Id;
       
      
        //Response.Redirect("../../News_Details.aspx?IsShowAdminControls=" + IsShowAdminControls + "&news_detail_id="+ Id);
        
    }

    protected void cmd_add_news_Click(object sender, EventArgs e)
    {
        //Response.Redirect("Components/News/AddNews.aspx");
        if (IsShowAdminControls) {
            p_add_news.Visible = true;
            p_for_admin.Visible = false;
            p_for_news_feed_admin.Visible = false;
            p_main_news.Visible=false;

            
        }
    }

    protected void OnMyEvents_hundler(object sender, EventArgs e)
    {
        if (IsShowAdminControls)
        {
            p_add_news.Visible = true;
            p_for_admin.Visible = false;
            p_for_news_feed_admin.Visible = false;


        }



    }

    protected void cmd_search_news_Click(object sender, EventArgs e)
    {
        string value = tb_search_news.Text.Trim();
        if ( value!="" ) {
           Boolean visible =  data_bind_search_news(value);
           if (visible) { 
            panal_for_default.Visible = false;
            p_for_admin.Visible = false;
            cmd_add_news.Visible = false;
            p_add_news.Visible = false;
            cmdEdit.Visible = false;
            p_main_news.Visible = false;
            p_for_news_feed.Visible = false;
            p_for_news_feed_admin.Visible = false;

            
            dl_search_news.Visible = true;
            dl_search_news.RepeatDirection = RepeatDirection.Vertical;
            dl_search_news.RepeatColumns = 1;
            // making searched news visible...
            p_search_news.Visible = true;

        }
           else
            {
                ShowError("No Items match your search");
            }
        }

    }

    private Boolean data_bind_search_news(string value)
    {

        News news = new News();
        DreamBirdEntities db = new DreamBirdEntities();
        var news_ = from n in db.News
                    where n.news_title.Contains(value)
                    select n;
       

        if (news_.Count() != 0)
        {
            dl_search_news.DataSource = news_.ToList();
            dl_search_news.DataBind();
            return true;


        }
        else
        {
            return false;
        }
    }

    protected void dl_search_news_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("id"))
        {
            int Id = Convert.ToInt32(dl_search_news.DataKeys[e.Item.ItemIndex].ToString());
            //Session["news_detail_id"] = Id;
            //Response.Redirect("../../News_Details.aspx");
            Response.Redirect("../../News_Details.aspx?IsShowAdminControls=" + IsShowAdminControls + "&news_detail_id=" + Id);

        }
    }
    public void ShowError(String errorMsg)
    {
        ErrorMessage.Text = errorMsg;
        ErrorMessage.Visible = true;
        
    }
}
    
   
