using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_LayoutBuilder : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void SetLayout(string LayoutContent, string LayoutName)
    {
        working_area.InnerHtml = LayoutContent;
        layout_name.Value = LayoutName;
        ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "load_Script_pb", "LoadTemplateScripts($);", true);
    }
}