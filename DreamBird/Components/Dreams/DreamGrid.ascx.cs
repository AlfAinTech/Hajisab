using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamGrid : System.Web.UI.UserControl
{
    public event EventHandler DreamClicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ViewState["PageNo"] = 0;
            DreamBirdEntities db = new DreamBirdEntities();
            ddl_DreamCat.DataSource = db.DreamTypes.ToList();
            ddl_DreamCat.DataTextField = "Name";
            ddl_DreamCat.DataValueField = "id";
            ddl_DreamCat.DataBind();
            BindDreamGrid();
            
        }
    }

    private void BindDreamGrid()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int DreamTypeID = Convert.ToInt32(ddl_DreamCat.SelectedItem.Value);
        var DreamList = db.Dreams.Where(w => w.dreamTypeID == DreamTypeID).ToList();
        PagedDataSource pds = new PagedDataSource();
        int totalcount = 12;
        int currentcount = 0;
        pds.DataSource = DreamList;
        pds.AllowPaging = true;
        pds.PageSize = totalcount;
        pds.CurrentPageIndex = (int)ViewState["PageNo"];
        rptr_dreamGrid.DataSource = pds;
        rptr_dreamGrid.DataBind();
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
    private void BindSearchedDreams(List<Dream> DreamList)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        //int DreamTypeID = Convert.ToInt32(ddl_DreamCat.SelectedItem.Value);
        //var DreamList = db.Dreams.Where(w => w.dreamTypeID == DreamTypeID).ToList();
        PagedDataSource pds = new PagedDataSource();
        int totalcount = 12;
        int currentcount = 0;
        pds.DataSource = DreamList;
        pds.AllowPaging = true;
        pds.PageSize = totalcount;
        pds.CurrentPageIndex = (int)ViewState["PageNo"];
        rptr_dreamGrid.DataSource = pds;
        rptr_dreamGrid.DataBind();
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
        rptr_dream_pagination.Visible = true;
        rptr_dream_pagination.DataSource = pages;
        rptr_dream_pagination.DataBind();
    }

    protected void lb1_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        EventArgDreamEdit evt = new EventArgDreamEdit();
        int DreamID = Convert.ToInt32(lb.CommandName);
        evt.DreamEditID = DreamID;
        if(DreamClicked != null)
        {
            DreamClicked(this, evt);
        }
    }

    protected void DreamBasicInfo_DreamAdded(object sender, EventArgs e)
    {
        EventArgDreamEdit evt = e as EventArgDreamEdit;
        int dreamid = evt.DreamEditID;
        Response.Redirect("~/Admin/DreamDetail.aspx?DID=" + dreamid);
    }

    protected void search_dream_button_ServerClick(object sender, EventArgs e)
    {
        string searched_text = dream_keyword.Text;
        DreamBirdEntities db = new DreamBirdEntities();
        String uid = HttpContext.Current.User.Identity.GetUserId();
        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
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
            result = db.Dreams.Where(w => (w.DreamName == searched_text) || (w.Description.Contains(searched_text)) || dreamTagList.Contains(w.id)).ToList();
        }

        if (result.Count() > 0)
        {
            BindSearchedDreams(result.ToList());
        }
        else
        {// ShowError("No items match your search");
        }
    }

    protected void ddl_DreamCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["PageNo"] = 0;
        BindDreamGrid();
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
        if(CurrentPageNumber != 0)
        {
            ViewState["PageNo"] = CurrentPageNumber - 1;
        }
        BindDreamGrid();
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
}