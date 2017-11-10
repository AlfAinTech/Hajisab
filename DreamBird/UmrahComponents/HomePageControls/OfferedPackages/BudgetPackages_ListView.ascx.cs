using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_OfferedPackages_BudgetPackages_ListView : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string type = "bronze";
            hiddenBudgetType.Value = type;
            //  BindData(type);
             bindInitialPrice();
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "setClass", "setClass('"+type+ "');LoadScript('" + type + "');", true);
      //      ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
        }
        

    }

   
    protected void bindInitialPrice()
    {
        PackageEntities db = new PackageEntities();
        var data =  db.PackageDetails.Select(q => new { q.packageType, q.minRange }).GroupBy(q => q.packageType).ToList();

        bronzePrcie.Text = data.Where(q => q.Key.ToLower() == "bronze").Select(group => group.Min(x => x.minRange)).FirstOrDefault().ToString("#,##0");
        silverPrice.Text = data.Where(q => q.Key.ToLower() == "silver").Select(group => group.Min(x => x.minRange)).FirstOrDefault().ToString("#,##0");
        goldPrice.Text = data.Where(q => q.Key.ToLower() == "gold").Select(group => group.Min(x => x.minRange)).FirstOrDefault().ToString("#,##0");


    }
    protected void BindData(string PackageType)
    {
        PackageEntities db = new PackageEntities();
        // Packages_DetailList.DataSource = db.PackageDetails.Where(q => q.packageType.ToLower() == PackageType.ToLower()).Take(3).ToList();
        // Packages_DetailList.DataBind();
      var data=   db.PackageDetails.Select(q=>new { q.minRange, q.packageType }).GroupBy(q => q.packageType).ToList();

    }
    protected void BookNowClicked(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        int id = int.Parse( Request["__EVENTARGUMENT"]); 
        PackageEntities db = new PackageEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        Response.Redirect("/UmrahDetailPage/" + pd.Package.PackageName + "/UmrahDetail");
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "setClass", "setClass(' bronze');LoadScript('bronze ');", true);
    }
    
    protected void PackageType_clicked(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        string PackageType = lb.CommandArgument.ToString();
        ViewState["budgetType"] = PackageType; 
        BindData(PackageType);
        //UpdatePanel1.Update();
      //Boolean flag =   ScriptManager.GetCurrent(Page).IsInAsyncPostBack;
        UpdatePanel up = ((UpdatePanel)Page.FindControl("baseUpdatePanel"));
      //  up.Update();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "setClass", "setClass('" + PackageType + "');", true);
     //   ScriptManager.RegisterStartupScript(Page, typeof(Page), "mystar", "$('.stars').stars();", true);
    }
    protected void Explore_ButtonClicked(object sender, EventArgs e)
    {
        if(hiddenBudgetType.Value != "")
        {
            string PackaType = hiddenBudgetType.Value.ToString();
            PackageEntities db = new PackageEntities();
            PackageDetail pd = db.PackageDetails.Where(q => q.packageType == PackaType).ToList().OrderBy(q => q.minRange).First();
          //  string dreamName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
            Response.Redirect("/UmrahSearchFilter?Type=" + pd.packageType.ToString());
        }
    }
   
}