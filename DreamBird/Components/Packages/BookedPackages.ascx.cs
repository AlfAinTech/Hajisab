using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_BookedPackages : System.Web.UI.UserControl
{
    public event EventHandler DreamClicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["PageNo"] = 0;
            PackageEntities db = new PackageEntities();
            String uid = HttpContext.Current.User.Identity.GetUserId();
            BindDreamGrid();
            //  dream_keyword.Attributes.Add("onkeypress", "button_click(this,'" + search_dream_button.ClientID + "')");
        }
    }

    private void BindDreamGrid(string searched_text = null)
    {
        PackageEntities db = new PackageEntities();
        String uid = HttpContext.Current.User.Identity.GetUserId();
        List<Package> DreamList = db.AlharmainUserPackages.Where(q=>q.PackageDetail.Package.AspNetUserID == uid).Select(q => q.PackageDetail.Package).Distinct().ToList();
        if (DreamList.Count == 0)
        {
            errormessage.Visible = true;
            errormessage.Text = "Packages not booked";
        }
        else
        {
            errormessage.Visible = false;
        }
        PagedDataSource pds = new PagedDataSource();
        int totalcount = 12;
        int currentcount = 0;
        pds.DataSource = DreamList;
        pds.AllowPaging = true;
        pds.PageSize = totalcount;
        pds.CurrentPageIndex = (int)ViewState["PageNo"];
        rptr_dreamGrid.DataSource = pds;
        rptr_dreamGrid.DataBind();
        current_count.Text = pds.Count.ToString();
        total_count.Text = DreamList.Count.ToString();
        currentcount = DreamList.Count;
        if (totalcount != 0)
        {
            decimal pageNo = Math.Ceiling((Convert.ToDecimal(currentcount) / Convert.ToDecimal(totalcount)));
            PopulatePager(pageNo, currentcount, totalcount);
        }
        else if (currentcount <= totalcount)
        {
            rptr_dream_pagination.Visible = false;
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
            // LinkButton lblControl = rptr_dream_pagination.Controls[rptr_dream_pagination.Controls.Count - 1].Controls[0].FindControl("Next_Pagination_Item") as LinkButton;
            // LinkButton lblControl1 = rptr_dream_pagination.Controls[0].Controls[0].FindControl("Previous_Pagination_Item") as LinkButton;
            // ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_disable", "$('#" + lblControl.ClientID + "').css('pointer-events', 'none').parent().addClass('disabled'); $('#" + lblControl1.ClientID + "').css('pointer-events', 'none').parent().addClass('disabled');", true);
        }
        rptr_dream_pagination.Visible = true;
        rptr_dream_pagination.DataSource = pages;
        rptr_dream_pagination.DataBind();
    }

    protected void lb1_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        EventArgPackageEdit evt = new EventArgPackageEdit();
        int DreamID = Convert.ToInt32(lb.CommandName);
        evt.PackageEditID = DreamID;
        if (DreamClicked != null)
        {
            DreamClicked(this, evt);
        }
    }

    protected void DreamBasicInfo_DreamAdded(object sender, EventArgs e)
    {
        EventArgPackageEdit evt = e as EventArgPackageEdit;
        int dreamid = evt.PackageEditID;
        Response.Redirect("~/Admin/PackageDetail.aspx?DID=" + dreamid);
    }

   

    protected void ddl_DreamCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["PageNo"] = 0; BindDreamGrid();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        string commandname = lb.CommandName;
        ViewState["PageNo"] = Convert.ToInt32(commandname) - 1;
        BindDreamGrid();
    }

    protected void Previous_Pagination_Item_Click(object sender, EventArgs e)
    {

        int CurrentPageNumber = (int)ViewState["PageNo"];
        if (CurrentPageNumber != 0)
        {
            ViewState["PageNo"] = CurrentPageNumber - 1;
        } BindDreamGrid();
    }

    protected void Next_Pagination_Item_Click(object sender, EventArgs e)
    {
        int CurrentPageNumber = (int)ViewState["PageNo"];
        int TotalItems = rptr_dream_pagination.Items.Count;
        if (CurrentPageNumber + 1 < TotalItems)
        {
            ViewState["PageNo"] = CurrentPageNumber + 1;
        }
       
            BindDreamGrid();
    }

    protected void rptr_dreamGrid_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //PackageEntities db = new PackageEntities();

        //Dream dream = (Dream)e.Item.DataItem;
        //    Literal dl = (Literal)e.Item.FindControl("NoOfBooking");         
        //    String uid = HttpContext.Current.User.Identity.GetUserId();
        // List<AlharmainUserPackage> DreamList = db.AlharmainUserPackages.Where(q => q.PackageDetail.dreamID == dream.id).ToList();
        //dl.Text = DreamList.Count.ToString();
        
    }
}