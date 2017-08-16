using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamPageDesign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int PageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
        DreamPageDesign.EditDataBind(PageID);
    }
}