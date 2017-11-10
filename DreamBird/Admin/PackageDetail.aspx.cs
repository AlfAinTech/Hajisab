using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PackageDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.QueryString.HasKeys())
            {
                int packageID = Convert.ToInt32(Request.QueryString["DID"].ToString());
                package_idss.Text = packageID.ToString();
                PackageEntities db = new PackageEntities();
                var Package = db.Packages.Where(w => w.id == packageID).First();
                package_name.Text = Package.PackageName;
                package_basic_info.NavigateUrl = "../../Components/Packages/PackageAdminPages.aspx?DID=" +packageID;
                if(Package.PackageTypeID == 2)
                {
                    UmrahDetails.Visible = true;
                    UmrahDetails.NavigateUrl = "../../Components/Packages/UmrahDetails.aspx?DID=" + packageID;
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "openInfo", "OpenUmrahDetail('"+ "../../Components/Packages/UmrahDetails.aspx?DID=" + packageID + "')", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "openInfo", "OpenUmrahDetail('" + "../../Components/DreamsPackageAdminPages?DID=" + packageID + "')", true);

                }
                var pageids = db.DreamLayouts.Where(w => w.DreamID == packageID).Select<DreamLayout, int?>(s => s.id).ToList();
                //var lessonMenuPages = db.LessonMenus.Where(w => pageids.Contains(w.ParentLayoutID)).Select<LessonMenu, int?>(s => s.DreamLayoutID).ToList();
                
                //dream_pages.DataSource = db.DreamLayouts.Where(q => q.DreamID == DreamID && !lessonMenuPages.Contains(q.id) && q.LayoutType == "Normal").ToList();
                //dream_pages.DataBind();
                //Repeater1.DataSource = db.DreamLayouts.Where(q => q.DreamID == DreamID && !lessonMenuPages.Contains(q.id) && q.LayoutType == "Activity").ToList();
                //Repeater1.DataBind();
                //DreamPageListView.BindData(Dream.id);
            }
        }
    }

    //protected void dream_name_Click(object sender, EventArgs e)
    //{
    //    int DreamID = Convert.ToInt32(dream_name.CommandName);
    //    PackageEntities db = new PackageEntities();
    //    Control UserControl = LoadControl("~/Components/Packages/DreamBasicInfo.ascx");
    //    IPackageEdit BasicInfo = UserControl as IPackageEdit;
    //    BasicInfo.EditDataBind(DreamID);
    //    content_items.Controls.Clear();
    //    content_items.Controls.Add(UserControl);
    //}

    protected void DreamPageClicked(object sender, EventArgs e)
    {
        //EventArgPackageEdit evt = e as EventArgPackageEdit;
        //int PageID = evt.PackageEditID;
        //Control UserControl = LoadControl("~/Components/Packages/DreamPageDesign.ascx");
        //IPackageEdit edit = UserControl as IPackageEdit;
        //edit.EditDataBind(PageID);
        //content_items.Controls.Clear();
        //content_items.Controls.Add(UserControl);
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_iframe", "$('.page_frame').css('display', 'none'); $('#content_item').css('display', 'block');", true);
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_highlite_button", "$('a[data-pageid=" + '"' + PageID + '"' + "]').removeClass('btn-default').addClass('btn-primary active');", true);
    }

    protected void add_new_page_server_ServerClick(object sender, EventArgs e)
    {
        //Control UserControl = LoadControl("~/Components/Packages/DreamPageDesign.ascx");
        //content_items.Controls.Clear();
        //content_items.Controls.Add(UserControl);
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_iframe", "$('.page_frame').css('display', 'none'); $('#content_item').css('display', 'block');", true);

    }

    protected void page_name_Click(object sender, EventArgs e)
    {
        //LinkButton lb = sender as LinkButton;
        //int PageID = Convert.ToInt32(lb.Attributes["data-pageid"].ToString());
        //Control UserControl = LoadControl("~/Components/Packages/DreamPageDesign.ascx");
        //IPackageEdit edit = UserControl as IPackageEdit;
        //edit.EditDataBind(PageID);
        //content_items.Controls.Clear();
        //content_items.Controls.Add(UserControl);
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_iframe", "$('.page_frame').css('display', 'none'); $('#content_item').css('display', 'block');", true);
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_highlite_button", "$('a[data-pageid=" + '"' + PageID + '"' + "]').removeClass('btn-default').addClass('btn-primary active');", true);
        //PackageEntities db = new PackageEntities();
        //dream_name.Text = db.DreamLayouts.Where(w => w.id == PageID).Select(s => s.Dream.PackageName + " > " + s.Page).First();
    }

    protected void btn_refresh_pages_Click(object sender, EventArgs e)
    {
        int packageID = Convert.ToInt32(Request.QueryString["DID"].ToString());
        PackageEntities db = new PackageEntities();
        var pageids = db.DreamLayouts.Where(w => w.DreamID == packageID).Select<DreamLayout, int?>(s => s.id).ToList();
        //var lessonMenuPages = db.LessonMenus.Where(w => pageids.Contains(w.ParentLayoutID)).Select<LessonMenu, int?>(s => s.DreamLayoutID).ToList();
        //dream_pages.DataSource = db.DreamLayouts.Where(q => q.DreamID == DreamID && !lessonMenuPages.Contains(q.id)).ToList();
        //dream_pages.DataBind();
        //Repeater1.DataSource = db.DreamLayouts.Where(q => q.DreamID == DreamID && !lessonMenuPages.Contains(q.id)).ToList();
        //Repeater1.DataBind();
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        HyperLink hplink = e.Item.FindControl("page_name") as HyperLink;
        string PageID = hplink.Attributes["data-pageid"].ToString();
        hplink.NavigateUrl = "../../Components/LessonMenu/LessonMenuAdminPage.aspx?PID=" + PageID;
    }

    protected void dream_pages_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        HyperLink hplink = e.Item.FindControl("page_name") as HyperLink;
        string PageID = hplink.Attributes["data-pageid"].ToString();
        hplink.NavigateUrl = "../../Components/Packages/NormalPageLayout.aspx?PID=" + PageID;
    }

    protected void save_new_page_button_ServerClick(object sender, EventArgs e)
    {
        //PackageEntities db = new PackageEntities();
        //int DreamID = Convert.ToInt32(Request.QueryString["DID"].ToString());
        //string PageType = "";
        //if (IsActivity.Checked)
        //    PageType = "Activity";
        //else
        //    PageType = "Normal";

        //string PageName = New_Page_Name.Text;
        //if(PageName == "")
        //{
        //    ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script_alert", "alert('Page Name cannot be empty')", true);
        //}
        //else
        //{
        //    if (db.DreamLayouts.Any(a => a.Page == PageName && a.DreamID == DreamID))
        //    {
        //        ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script_alert", "alert('Page with this name already exist')", true);
        //    }
        //    else
        //    {
        //        DreamLayout layout = new DreamLayout();
        //        layout.Page = PageName;
        //        layout.DreamID = Convert.ToInt32(DreamID);
        //        layout.IsPublished = false;
        //        layout.IsUserDefaultPage = false;
        //        layout.IsPublished = false;
        //        layout.IsPublicDefaultPage = false;
        //        layout.LayoutType = PageType;
        //        layout.Layout = "Hello World";
        //        layout.IsActive = false;
        //        db.DreamLayouts.Add(layout);
        //        db.SaveChanges();

        //        if (PageType == "Activity")
        //        {
        //            ClientLayout clayout = db.ClientLayouts.Where(w => w.layoutName == "Activity").First();
        //            ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_save_data", "RetriveLayout('"+clayout.layoutName+"', '"+layout.Page+"', '"+layout.DreamID+"')", true);
        //        }
        //        var pageids = db.DreamLayouts.Where(w => w.DreamID == DreamID).Select<DreamLayout, int?>(s => s.id).ToList();
        //        //var lessonMenuPages = db.LessonMenus.Where(w => pageids.Contains(w.ParentLayoutID)).Select<LessonMenu, int?>(s => s.DreamLayoutID).ToList();
                //dream_pages.DataSource = db.DreamLayouts.Where(q => q.DreamID == DreamID && !lessonMenuPages.Contains(q.id) && q.LayoutType == "Normal").ToList();
                //dream_pages.DataBind();
                //Repeater1.DataSource = db.DreamLayouts.Where(q => q.DreamID == DreamID && !lessonMenuPages.Contains(q.id) && q.LayoutType == "Activity").ToList();
                //Repeater1.DataBind();
        //    }
            
        //}
        
    }
}