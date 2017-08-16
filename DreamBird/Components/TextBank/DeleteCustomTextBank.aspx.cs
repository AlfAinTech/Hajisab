using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_DeleteCustomTextBank : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "", "window.close();", true);
        }
    }
}