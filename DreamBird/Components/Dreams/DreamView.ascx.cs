using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using Microsoft.AspNet.Identity;
public partial class Components_Dreams_DreamView : CoreDreamControlAdapter
{
    static public int dreamTypeID = 1;
    private bool enableEditing = false;
    public event EventHandler dreamEdit;
    public event EventHandler dreamLiked;
    private String searchControlName;
    public String SearchControlName {
        get
        {
            return searchControlName;
        }

        set
        {
            searchControlName = value;
        }
    }
   
    public bool EnableEditing
    {
        get
        {
            return enableEditing;
        }

        set
        {
            enableEditing = value;
        }
    }
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

        ISearch searchBox = DreamUtil.SearchInterface;
        if(searchBox != null) { 
        searchBox.DoSearch += dreamSearched_DreamSearch;
        }
        ErrorMessage.Visible = false;
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

        Dream_data_list.DataSource = db.Dreams.Where(q=> q.IsDefault != true && q.IsPublished && q.dreamTypeID == dreamTypeID).ToList().Take(8);
        if(db.Dreams.ToList().Count() > 8)
        {
            load_more.Visible = true;
        }

        Dream_data_list.DataBind();
        



    }
    override
  public void OnHideAdminEvent(object sender, EventArgs e)
    {
        BindData();

    }
    protected void set_enableEditing(object sender, DataListItemEventArgs e)
    {
        LinkButton linkLike = (LinkButton)e.Item.FindControl("like_link");
       linkLike.OnClientClick = String.Format("setLikeStyle('#{0}')",linkLike.ClientID);

        if (enableEditing)
        {
            this.FindControl("DreamSort").Visible = true;
            LinkButton link = (LinkButton)e.Item.FindControl("edit_link");

            link.Visible = true;
            // a.Visible = true;


        }
        else
        {

            // LinkButton a = (LinkButton)e.Item.FindControl("edit_nav");
            // a.Visible = false;



        }
    }

    public void dreamSearched_DreamSearch(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();

        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
        EventArgDreamSearch evt = (EventArgDreamSearch)e;
        String searched_text = evt.SearchDreamName;
        List<Dream> result = new List<Dream>();
        List<int?> taglist = new List<int?>();
        List<int?> dreamTagList = new List<int?>();
        if (db.Tags.Any(a => a.Name == searched_text))
        {
            taglist = db.Tags.Where(w => w.Name == searched_text).Select<Tag, int?>(s => s.id).ToList();
        }
        if (taglist.Count > 0)
        {
            if (db.DreamTags.Any(a => taglist.Contains(a.Tag_id)))
            {
                dreamTagList = db.DreamTags.Where(w => taglist.Contains(w.Tag_id)).Select<DreamTag, int?>(s => s.Dream_id).ToList();
            }
        }
        if (db.Dreams.Any(a => a.DreamName == searched_text) || db.Dreams.Any(a => a.Description.Contains(searched_text)) || db.DreamTags.Any(a => taglist.Contains(a.Tag_id)))
        {
            result = db.Dreams.Where(w => ((w.DreamName == searched_text) || (w.Description.Contains(searched_text)) || dreamTagList.Contains(w.id))&&w.dreamTypeID == dreamTypeID).ToList();
        }

        if (result.Count() > 0)
        {
            Dream_data_list.DataSource = result.ToList();
            Dream_data_list.DataBind();
        }
        else { ShowError("No items match your search"); }
       

    }

    protected void dreamSorted_DreamSort(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();

        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
        EventArgDreamSort evt = (EventArgDreamSort)e;
        String sort_text = evt.DreamSortField;
        if (sort_text == "DreamName")
        {
            Dream_data_list.DataSource = db.Dreams.Where(q=> q.IsDefault != true && q.IsPublished && q.dreamTypeID == dreamTypeID).OrderBy(q => q.DreamName).ToList();
            Dream_data_list.DataBind();
        }




    }


    protected void load_more_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        Dream_data_list.DataSource = db.Dreams.Where(q=> q.IsDefault != true && q.IsPublished && q.dreamTypeID==dreamTypeID).ToList();
        Dream_data_list.DataBind();
    }



    protected void edit_link_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        EventArgDreamEdit evt = new EventArgDreamEdit();
        evt.DreamEditID = id;
        dreamEdit(this, evt);
        //DreamEditID
        // Dream_data_list.Items

    }

    protected void like_link_Click(object sender, EventArgs e)
    {
    
        String user_id = HttpContext.Current.User.Identity.GetUserId();
        LinkButton lk = (LinkButton)sender;
     //   lk.Style.Add("color", "red");
        int dream_id = int.Parse(lk.CommandArgument);
        if (HttpContext.Current.User.Identity.IsAuthenticated )
        {
            
            DreamBirdEntities db = new DreamBirdEntities();
            DreamUserProfile dup =  db.DreamUserProfiles.Where(q => q.AspNetUserId == user_id).First();
            if(dup.IsActivated)
            { 
                var dream_like = db.DreamUserLikes.Where(q => q.AspNetUserId == user_id && q.DreamId == dream_id).ToList();
                if (dream_like.Count == 0)
                { 

                    var t = new DreamUserLike {
                    DreamId=dream_id,
                    AspNetUserId=user_id,};

                db.DreamUserLikes.Add(t);
                db.SaveChanges();
                  
                     BindData();
                    if (dreamLiked != null)
                {
                    dreamLiked(this, EventArgs.Empty);
                }
              

                }
                else {
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
        if (! lk.Enabled) 
        {
            lk.ForeColor = System.Drawing.Color.Red;
        }
        else {
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
        if (HttpContext.Current.User.Identity.IsAuthenticated && db.DreamEnrollments.Any(q=>q.AspNetUserID == uid && q.dreamID == dream_id))
        { 
            if(db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsUserDefaultPage == true).Count() == 0)
            { return; }
            else{  dl = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsUserDefaultPage == true).First();
                    dream = db.Dreams.Where(q => q.id == dream_id).First();}
        }
        else
        {
            if (db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsPublicDefaultPage == true).Count() == 0)
            { return; }
            else{  dl = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsPublicDefaultPage == true).First();
                dream = db.Dreams.Where(q => q.id == dream_id).First();
               }
        }
        //set cookies for recent dreams

        if (Request.Cookies["recentDream"] != null)
        {
            // cookie.Expires = DateTime.Now.AddDays(-1);
            List<string> dream_list = new List<string>();
            if (Request.Cookies["recentDream"].Value != null) { dream_list = Request.Cookies["recentDream"].Value.Split(',').Select(x => Convert.ToString(x)).ToList(); }
            if (!dream_list.Contains(dream_id.ToString()))
            { dream_list.Add(dream_id.ToString()); dream_list = dream_list.GetRange(dream_list.Count() - 2, 2); }
            var yourListString = String.Join(",", dream_list);
            Response.Cookies["recentDream"].Value = yourListString;
            Response.Cookies["recentDream"].Expires = DateTime.Now.AddDays(1d);
        }
        else
        {List<string> dream_list = new List<string>();
            dream_list.Add(dream_id.ToString());
            var yourListString = String.Join(",", dream_list);
            Response.Cookies["recentDream"].Value = yourListString;}

        ///////////////////////////
        Response.Redirect("~/DreamHome/" + dream.DreamName + "/" + dl.Page);


    }

    public string getLikeButtonStyle(object notLiked)
    {

        Boolean isLiked = (Boolean)notLiked;
        if(isLiked)
        {
            return "color:gray";

        }
        else
        {
            return "color:red";
        }
       

    }
    public void ShowError(String errorMsg)
    {
        ErrorMessage.Text = errorMsg;
        ErrorMessage.Visible = true;
    }
    public string GetLikesCount(string id)
    {
        DreamBirdEntities db = new DreamBirdEntities(); 
        int dream_id = int.Parse(id);
        int count = db.DreamUserLikes.Where(q => q.DreamId == dream_id).Count() + Convert.ToInt32(db.Dreams.Where(w => w.id == dream_id).Select(s => s.LikeSeed).First());
        return count.ToString();
    }
}