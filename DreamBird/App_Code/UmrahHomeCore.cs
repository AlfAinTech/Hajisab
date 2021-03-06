﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for UmrahHomeCore
/// </summary>
public class UmrahHomeCore : System.Web.UI.Page
{
    public UmrahHomeCore()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    protected override void OnPreInit(EventArgs e)
    {
        if (DreamUtil.isContainDreamPage(Request.RawUrl))
        {
            String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);

            String controlName = "LayoutControl_" + dreamName + "_" + pageName + ".ascx";
            try
            {
                Control layoutControl = Page.LoadControl(controlName);
                Control placeHolder = Page.FindControl("body_content");
                if (placeHolder != null)
                {
                    placeHolder.Controls.Add(layoutControl);


                }

            }
            catch (Exception ex)
            {

                Console.Write("Control not found");
                Response.Redirect("~/UmrahHome.aspx");
            }

            //The name of place holder that should be inside the Aspx file.


        }

    }
}