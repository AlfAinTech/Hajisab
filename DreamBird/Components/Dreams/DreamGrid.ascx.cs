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
        if (!IsPostBack)
        {
            ViewState["PageNo"] = 0;
            DreamBirdEntities db = new DreamBirdEntities();
            ddl_DreamCat.DataSource = db.DreamTypes.ToList();
            String uid = HttpContext.Current.User.Identity.GetUserId();
            if (HttpContext.Current.User.IsInRole("UmrahAdmin") && !HttpContext.Current.User.IsInRole("Admin"))
            {
                ddl_DreamCat.DataSource = db.DreamTypes.Where(q => q.Name == "UmrahDetail").ToList();
            }
            ddl_DreamCat.DataTextField = "Name";
            ddl_DreamCat.DataValueField = "id";
            ddl_DreamCat.DataBind();
            BindDreamGrid();
          //  dream_keyword.Attributes.Add("onkeypress", "button_click(this,'" + search_dream_button.ClientID + "')");
        }
    }

    private void BindDreamGrid(string searched_text = null)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int DreamTypeID = Convert.ToInt32(ddl_DreamCat.SelectedItem.Value);
        List<Dream> DreamList = new List<Dream>();
        String uid = HttpContext.Current.User.Identity.GetUserId();
        if (HttpContext.Current.User.IsInRole("Admin"))
        {
            DreamList = db.Dreams.Where(w => w.dreamTypeID == DreamTypeID).ToList();
        }
        else
        {
           if (HttpContext.Current.User.IsInRole("UmrahAdmin"))
            {
                DreamList = db.Dreams.Where(w => w.dreamTypeID == DreamTypeID && w.AspNetUserID ==uid ).ToList();
            }
        }
        if (searched_text == null)
        {
            DreamList = DreamList.Where(w => w.dreamTypeID == DreamTypeID).ToList();
        }
        else
        {
            //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
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
            if (DreamList.Any(a => a.DreamName.Contains(searched_text)) || DreamList.Any(a => a.Description.Contains(searched_text)) || db.DreamTags.Any(a => taglist.Contains(a.Tag_id)))
            {
                DreamList = DreamList.Where(w =>  ((w.DreamName.Contains(searched_text)) || (w.Description.Contains(searched_text)) || dreamTagList.Contains(w.id))).ToList();
            }

        }
        if (DreamList.Count == 0)
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
        EventArgDreamEdit evt = new EventArgDreamEdit();
        int DreamID = Convert.ToInt32(lb.CommandName);
        evt.DreamEditID = DreamID;
        if (DreamClicked != null)
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
        ViewState["PageNo"] = 0;
        string searched_text = dream_keyword.Text;
        BindDreamGrid(searched_text);
    }

    protected void ddl_DreamCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["PageNo"] = 0;
        string Keyword = dream_keyword.Text;
        if (Keyword == "")
        {
            BindDreamGrid();

        }
        else
        {
            BindDreamGrid(Keyword);
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string Keyword = dream_keyword.Text;
        LinkButton lb = (LinkButton)sender;
        string commandname = lb.CommandName;
        ViewState["PageNo"] = Convert.ToInt32(commandname) - 1;
        if (Keyword == "")
        {
            BindDreamGrid();

        }
        else
        {
            BindDreamGrid(Keyword);
        }
    }

    protected void Previous_Pagination_Item_Click(object sender, EventArgs e)
    {
        
        int CurrentPageNumber = (int)ViewState["PageNo"];
        if (CurrentPageNumber != 0)
        {
            ViewState["PageNo"] = CurrentPageNumber - 1;
        }
        string Keyword = dream_keyword.Text;
        if (Keyword == "")
        {
            BindDreamGrid();

        }
        else
        {
            BindDreamGrid(Keyword);
        }
    }

    protected void Next_Pagination_Item_Click(object sender, EventArgs e)
    {
        int CurrentPageNumber = (int)ViewState["PageNo"];
        int TotalItems = rptr_dream_pagination.Items.Count;
        if (CurrentPageNumber + 1 < TotalItems)
        {
            ViewState["PageNo"] = CurrentPageNumber + 1;
        }
        string Keyword = dream_keyword.Text;
        if (Keyword == "")
        {
            BindDreamGrid();

        }
        else
        {
            BindDreamGrid(Keyword);
        }
    }
}