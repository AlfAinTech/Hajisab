using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Packages_PackageList : System.Web.UI.UserControl
{
    public event EventHandler AddClicked;
    public event EventHandler packageCllicked;
    public event EventHandler ActivatePanels;

    protected void Page_Load(object sender, EventArgs e)
    {
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

        package_data_list.DataSource = db.Packages.ToList();
        package_data_list.DataBind();




    }

    protected void package_btn_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        EventArgPackageClicked evt = new EventArgPackageClicked();
        evt.PackageID = id;
        ViewState["SelectedPackageID"] = id;
        //dreamEdit(this, evt);
        packageCllicked(this, evt);
        if (ActivatePanels != null)
        {
            ActivatePanels(this, EventArgs.Empty);
        }

    }

    protected void packageSearch_packageSearchrd(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();

        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
        EventArgPackageSearch evt = (EventArgPackageSearch)e;
        String searched_text = evt.packageSearchText;
        List<Package> result = db.Packages.Where(q => q.name.Contains(searched_text)).ToList();
        if (result.Count() > 0)
        {
            package_data_list.DataSource = result.ToList();
            package_data_list.DataBind();
        }
        else
        {// ShowError("No items match your search");
        }


    }

    protected void add_btn_Click(object sender, EventArgs e)
    {
        AddClicked(this, EventArgs.Empty);
    }
}