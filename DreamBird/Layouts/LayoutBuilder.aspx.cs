using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Layouts_LayoutBuilder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }

    [WebMethod]
    public static string SaveLayout(string LayoutName, string ContentRatio, string incheader, string incfooter)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        bool inch = false;
        bool incf = false;
        if (incheader.Equals("on"))
        {
            inch = true;
        }
        else
        {
            inch = false;
        }

        if (incfooter.Equals("on"))
        {
            incf = true;
        }
        else
        {
            incf = false;
        }

        DynamicLayout dl = new DynamicLayout();
        dl.Name = LayoutName;
        dl.Header = inch;
        dl.Footer = incf;
        dl.ContentRatio = ContentRatio;

        db.DynamicLayouts.Add(dl);
        db.SaveChanges();
        return "Success";
    }
}