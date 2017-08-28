﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_OfferedPackages_BudgetPackages_ListView : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string type = "bronze";
            ViewState["budgetType"] = type;
            BindData(type);

            ScriptManager.RegisterStartupScript(Page, typeof(Page), "setClass", "setClass('"+type+"');", true);

        }
    }

    protected void BindData(string PackageType)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        Packages_DetailList.DataSource = db.PackageDetails.Where(q => q.packageType.ToLower() == PackageType.ToLower()).Take(3).ToList();
        Packages_DetailList.DataBind();

    }
    protected void BookNowClicked(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        int id = int.Parse(bt.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        Response.Redirect("/UmrahHome/" + pd.Dream.DreamName + "/UmrahDetail");
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

    }
    protected void Explore_ButtonClicked(object sender, EventArgs e)
    {
        if(ViewState["budgetType"] != null)
        {
            string PackaType = ViewState["budgetType"].ToString();
            DreamBirdEntities db = new DreamBirdEntities();
            PackageDetail pd = db.PackageDetails.Where(q => q.packageType == PackaType).ToList().OrderBy(q => q.minRange).First();
            string dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            Response.Redirect("/Umrahhome/" + dreamName + "/SearchFilter?minPrice=" + pd.minAmount);
        }
    }
   
}