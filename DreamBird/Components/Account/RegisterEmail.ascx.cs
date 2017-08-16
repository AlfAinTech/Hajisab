using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Account_RegisterEmail : System.Web.UI.UserControl,ICoreDreamControl
{
    public void BindData()
    {
       
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
      
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
       
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void register_linkBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Components/Account/Loginsetting.aspx?Page=register");
    }
}