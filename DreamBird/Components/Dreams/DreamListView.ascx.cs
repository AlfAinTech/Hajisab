using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamListView : System.Web.UI.UserControl
{
    public event EventHandler AddClicked;
    public event EventHandler dreamCllicked;
    public event EventHandler ActivatePanels;
    public event EventHandler searchClicked;
    public int DreamType;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            BindData();
        }

    }
    public void BindData()
    {
        //String url = string.Format("{0}", Page.Request.Url.PathAndQuery);
        //String dream_name = DreamUtil.getDreamNameFromURL(url).ToString();

        DreamBirdEntities db = new DreamBirdEntities();
        String uid = HttpContext.Current.User.Identity.GetUserId();
        if(DreamType !=0)
            Dream_data_list.DataSource = db.Dreams.Where(q=>q.dreamTypeID == DreamType).ToList();
        else
            Dream_data_list.DataSource = db.Dreams.ToList();
        if (HttpContext.Current.User.IsInRole("UmrahAdmin")) { Dream_data_list.DataSource = db.Dreams.Where(q => q.AspNetUserID == uid).ToList(); }
            Dream_data_list.DataBind();
       
        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;

       




    }
    protected void dreamSearched_DreamSearch(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String uid = HttpContext.Current.User.Identity.GetUserId();
        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
        EventArgDreamSearch evt = (EventArgDreamSearch)e;
        String searched_text = evt.SearchDreamName;
        List<Dream> result = new List<Dream>();
        List<int?> taglist = new List<int?>();
        List<int?> dreamTagList = new List<int?>();
        if(db.Tags.Any(a => a.Name == searched_text))
        {
            taglist = db.Tags.Where(w => w.Name == searched_text).Select<Tag, int?>(s => s.id).ToList();
        }
        if(taglist.Count > 0)
        {
            if(db.DreamTags.Any(a => taglist.Contains(a.Tag_id)))
            {
                dreamTagList = db.DreamTags.Where(w => taglist.Contains(w.Tag_id)).Select<DreamTag, int?>(s => s.Dream_id).ToList();
            }
        }
        if(db.Dreams.Any(a => a.DreamName == searched_text) || db.Dreams.Any(a => a.Description.Contains(searched_text)) || db.DreamTags.Any(a => taglist.Contains(a.Tag_id)))
        {
            result = db.Dreams.Where(w=>(w.DreamName == searched_text) || (w.Description.Contains(searched_text))|| dreamTagList.Contains(w.id)).ToList();
        }

        if (result.Count() > 0)
        {
            if (HttpContext.Current.User.IsInRole("UmrahAdmin"))
            {
                result = result.Where(q=>q.AspNetUserID==uid).ToList();
            }
            Dream_data_list.DataSource = result.ToList();
            Dream_data_list.DataBind();
        }
        else
        {// ShowError("No items match your search");
        }
        if (searchClicked != null)
        {
            searchClicked(this, EventArgs.Empty);
        }

    }

    protected void add_btn_Click(object sender, EventArgs e)
    {
        AddClicked(this, EventArgs.Empty);
    }
    protected void dream_btn_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        EventArgDreamEdit evt = new EventArgDreamEdit();
        evt.DreamEditID = id;
        ViewState["SelectedDreamID"] = id;
        //dreamEdit(this, evt);
        dreamCllicked(this, evt);
        if (ActivatePanels != null)
        {
            ActivatePanels(this, EventArgs.Empty);
        }
    }
}