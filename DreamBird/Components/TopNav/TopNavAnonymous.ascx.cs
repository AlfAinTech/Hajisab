using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TopNav_TopNavAnonymous : System.Web.UI.UserControl,ICoreDreamControl
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
    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
    }

}