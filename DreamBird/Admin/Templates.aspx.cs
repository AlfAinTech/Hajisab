using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Templates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void TemplateList_TemplateClicked(object sender, EventArgs e)
    {
        EventArgControlSearch evt = (EventArgControlSearch)e;
        string layoutContent = evt.SearchKeyword;
        string layoutname = evt.LayoutName;
        LayoutBuilder.SetLayout(layoutContent, layoutname);
    }
}