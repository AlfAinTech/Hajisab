using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_PackageListView : System.Web.UI.UserControl,ICorePackageControl
{
    static public List<PackageDetail> wholeData;
    protected void Page_Load(object sender, EventArgs e)
    {
        ISearch searchBox = PackageUtil.SearchInterface;
        if (searchBox != null)
        {
            searchBox.DoSearch += PkgSearched_pkgSearch;
        }
        if (!IsPostBack)
        {
            PackageEntities db = new PackageEntities();
            bindData(db.PackageDetails.ToList());
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
        }
    }
    public void PkgSearched_pkgSearch(object sender, EventArgs e)
    {
        EventArgPackageSearch evt = (EventArgPackageSearch)e;
        package_found.Text = evt.packageList.Count().ToString() + " packages Found. ";
        packageDisplay.Text = " Currently Displaying ";
        if (!(evt.packageList.Count() > 10)) { packageDisplay.Text += evt.packageList.Count().ToString(); } else { packageDisplay.Text += "10"; }
        var pi = typeof(PackageDetail).GetProperty(sortingList.SelectedValue);
        // var orderByAddress = items.OrderBy(x => pi.GetValue(x, null));
        List<PackageDetail> data_packages = evt.packageList.OrderBy(x => pi.GetValue(x, null)).ToList();
        bindData(data_packages);
    }
    protected void sortingList_SelectedIndexChanged(object sender, EventArgs e)
    {
        package_found.Text = wholeData.Count().ToString() + " packages Found. ";
        packageDisplay.Text = " Currently Displaying ";
        if (!(wholeData.Count() > 10)) { packageDisplay.Text += wholeData.Count().ToString(); } else { packageDisplay.Text += "10"; }
        var pi = typeof(PackageDetail).GetProperty(sortingList.SelectedValue);
        // var orderByAddress = items.OrderBy(x => pi.GetValue(x, null));
        List<PackageDetail> data_packages = wholeData.OrderBy(x => pi.GetValue(x, null)).ToList();
        bindData(data_packages);
    }
    public void bindData(List<PackageDetail> data)
    {
        wholeData = data;
        package_list.DataSource = data.Take(10).ToList();
        package_list.DataBind();
        
        
    }
    protected void PackageBookNow(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        int id = int.Parse(b.CommandArgument);
        PackageEntities db = new PackageEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        var data= db.DreamLayouts.Where(q => q.DreamID == pd.PackageID && q.Page == "umrahDetail").ToList();
        if(data.Count() != 0)
        {
            DreamLayout dl = data[0];
            Response.Redirect("~/DreamHome/"+pd.Package.PackageName + "/"+dl.Page);
        }
        
    }
    protected void LoadMore_clicked(object sender, EventArgs e)
    {
        package_list.DataSource= wholeData;
        package_list.DataBind();
    }

    public void BindData()
    {
       
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
       
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        
    }

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
      
    }
}