using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_booking_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if((!IsPostBack)&& Request.QueryString["isCustomPackage"] !=null)
        {
            Boolean flag = Boolean.Parse(Request.QueryString["isCustomPackage"].ToString());
            
                PackagediscountDetail.isCustomPackage = flag;
            
        }

    }
}