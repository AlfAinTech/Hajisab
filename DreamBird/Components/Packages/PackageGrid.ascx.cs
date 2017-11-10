using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Package_PackageGrid : System.Web.UI.UserControl
{
    public event EventHandler PackageClicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["PageNo"] = 0;
            PackageEntities db = new PackageEntities();
            //ddl_PackageCat.DataSource = db.PackageTypes.ToList();
            String uid = HttpContext.Current.User.Identity.GetUserId();
            //if (HttpContext.Current.User.IsInRole("UmrahAdmin") && !HttpContext.Current.User.IsInRole("Admin"))
            //{
            //    ddl_PackageCat.DataSource = db.PackageTypes.Where(q => q.Name == "UmrahDetail").ToList();
            //}
            //ddl_PackageCat.DataTextField = "Name";
            //ddl_PackageCat.DataValueField = "id";
            //ddl_PackageCat.DataBind();
            BindPackageGrid();
          //  Package_keyword.Attributes.Add("onkeypress", "button_click(this,'" + search_Package_button.ClientID + "')");
        }
    }

    private void BindPackageGrid(string searched_text = null)
    {
        PackageEntities db = new PackageEntities();
        int packageTypeID = 2;//for Umrah Type package //Convert.ToInt32(ddl_PackageCat.SelectedItem.Value);
        List<Package> PackageList = new List<Package>();
        String uid = HttpContext.Current.User.Identity.GetUserId();
        if (HttpContext.Current.User.IsInRole("Admin"))
        {
            PackageList = db.Packages.Where(w => w.PackageTypeID == packageTypeID).ToList();
        }
        else
        {
           if (HttpContext.Current.User.IsInRole("UmrahAdmin"))
            {
                PackageList = db.Packages.Where(w => w.PackageTypeID == packageTypeID && w.AspNetUserID ==uid ).ToList();
            }
        }
        if (searched_text == null)
        {
            PackageList = PackageList.Where(w => w.PackageTypeID == packageTypeID).ToList();
        }
        else
        {
            //  int Package_id = db.Packages.Where(Package => Package.PackageName == Package_name).First().id;
            //List<int?> taglist = new List<int?>();
            //List<int?> PackageTagList = new List<int?>();
            //if (db.Tags.Any(a => a.Name == searched_text))
            //{
            //    taglist = db.Tags.Where(w => w.Name == searched_text).Select<Tag, int?>(s => s.id).ToList();
            //}
            //if (taglist.Count > 0)
            //{
            //    if (db.PackageTags.Any(a => taglist.Contains(a.Tag_id)))
            //    {
            //        PackageTagList = db.PackageTags.Where(w => taglist.Contains(w.Tag_id)).Select<PackageTag, int?>(s => s.Package_id).ToList();
            //    }
            //}
            //if (PackageList.Any(a => a.PackageName.ToLower().Contains(searched_text)) || PackageList.Any(a => a.Description.ToLower().Contains(searched_text)) || db.PackageTags.Any(a => taglist.Contains(a.Tag_id)))
            //{
                PackageList = PackageList.Where(w =>  ((w.PackageName.ToLower().Contains(searched_text)) || (w.Description.ToLower().Contains(searched_text)) )).ToList();
            //}

        }
        if (PackageList.Count == 0)
        {
            errormessage.Visible = true;
            errormessage.Text = "No items match your search";
        }
        else
        {
            errormessage.Visible = false;
        }
        PagedDataSource pds = new PagedDataSource();
        int totalcount = 12;
        int currentcount = 0;
        pds.DataSource = PackageList;
        pds.AllowPaging = true;
        pds.PageSize = totalcount;
        pds.CurrentPageIndex = (int)ViewState["PageNo"];
        rptr_PackageGrid.DataSource = pds;
        rptr_PackageGrid.DataBind();
        current_count.Text = pds.Count.ToString();
        total_count.Text = PackageList.Count.ToString();
        currentcount = PackageList.Count;
        if (totalcount != 0)
        {
            decimal pageNo = Math.Ceiling((Convert.ToDecimal(currentcount) / Convert.ToDecimal(totalcount)));
            PopulatePager(pageNo, currentcount, totalcount);
        }
        else if (currentcount <= totalcount)
        {
            rptr_Package_pagination.Visible = false;
        }
    }

    private void PopulatePager(decimal recordCount, int totalrecords, int limit)
    {
        List<ListItem> pages = new List<ListItem>();
        if (recordCount > 0)
        {
            int difference = totalrecords - limit;
            for (int i = 1; i <= recordCount; i++)
            {
                if (i == ((int)ViewState["PageNo"]) + 1)
                {
                    pages.Add(new ListItem(difference.ToString(), i.ToString(), false));
                }
                else
                {
                    pages.Add(new ListItem(difference.ToString(), i.ToString(), true));
                }
            }
        }
        if (recordCount == 1 || recordCount == 0)
        {
           // LinkButton lblControl = rptr_Package_pagination.Controls[rptr_Package_pagination.Controls.Count - 1].Controls[0].FindControl("Next_Pagination_Item") as LinkButton;
           // LinkButton lblControl1 = rptr_Package_pagination.Controls[0].Controls[0].FindControl("Previous_Pagination_Item") as LinkButton;
           // ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_disable", "$('#" + lblControl.ClientID + "').css('pointer-events', 'none').parent().addClass('disabled'); $('#" + lblControl1.ClientID + "').css('pointer-events', 'none').parent().addClass('disabled');", true);
        }
        rptr_Package_pagination.Visible = true;
        rptr_Package_pagination.DataSource = pages;
        rptr_Package_pagination.DataBind();
    }

    protected void lb1_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        EventArgPackageEdit evt = new EventArgPackageEdit();
        int PackageID = Convert.ToInt32(lb.CommandName);
        evt.PackageEditID = PackageID;
        if (PackageClicked != null)
        {
            PackageClicked(this, evt);
        }
    }

    protected void PackageBasicInfo_PackageAdded(object sender, EventArgs e)
    {
        EventArgPackageEdit evt = e as EventArgPackageEdit;
        int Packageid = evt.PackageEditID;
        Response.Redirect("~/Admin/PackageDetail.aspx?DID=" + Packageid);
    }
   
    protected void search_Package_button_ServerClick(object sender, EventArgs e)
    {
        ViewState["PageNo"] = 0;
        string searched_text = Package_keyword.Text;
        BindPackageGrid(searched_text.ToLower());
    }

    protected void ddl_PackageCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["PageNo"] = 0;
        string Keyword = Package_keyword.Text;
        if (Keyword == "")
        {
            BindPackageGrid();

        }
        else
        {
            BindPackageGrid(Keyword.ToLower());
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string Keyword = Package_keyword.Text;
        LinkButton lb = (LinkButton)sender;
        string commandname = lb.CommandName;
        ViewState["PageNo"] = Convert.ToInt32(commandname) - 1;
        if (Keyword == "")
        {
            BindPackageGrid();

        }
        else
        {
            BindPackageGrid(Keyword.ToLower());
        }
    }

    protected void Previous_Pagination_Item_Click(object sender, EventArgs e)
    {
        
        int CurrentPageNumber = (int)ViewState["PageNo"];
        if (CurrentPageNumber != 0)
        {
            ViewState["PageNo"] = CurrentPageNumber - 1;
        }
        string Keyword = Package_keyword.Text;
        if (Keyword == "")
        {
            BindPackageGrid();

        }
        else
        {
            BindPackageGrid(Keyword.ToLower());
        }
    }

    protected void Next_Pagination_Item_Click(object sender, EventArgs e)
    {
        int CurrentPageNumber = (int)ViewState["PageNo"];
        int TotalItems = rptr_Package_pagination.Items.Count;
        if (CurrentPageNumber + 1 < TotalItems)
        {
            ViewState["PageNo"] = CurrentPageNumber + 1;
           
        }
        string Keyword = Package_keyword.Text;
        if (Keyword == "")
        {
            BindPackageGrid();

        }
        else
        {
            BindPackageGrid(Keyword.ToLower());
        }
    }
}