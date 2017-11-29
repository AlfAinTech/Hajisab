using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_FilterPageControls_UmrahDetail_ListView : System.Web.UI.UserControl,ICorePackageControl
{
    static public List<PackageDetail> wholeData;
    static public int NoOfPages;
    static public int PageDisplayNo;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            PackageEntities db = new PackageEntities();
            bindData(db.PackageDetails.ToList());
        }
        
        ISearch searchBox = PackageUtil.SearchInterface;
        if (searchBox != null)
        {
            searchBox.DoSearch += PkgSearched_pkgSearch;
        }
        if (Session["EventArgPackageSearch"] != null)
        {
            EventArgs et = (EventArgs)Session["EventArgPackageSearch"];
            Session.Remove("EventArgPackageSearch");
            PkgSearched_pkgSearch(sender, et);
        }
        
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
       
    }
    
    public void PkgSearched_pkgSearch(object sender, EventArgs e)
    {
        EventArgPackageSearch evt = (EventArgPackageSearch)e;
        package_found.Text = evt.packageList.Count().ToString() + " packages Found. ";
        //packageDisplay.Text = " Currently Displaying ";
        //if (!(evt.packageList.Count() > 10)) { packageDisplay.Text += evt.packageList.Count().ToString(); } else { packageDisplay.Text += "10"; }
        //var pi = typeof(PackageDetail).GetProperty(sortingList.SelectedValue);
        // var orderByAddress = items.OrderBy(x => pi.GetValue(x, null));
        //List<PackageDetail> data_packages = evt.packageList.OrderBy(x => pi.GetValue(x, null)).ToList();
        ViewState.Clear();
        wholeData = evt.packageList;
        bindData(evt.packageList);
    }
    protected void sortingList_SelectedIndexChanged(object sender, EventArgs e)
    {
        package_found.Text = wholeData.Count().ToString() + " packages Found. ";
        ViewState.Clear();
        bindData(wholeData);
    }
    public void bindData(List<PackageDetail> data)
    {

        if (data.Count() == 0)
        {
            Empty_Panel.Visible = true;
        }
        else
        {
            Empty_Panel.Visible = false;
        }
            PagedDataSource pageds = new PagedDataSource();
        wholeData = data;
        
        pageds.DataSource = wholeData;
        pageds.AllowPaging = true;
        pageds.PageSize = 8;
        if (ViewState["PageNumber"] != null) {
            pageds.CurrentPageIndex = Convert.ToInt32(ViewState["PageNumber"])-1;
        }
        else { 
            pageds.CurrentPageIndex = 0;
            ViewState["PageNumber"] = 1;
        }
        if (pageds.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList pages = new ArrayList();
            for (int i = 0; i < pageds.PageCount; i++)
                pages.Add((i + 1).ToString());
            NoOfPages =  pages.Count;

            PagedDataSource ListOfPages = new PagedDataSource();
            ListOfPages.DataSource = pages;
            ListOfPages.AllowPaging = true;
            ListOfPages.PageSize = 5;
            ListOfPages.CurrentPageIndex = ((pageds.CurrentPageIndex) / 5);
            rptPaging.DataSource = ListOfPages;//pages;
            rptPaging.DataBind();
         
        }
        else
        {
            rptPaging.Visible = false;
        }
        package_list.DataSource = pageds;
        package_list.DataBind();
        int selectedPage = pageds.CurrentPageIndex + 1;
       // packageUpdatePanel.Update();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "highlite_menu", "$('#PagingList').children('li[id=" + '"' + selectedPage + '"' +"]').addClass('active');", true);

    }
    protected void OnNextBack_clicked(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        int page = int.Parse(ViewState["PageNumber"].ToString());
        if (lb.ID == "nextButton" || lb.ID == "prevButton")
        {
            page = page + Convert.ToInt32(lb.CommandArgument);
            if (page <= NoOfPages && page > 0)
            { ViewState["PageNumber"] = page; }
            bindData(wholeData);
            WholeUpdatePanel.Update();
        }

    }
    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
         ViewState["PageNumber"] = Convert.ToInt32(e.CommandArgument);
        
       
       
        //PackageEntities db = new PackageEntities()
        bindData(wholeData); WholeUpdatePanel.Update();
    }
    protected void bookNowClicked(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        int id = int.Parse(b.CommandArgument);
        PackageEntities db = new PackageEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
       
            RepeaterItem ri = b.NamingContainer as RepeaterItem;
            string queryString = "";
            if (ri != null)
            {
                DropDownList dl_madina = (DropDownList)ri.FindControl("madinaAccom");
                DropDownList dl_makkah = (DropDownList)ri.FindControl("makkahAccom");
                queryString += "?AccomMakkahID=" + dl_makkah.SelectedValue;
                queryString += "&AccomMadinaID=" + dl_madina.SelectedValue;

            Response.Redirect("~/UmrahDetailPage/" + pd.Package.PackageName + "/umrahDetail" + queryString);
        }

    }
    protected void LoadMore_clicked(object sender, EventArgs e)
    {
        package_list.DataSource = wholeData;
        package_list.DataBind();
    }

    public void BindData()
    {

    }
   
    public void AccommodationMakkah_Changed(object sender, EventArgs e)
    {

        PackageEntities db = new PackageEntities();
        DropDownList dl = (DropDownList)sender;
        RepeaterItem ri = dl.NamingContainer as RepeaterItem;

        if(ri != null)
        {
            UpdatePanel panel = (UpdatePanel)ri.FindControl("packageUpdatePanel");
            DropDownList dl_madina=   (DropDownList)ri.FindControl("madinaAccom");
            DropDownList dl_makkah = (DropDownList)ri.FindControl("makkahAccom");
            Button bt = (Button)ri.FindControl("bookNow");
            int pkgId = int.Parse(bt.CommandArgument);
              int accomID_makkah = int.Parse(dl_makkah.SelectedValue);
            Accommodation makkah = db.Accommodations.Where(q => q.id == accomID_makkah).First();
            Accommodation madina = new Accommodation();
            if (dl_madina.SelectedValue != "")
            {
                int accomID_madina = int.Parse(dl_madina.SelectedValue);
                madina = db.Accommodations.Where(q => q.id == accomID_madina).First();
            }
            PackageDetail pd = db.PackageDetails.Where(q => q.id == pkgId).First();
            double price = pd.getPriceWithout_accommodation + ((madina!=null? madina.price:0)*(pd.nightsInMadina)) + (makkah.price*pd.nightsInMakkah);
            Label lb = (Label)ri.FindControl("price");
            lb.Text = price.ToString("#,##0");
        
        int selectedPage = int.Parse(ViewState["PageNumber"].ToString());
        ScriptManager.RegisterStartupScript(panel, panel.GetType(), "highlite_menu", "$('#PagingList').children('li[id=" + '"' + selectedPage + '"' + "]').addClass('active');", true);
        }


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

    protected void rptPaging_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
     //int currentPage =    int.Parse(ViewState["PageNumber"].ToString());
     //   LinkButton lb = e.Item.FindControl("nextButton") as LinkButton;
     //   LinkButton prev = e.Item.FindControl("prevButton") as LinkButton;
     //   if (lb!= null) { 
     //       if(currentPage == NoOfPages) { lb.Enabled = false; }
     //   ScriptManager.GetCurrent(Page).RegisterAsyncPostBackControl(lb);
     //   }
     //   if (prev != null)
     //   {
     //       if (currentPage == 1) { prev.Enabled = false; }
     //       ScriptManager.GetCurrent(Page).RegisterAsyncPostBackControl(prev);
     //   }
    }

    protected void package_list_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //ScriptManager sp = (ScriptManager) Page.FindControl("ScriptManager1");
        //UpdatePanel up = (UpdatePanel)e.Item.FindControl("packageUpdatePanel");
        ////sp.RegisterAsyncPostBackControl((e.Item.FindControl("madinaAccom") as DropDownList));
        ////sp.RegisterAsyncPostBackControl((e.Item.FindControl("makkahAccom") as DropDownList));
        //if (e.Item.FindControl("madinaAccom") != null)
        //{
        //    AsyncPostBackTrigger apbt = new AsyncPostBackTrigger();
        //    apbt.ControlID = e.Item.FindControl("madinaAccom").UniqueID;
        //    apbt.EventName = "SelectedIndexChanged";
        //    up.Triggers.Add(apbt);
        //}
        //if (e.Item.FindControl("makkahAccom") != null)
        //{
        //    AsyncPostBackTrigger apbt = new AsyncPostBackTrigger();
        //    apbt.ControlID = e.Item.FindControl("makkahAccom").UniqueID;
        //    apbt.EventName = "SelectedIndexChanged";
        //    up.Triggers.Add(apbt);
        //}

    }

    protected void LastButton_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        if (lb.ID == "LastButton" )
        {
           
            { ViewState["PageNumber"] = NoOfPages; }
            bindData(wholeData);
            WholeUpdatePanel.Update();
        }
        
    }

    protected void FirstButton_Click(object sender, EventArgs e)
    {


        LinkButton lb = (LinkButton)sender;
        if (lb.ID == "FirstButton")
        {

            { ViewState["PageNumber"] = 1; }
            bindData(wholeData);
            WholeUpdatePanel.Update();
        }
    }
}