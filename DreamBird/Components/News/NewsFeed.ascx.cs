using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewsFeed : CoreDreamControlAdapter
{
    private bool is_horizontal = false;
    public bool Is_horizontal_
    {
        get
        {
            return is_horizontal;
        }

        set
        {
            is_horizontal = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!IsPostBack)
        {
            //dl_news_feed.RepeatDirection = RepeatDirection.Horizontal;
            //dl_news_feed.RepeatColumns = 4;
            cb_horizontal.Visible = false;
            cb_is_featured_news.Visible = false;

        }
       
        
        if (IsShowAdminControls)
        {
            cb_horizontal.Visible = true;
            cb_is_featured_news.Visible = true;
            
            bind_on_feature_checked();
            save_admin_settings_for_newsfeed();

        }
        else {
            //bind_on_feature_checked();
            use_admin_checkbox_setting();


        } 
            
    }

    private void loadBind() {
        if (cb_is_featured_news.Checked)
        {
            databind_with_feature_news();
        }
        else
        {
            databind();
        }

    }

    override
 public void OnHideAdminEvent(object sender, EventArgs e)
    {
     //   loadBind();


    }



    private void databind()
    {
        //not show to default user
        cb_horizontal.Visible = false;
        cb_is_featured_news.Visible = false;
        if (IsShowAdminControls)
        {
            // enabale admin controls here
            cb_horizontal.Visible = true;
            cb_is_featured_news.Visible = true;
            if (cb_horizontal.Checked)
            {
                dl_news_feed.RepeatDirection = RepeatDirection.Horizontal;
                dl_news_feed.RepeatColumns = 2;
            }
            else
            {
                dl_news_feed.RepeatDirection = RepeatDirection.Vertical;
                dl_news_feed.RepeatColumns = 1;
            }

        }

        DreamBirdEntities db = new DreamBirdEntities();
        var news_ = from n in db.News
                    where (n.is_feature_news == false)
                    select n;
        if (news_ != null)
        {
            dl_news_feed.DataSource = news_.ToList();
            dl_news_feed.DataBind();


        }
    }
    private void save_admin_settings_for_newsfeed() {
        if (cb_horizontal.Checked)
        {
            //Session["is_horizantal"] = true;

            DreamBirdEntities db = new DreamBirdEntities();
            if (db.AdminsettingsNewsFeeds.Any())
            {
                AdminsettingsNewsFeed adminset = new AdminsettingsNewsFeed();

                adminset = (from adminsetting in db.AdminsettingsNewsFeeds
                            select adminsetting).First();
                adminset.is_horizontal = true;
                if (cb_is_featured_news.Checked)
                {

                    adminset.is_featured_news = true;

                }
                else
                {

                    adminset.is_featured_news = false;

                }
                db.SaveChanges();
            }
            else
            {
                AdminsettingsNewsFeed adminset = new AdminsettingsNewsFeed();
                adminset.is_horizontal = true;
                if (cb_is_featured_news.Checked)
                {

                    adminset.is_featured_news = true;

                }
                else
                {

                    adminset.is_featured_news = false;

                }
                db.AdminsettingsNewsFeeds.Add(adminset);
                db.SaveChanges();


            }


        }
        else
        {

            DreamBirdEntities db = new DreamBirdEntities();
            if (db.AdminsettingsNewsFeeds.Any())
            {
                AdminsettingsNewsFeed adminset = new AdminsettingsNewsFeed();

                adminset = (from adminsetting in db.AdminsettingsNewsFeeds
                            select adminsetting).First();
                adminset.is_horizontal = false;
                if (cb_is_featured_news.Checked)
                {

                    adminset.is_featured_news = true;

                }
                else
                {

                    adminset.is_featured_news = false;

                }
                db.SaveChanges();
            }
            else
            {
                AdminsettingsNewsFeed adminset = new AdminsettingsNewsFeed();
                adminset.is_horizontal = false;
                if (cb_is_featured_news.Checked)
                {

                    adminset.is_featured_news = true;

                }
                else
                {

                    adminset.is_featured_news = false;

                }
                db.AdminsettingsNewsFeeds.Add(adminset);
                db.SaveChanges();


            }

        }

    }
    private void use_admin_checkbox_setting() {
        //bool a = (bool)Session["is_horizantal"];
        //bool b = (bool)Session["is_feature_news"];
        ////bool a = is_horizontal;
        //if (a)
        //{
        //    dl_news_feed.RepeatDirection = RepeatDirection.Horizontal;
        //    dl_news_feed.RepeatColumns = 2;
        //}
        //else
        //{
        //    dl_news_feed.RepeatDirection = RepeatDirection.Vertical;
        //    dl_news_feed.RepeatColumns = 1;
        //}
        //if (b) {
        //    bind_feature_news();
        //} else {
        //    bind();
        //}

        DreamBirdEntities db = new DreamBirdEntities();
        if (db.AdminsettingsNewsFeeds.Any())
        {
            AdminsettingsNewsFeed adminset = new AdminsettingsNewsFeed();

            adminset = (from adminsetting in db.AdminsettingsNewsFeeds
                        select adminsetting).First();
            if (adminset != null)
            {
                bool is_horizantal = adminset.is_horizontal;
                bool is_featured = adminset.is_featured_news;

                if (is_horizantal)
                {
                    dl_news_feed.RepeatDirection = RepeatDirection.Horizontal;
                    dl_news_feed.RepeatColumns = 2;
                }
                else
                {
                    dl_news_feed.RepeatDirection = RepeatDirection.Vertical;
                    dl_news_feed.RepeatColumns = 1;
                }
                if (is_featured)
                {
                    bind_feature_news();
                }
                else
                {
                    bind();
                }
            }
        }
    }


    private void bind() {

        DreamBirdEntities db = new DreamBirdEntities();
        var news_ = from n in db.News
                    where (n.is_feature_news == false)
                    select n;
        if (news_ != null)
        {
            dl_news_feed.DataSource = news_.ToList();
            dl_news_feed.DataBind();


        }

    }
    private void bind_feature_news() {
        DreamBirdEntities db = new DreamBirdEntities();
        var news_ = from n in db.News
                    where (n.is_feature_news == true || n.is_feature_news==false)
                    select n;
        if (news_ != null)
        {
            dl_news_feed.DataSource = news_.ToList();
            dl_news_feed.DataBind();


        }
    }
    private void bind_on_feature_checked()
    {
        if (cb_is_featured_news.Checked) {
            bind_feature_news();
        } else {
            bind();
        }
    }


    private void databind_with_feature_news()
    {
       
        //not show to default user
        cb_horizontal.Visible = false;
        if (IsShowAdminControls)
        {
            // enabale admin controls here
            cb_horizontal.Visible = true;
            if (cb_horizontal.Checked)
            {
                dl_news_feed.RepeatDirection = RepeatDirection.Horizontal;
                dl_news_feed.RepeatColumns = 2;
            }
            else
            {
                dl_news_feed.RepeatDirection = RepeatDirection.Vertical;
                dl_news_feed.RepeatColumns = 1;
            }

        }
        DreamBirdEntities db = new DreamBirdEntities();
        var news_ = from n in db.News
                    where (n.is_feature_news == true)
                    select n;
        if (news_ != null)
        {
            dl_news_feed.DataSource = news_.ToList();
            dl_news_feed.DataBind();


        }
    }
    
    protected void btn_Click(object sender, EventArgs e)
    {

        LinkButton myButton = sender as LinkButton;
        if (myButton != null)
        {
            //Label lblID = item.FindControl("lblID") as Label;
            //int id = int.Parse(lblID.Text);


        }

    }

    protected void cb_horizontal_CheckedChanged(object sender, EventArgs e)
    {
        if (cb_horizontal.Checked)
        {
           
            dl_news_feed.RepeatDirection = RepeatDirection.Horizontal;
            dl_news_feed.RepeatColumns = 2;
            bind_on_feature_checked();



        }
        else
        {
            dl_news_feed.RepeatDirection = RepeatDirection.Vertical;
            dl_news_feed.RepeatColumns = 1;
            bind_on_feature_checked();


        }
    }

    protected void dl_news_feed_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("id"))
        {
            int Id = Convert.ToInt32(dl_news_feed.DataKeys[e.Item.ItemIndex].ToString());
            //ModalPopupExtender_for_news_detail.Show();
            //Session["news_detail_id"] = Id;
            //Response.Redirect("../../News_Details.aspx");
            Response.Redirect("../../News_Details.aspx?IsShowAdminControls=" + IsShowAdminControls + "&news_detail_id=" + Id);


        }
    }

    protected void cb_is_featured_news_CheckedChanged(object sender, EventArgs e)
    {
        bind_on_feature_checked();

    }
}