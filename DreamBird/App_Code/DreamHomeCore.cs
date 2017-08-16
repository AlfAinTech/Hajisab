using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for DreamHomeCore
/// </summary>
public class DreamHomeCore : System.Web.UI.Page
{
    public DreamHomeCore()
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
            string PageSize = "FullPage";
            if(Request.QueryString.HasKeys() && Request.QueryString["PageNumber"] != null)
            {
                PageSize = Request.QueryString["PageNumber"].ToString();
            }
            String controlName = "LayoutControl_" + dreamName + "_" + pageName + ".ascx"/*?Slide="+ PageNumber*/;
            try {
                Control layoutControl = Page.LoadControl(controlName);
                UserControl control = Page.FindControl("HomeControl") as UserControl;
                IHomeControl MyHomeControl = control as IHomeControl;
                MyHomeControl.SetControls(layoutControl, PageSize);
            }
            catch (Exception ex)
            {
                
                Console.Write("Control not found");
                Response.Redirect("~/DreamHome.aspx");
            }
         
            //The name of place holder that should be inside the Aspx file.
        

        }

    }
}