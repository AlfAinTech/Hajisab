using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Header_LoginRegisterHeader : System.Web.UI.UserControl,ICoreDreamControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void sign_in_Click(object sender, EventArgs e)
    {
        Response.Redirect("../../Components/Account/LoginSetting.aspx?Page=login");
    }

    protected void register_link_Click(object sender, EventArgs e)
    {
        Response.Redirect("../../Components/Account/LoginSetting.aspx?Page=register");
    }

    public void BindData()
    {
       
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
      
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
      
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
       
    }
}