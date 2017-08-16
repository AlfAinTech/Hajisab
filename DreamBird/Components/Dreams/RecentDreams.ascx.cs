using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_RecentDreams : System.Web.UI.UserControl,ICoreDreamControl
{

    public event EventHandler dreamLiked;



    protected void Page_Load(object sender, EventArgs e)
    {

       // HttpCookie k =  Request.Cookies["recentDream"];
       


        if (!Page.IsPostBack)
        {
            //Request.Cookies.Remove("recentDream");
            //Request.Cookies.Remove("recentDream");
            BindData();
        }


    }

    public void BindData()
    {
      
        
        if (Request.Cookies["recentDream"] != null)
        {
            List<string> dream_list = new List<string>();
            if (Request.Cookies["recentDream"].Value != null) { dream_list = Request.Cookies["recentDream"].Value.Split(',').Select(x => Convert.ToString(x)).ToList(); }
            
            
            DreamBirdEntities db = new DreamBirdEntities();

            String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            var d = db.Dreams.Where(q => dream_list.Contains(q.id.ToString())).ToList();
            if (d.Count() != 0)
            {

                related_dreams.DataSource = d;

                related_dreams.DataBind();
            }



        }
    }



    public void BindData1(int dreamID)
    {
        DreamBirdEntities db = new DreamBirdEntities();

        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id
        var d = db.Dreams.Where(q => q.id == dreamID).ToList();
        if (d.Count() != 0)
        {
            Dream dd = d[0];
            List<int> tags = db.DreamTags.Where(q => q.Dream_id == dd.id).Select(q => q.Tag_id.Value).ToList();
            List<int> related_dreams_list = db.DreamTags.Where(q => tags.Contains(q.Tag_id.Value) && q.Dream_id != dd.id).Select(q => q.Dream_id.Value).Distinct().ToList();
            related_dreams.DataSource = db.Dreams.Where(q => related_dreams_list.Contains(q.id)).ToList();

            related_dreams.DataBind();
        }
    }



    protected void like_link_Click(object sender, EventArgs e)
    {

        String user_id = HttpContext.Current.User.Identity.GetUserId();
        LinkButton lk = (LinkButton)sender;
        //   lk.Style.Add("color", "red");
        int dream_id = int.Parse(lk.CommandArgument);
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {

            DreamBirdEntities db = new DreamBirdEntities();
            DreamUserProfile dup = db.DreamUserProfiles.Where(q => q.AspNetUserId == user_id).First();
            if (dup.IsActivated)
            {
                var dream_like = db.DreamUserLikes.Where(q => q.AspNetUserId == user_id && q.DreamId == dream_id).ToList();
                if (dream_like.Count == 0)
                {

                    var t = new DreamUserLike
                    {
                        DreamId = dream_id,
                        AspNetUserId = user_id,
                    };

                    db.DreamUserLikes.Add(t);
                    db.SaveChanges();

                    BindData();
                    if (dreamLiked != null)
                    {
                        dreamLiked(this, EventArgs.Empty);
                    }


                }
                else
                {
                    db.DreamUserLikes.Remove(dream_like[0]);
                    db.SaveChanges();

                    BindData();
                    //   ModalPopupExtender.Show();


                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('Activate your Account First');", true);
            }

        }
        else
        {
            string host = HttpContext.Current.Request.Url.Host;
            String url = "~/Components/Account/LoginSetting.aspx? returnURL=" + host.ToString() + "";
            Response.Redirect(url);
        }
    }
    protected void Like_link_PreRender(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        if (!lk.Enabled)
        {
            lk.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            lk.ForeColor = System.Drawing.Color.Gray;
        }
    }

    protected void dream_description_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        LinkButton lk = (LinkButton)sender;
        int dream_id = int.Parse(lk.CommandArgument);
        String uid = HttpContext.Current.User.Identity.GetUserId();
        if (HttpContext.Current.User.Identity.IsAuthenticated && db.DreamEnrollments.Any(q => q.AspNetUserID == uid && q.dreamID == dream_id))
        {
            if (db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsUserDefaultPage == true).Count() == 0)
            { return; }
            else
            {
                DreamLayout dl = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsUserDefaultPage == true).First();
                Dream dream = db.Dreams.Where(q => q.id == dream_id).First();
                Response.Redirect("~/DreamHome/" + dream.DreamName + "/" + dl.Page);
            }
        }
        else
        {
            if (db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsPublicDefaultPage == true).Count() == 0)
            { return; }
            else
            {
                DreamLayout dl = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsPublicDefaultPage == true).First();
                Dream dream = db.Dreams.Where(q => q.id == dream_id).First();
                Response.Redirect("~/DreamHome/" + dream.DreamName + "/" + dl.Page);
            }
        }



    }

    public string getLikeButtonStyle(object notLiked)
    {

        Boolean isLiked = (Boolean)notLiked;
        if (isLiked)
        {
            return "color:gray";

        }
        else
        {
            return "color:red";
        }


    }

    public string GetLikesCount(string id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int dream_id = int.Parse(id);
        int count = db.DreamUserLikes.Where(q => q.DreamId == dream_id).Count() + Convert.ToInt32(db.Dreams.Where(w => w.id == dream_id).Select(s => s.LikeSeed).First());
        return count.ToString();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {

    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {

    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {

    }
}