using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_RelatedDreams : System.Web.UI.UserControl,ICoreDreamControl
{
   
    public event EventHandler dreamLiked;
    

   
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(Session["SearchControlName"] != null)
        //{
        //    string controlName = Session["SearchControlName"].ToString();

        //Control control = Page.FindControl(controlName);
        //if(control != null)
        //{
        //        IBaseDreamControl base_control = (IBaseDreamControl)control;
        //        if (base_control.getDefaultControl() is IDreamSearch)
        //        {
        //            IDreamSearch SControl = (IDreamSearch)base_control.getDefaultControl();
        //            SControl.dreamSearch += dreamSearched_DreamSearch;
        //        }

        //}
        //}

       
        if (!Page.IsPostBack)
        {

            BindData();
        }


    }

    public void BindData()
    {
        //  String url = string.Format("{0}", Page.Request.Url.PathAndQuery);
        // String dream_name = DreamUtil.getDreamNameFromURL(url).ToString();

        DreamBirdEntities db = new DreamBirdEntities();

        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        var d = db.Dreams.Where(q => q.DreamName == dreamName).ToList();
        if(d.Count() != 0) {
            Dream dd = d[0];
         List<int> tags = db.DreamTags.Where(q => q.Dream_id == dd.id).Select(q => q.Tag_id.Value).ToList();
         List<int> related_dreams_list =  db.DreamTags.Where(q => tags.Contains(q.Tag_id.Value) && q.Dream_id != dd.id).Select(q => q.Dream_id.Value).Distinct().ToList();
        related_dreams.DataSource = db.Dreams.Where(q => related_dreams_list.Contains(q.id)).ToList();

            related_dreams.DataBind();
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
        Dream dream;
        DreamLayout dl;
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
                 dl = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsUserDefaultPage == true).First();
                 dream = db.Dreams.Where(q => q.id == dream_id).First();
                Response.Redirect("~/DreamHome/" + dream.DreamName + "/" + dl.Page);
            }
        }
        else
        {
            if (db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsPublicDefaultPage == true).Count() == 0)
            { return; }
            else
            {
                 dl = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsPublicDefaultPage == true).First();
                 dream = db.Dreams.Where(q => q.id == dream_id).First();
                Response.Redirect("~/DreamHome/" + dream.DreamName + "/" + dl.Page);
            }
        }
        //set cookies for recent dreams

        if (Request.Cookies["recentDream"] != null)
        {
            // cookie.Expires = DateTime.Now.AddDays(-1);
            List<string> dream_list = new List<string>();
            if (Request.Cookies["recentDream"].Value != null) { dream_list = Request.Cookies["recentDream"].Value.Split(',').Select(x => Convert.ToString(x)).ToList(); }
            if (!dream_list.Contains(dream_id.ToString()))
            { dream_list.Add(dream_id.ToString()); dream_list=dream_list.GetRange(dream_list.Count() - 2, 2); }
            var yourListString = String.Join(",", dream_list);

            Response.Cookies["recentDream"].Value = yourListString;
            Response.Cookies["recentDream"].Expires = DateTime.Now.AddDays(1d);
        }
        else
        {
            List<string> dream_list = new List<string>();
            dream_list.Add(dream_id.ToString());
            var yourListString = String.Join(",", dream_list);
            Response.Cookies["recentDream"].Value = yourListString;
        }

        ///////////////////////////
        Response.Redirect("~/DreamHome/" + dream.DreamName + "/" + dl.Page);



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