using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_FileBank_FileBank : System.Web.UI.UserControl
{
    public event EventHandler closeFileBank;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MediaBind();
        }
    }

    protected void close_filebank_Click(object sender, EventArgs e)
    {
        if (closeFileBank != null)
        {
            closeFileBank(this, EventArgs.Empty);
        }
    }

    protected void file_item_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void ddl_paging_SelectedIndexChanged(object sender, EventArgs e)
    {
        MediaBind();
    }

    protected void ddl_sort_SelectedIndexChanged(object sender, EventArgs e)
    {
        MediaBind();
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
        Repeater2.Visible = true;
        Repeater2.DataSource = pages;
        Repeater2.DataBind();
    }
    protected void MediaBind()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        PagedDataSource pds = new PagedDataSource();
        List<XFile> filelist = db.XFiles.OrderBy(ddl_sort.SelectedItem.Value).ToList();
        
        int totalcount = 0;
        int currentcount = 0;
        if (ddl_paging.SelectedItem.Value.Equals("all"))
        {
            currentcount = filelist.Count;
            pds.DataSource = filelist;
            pds.CurrentPageIndex = 0;
            pds.AllowPaging = false;
            Repeater2.Visible = false;
            ViewState["PageNo"] = 0;
        }
        else
        {
            if (ddl_paging.SelectedItem.Value.Equals("10"))
            {
                totalcount = Convert.ToInt32(ddl_paging.SelectedItem.Value);
                pds.DataSource = filelist;
                pds.AllowPaging = true;
                pds.PageSize = totalcount;
                pds.CurrentPageIndex = (int)ViewState["PageNo"];
                currentcount = db.XFiles.Count();
            }
            else if (ddl_paging.SelectedItem.Value.Equals("100"))
            {
                totalcount = Convert.ToInt32(ddl_paging.SelectedItem.Value);
                pds.DataSource = filelist;
                pds.AllowPaging = true;
                pds.PageSize = totalcount;
                pds.CurrentPageIndex = (int)ViewState["PageNo"];
                currentcount = db.XFiles.Count();
            }
        }
        if (totalcount != 0)
        {
            decimal pageNo = Math.Ceiling((Convert.ToDecimal(currentcount) / Convert.ToDecimal(totalcount)));
            PopulatePager(pageNo, currentcount, totalcount);
        }
        else if (currentcount <= totalcount)
        {
            Repeater2.Visible = false;
        }

        file_grid.DataSource = pds;
        file_grid.DataBind();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        string commandname = lb.CommandName;
        ViewState["PageNo"] = Convert.ToInt32(commandname) - 1;
        MediaBind();
    }
}