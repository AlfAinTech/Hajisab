﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class UmrahHome : UmrahHomeCore
{
    override protected void OnInit(EventArgs e)
    {
        //ScriptManager1.SupportsPartialRendering = true;
        //base.OnInit(e);


    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
			 ScriptManager.RegisterStartupScript(Page, typeof(Page), "alertload", "console.log('here');", true);
            //Page.Header.DataBind();
            //ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "Initialize();", true);
            //RedirectDefault();
            PackageEntities db = new PackageEntities();
            List<string> metaTags = db.Packages.Select(q => q.PackageName).ToList();
            Page.MetaKeywords = string.Join(",", metaTags);
            //Page.MetaDescription = db.Packages.Where(w => w. == dreamName).Select(s => s.Description).First();
        }




    }
    //private void DrapDropAdminPanel() {

    //String dragDropControlPath = "~/Components/DragDropFramework/DDFramework.ascx";
    //Control control = LoadControl(dragDropControlPath);
    //placeHolderDragDrop.Controls.AddAt(0, control);

    //}



    //private void RedirectDefault()
    //{

    //    string defaultDreamName = "Home";
    //    string defaultPageName = "Default";

    //    string dreamName = PackageUtil.getPackageNameFromURL(Request.RawUrl);
    //    string pageName = PackageUtil.getPageNameFromURL(Request.RawUrl);

    //    PackageEntities db = new PackageEntities();
    //    bool isAllowed = false;
    //    int count = 0;
    //    if (db.DreamLayouts.Any(w => w.Page == pageName && w.Dream.DreamName == dreamName))
    //    {
    //        DreamLayout dreamLayout = db.DreamLayouts.Where(w => w.Page == pageName && w.Dream.DreamName == dreamName).First();
    //        List<DreamPageAuthorization> RolesList = new List<DreamPageAuthorization>();
    //        if (db.DreamPageAuthorizations.Any(a => a.DreamLayout_id == dreamLayout.id))
    //        {
    //            RolesList = db.DreamPageAuthorizations.Where(a => a.DreamLayout_id == dreamLayout.id).ToList();
    //        }
    //        if (!HttpContext.Current.User.Identity.IsAuthenticated)
    //        {
    //            if (RolesList.Any(a => a.PageRole == "AnonymousUser" && a.isAllowed == true) && dreamLayout.IsPublished == true)
    //            {
    //                count = db.DreamLayouts.Where(dl => dl.Dream.DreamName == dreamName && dl.Page == pageName && dl.Dream.IsPublished && dl.IsPublished).ToList().Count;
    //            }
    //        }
    //        else
    //        {
    //            if (HttpContext.Current.User.IsInRole("Admin"))
    //            {
    //                count = db.DreamLayouts.Where(dl => dl.Dream.DreamName == dreamName && dl.Page == pageName).ToList().Count;
    //            }
    //            else
    //            {
                  
    //            }
    //        }
    //        if (isAllowed)
    //        {
    //            count = db.DreamLayouts.Where(dl => dl.Dream.DreamName == dreamName && dl.Page == pageName && dl.Dream.IsPublished && dl.IsPublished).ToList().Count;
    //        }
    //    }
    //    if (count == 0)
    //    {
    //        var default_dreams = db.DreamLayouts.Where(dl => dl.Dream.IsDefault == true).ToList();
    //        if (default_dreams.Count == 0)
    //        {
    //            Dream dd = new Dream
    //            { DreamName = "Home", IsDefault = true, IsPublished = true, };
    //            db.Dreams.Add(dd);
    //            db.SaveChanges();
    //            //public DefaultPage
    //            DreamLayout dl = new DreamLayout
    //            { DreamID = dd.id, Layout = "Add Content here", Page = "Home", IsPublicDefaultPage = true, IsUserDefaultPage = false, };
    //            //User DefaultPage
    //            DreamLayout dl2 = new DreamLayout
    //            { DreamID = dd.id, Layout = "Add Content here", Page = "Default", IsPublicDefaultPage = false, IsUserDefaultPage = true, };
    //            db.DreamLayouts.Add(dl);
    //            db.DreamLayouts.Add(dl2);
    //            db.SaveChanges();
    //        }
    //        else
    //        {
    //            default_dreams[0].Dream.IsDefault = true;
    //            defaultDreamName = default_dreams[0].Dream.DreamName;
    //            defaultPageName = default_dreams[0].Page;


    //        }
    //        String redirectURL = String.Format("~/UmrahHome.aspx/{0}/{1}", defaultDreamName, defaultPageName);
    //        Response.Redirect(redirectURL);
    //    }

    //}
}