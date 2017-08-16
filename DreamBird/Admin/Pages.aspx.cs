using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Pages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated && HttpContext.Current.User.Identity.Name == "admin"))
        {
            Response.Redirect("~/Components/Account/LoginSetting.aspx");
        }
    }

    protected void AddControlCategory_CategoryAdded(object sender, EventArgs e)
    {
        ControlsList.BindData();
    }
    protected void ControlAdded(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "closeModal", "$('#AddsControls').modal('hide');", true);
        ControlsList.BindData();
    }
}