using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_headerFooter_UmrahChatheader : System.Web.UI.UserControl,ICoreDreamControl
{
    public void BindData()
    {
       // throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
       // throw new NotImplementedException();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void learn_moreClicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        string dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        Response.Redirect("/Umrahhome/" + dreamName + "/SearchFilter");
    }
}