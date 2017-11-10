using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Package_PackageListView : System.Web.UI.UserControl
{
    public event EventHandler AddClicked;
    public event EventHandler packageCllicked;
    public event EventHandler ActivatePanels;
    public event EventHandler searchClicked;
    public int PackageType;
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
        //String dream_name = PackageUtil.getPackageNameFromURL(url).ToString();

        PackageEntities db = new PackageEntities();
        String uid = HttpContext.Current.User.Identity.GetUserId();
        if(PackageType !=0)
            Package_data_list.DataSource = db.Packages.Where(q=>q.PackageTypeID == PackageType).ToList();
        else
            Package_data_list.DataSource = db.Packages.ToList();
        if (HttpContext.Current.User.IsInRole("UmrahAdmin")) { Package_data_list.DataSource = db.Packages.Where(q => q.AspNetUserID == uid && q.PackageType.id == PackageType).ToList(); }
        Package_data_list.DataBind();
       
        //  int Package_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;

       




    }
    protected void packageSearched_PackageSearch(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        String uid = HttpContext.Current.User.Identity.GetUserId();
        //  int Package_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
        EventArgPackageSearch evt = (EventArgPackageSearch)e;
        String searched_text = evt.SearchPackageName;
        List<Package> result = new List<Package>();
        List<int?> taglist = new List<int?>();
        List<int?> dreamTagList = new List<int?>();
        if(db.Tags.Any(a => a.Name == searched_text))
        {
            taglist = db.Tags.Where(w => w.Name == searched_text).Select<Tag, int?>(s => s.id).ToList();
        }
         result = db.Packages.Where(q=>q.PackageType.id == PackageType).ToList();

        if (taglist.Count > 0)
        {
            if(db.PackageTags.Any(a => taglist.Contains(a.Tag_id)))
            {
                dreamTagList = db.PackageTags.Where(w => taglist.Contains(w.Tag_id)).Select<PackageTag, int?>(s => s.Package_id).ToList();
            }
        }
        //if(result.Any(a => a.DreamName.ToLower().Contains( searched_text.ToLower())) || result.Any(a => a.Description.Contains(searched_text)) || db.PackageTags.Any(a => taglist.Contains(a.Tag_id)))
        //{
            result = result.Where(w=>(w.PackageName.ToLower().Contains( searched_text.ToLower())) || (w.Description.Contains(searched_text))|| dreamTagList.Contains(w.id)).ToList();
        //}

        if (result.Count() > 0)
        {
            errormessage.Visible = false;
            if (HttpContext.Current.User.IsInRole("UmrahAdmin"))
            {
                result = result.Where(q=>q.AspNetUserID==uid).ToList();
            }
            
        }
        else
        {
            errormessage.Visible = true;
            errormessage.Text = "No items match your search";

        }
        Package_data_list.DataSource = result.ToList();
        Package_data_list.DataBind();
        if (searchClicked != null)
        {
            searchClicked(this, EventArgs.Empty);
        }

    }

    protected void add_btn_Click(object sender, EventArgs e)
    {
        AddClicked(this, EventArgs.Empty);
    }
    protected void Package_btn_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        EventArgPackageEdit evt = new EventArgPackageEdit();
        evt.PackageEditID = id;
        ViewState["SelectedDreamID"] = id;
        //dreamEdit(this, evt);
        packageCllicked(this, evt);
        if (ActivatePanels != null)
        {
            ActivatePanels(this, EventArgs.Empty);
        }
    }
}